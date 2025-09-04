import 'dart:async';
import 'dart:convert';
import 'dart:typed_data';

import 'package:dio/dio.dart';
import 'package:meta/meta.dart';
import 'package:stripe/messages.dart';
import 'package:stripe/src/exceptions.dart';

/// The http client that will make requests to the stripe API.
abstract class Client {
  /// Makes a POST request to the Stripe API
  Future<Map<String, dynamic>> post(
    final Uri url, {
    final Map<String, dynamic>? data,
    final String? idempotencyKey,
  });

  /// Makes a DELETE request to the Stripe API
  Future<Map<String, dynamic>> delete(
    final Uri url, {
    final Map<String, dynamic>? data,
    final String? idempotencyKey,
  });

  /// Makes a GET request to the Stripe API
  Future<Map<String, dynamic>> get(
    final Uri url, {
    String? idempotencyKey,
    Map<String, dynamic>? queryParameters,
  });

  /// Makes a GET request to the Stripe API, returns plain body
  Future<String> getPlain(
    final Uri url, {
    String? idempotencyKey,
    Map<String, dynamic>? queryParameters,
  });

  /// Makes a GET request to the Stripe API, returns body bytes
  Future<Uint8List> getBytes(
    final Uri url, {
    String? idempotencyKey,
    Map<String, dynamic>? queryParameters,
  });

  @protected
  T processResponse<T>({
    required int? statusCode,
    required Object? data,
  }) {
    if (statusCode != 200) {
      final Map<String, dynamic>? bodyJson;

      if (data is Map<String, dynamic>) {
        bodyJson = data;
      } else if (data is String) {
        bodyJson = jsonDecode(data);
      } else if (data is List<int>) {
        final body = utf8.decode(data);
        bodyJson = jsonDecode(body);
      } else {
        bodyJson = null;
      }

      if (bodyJson == null || bodyJson['error'] == null) {
        throw InvalidRequestException(
          'The status code returned was $statusCode but no error was provided.',
          statusCode: statusCode,
        );
      }
      final errorJson = bodyJson['error'] as Map<String, dynamic>;
      final error = StripeApiError.fromJson(errorJson);

      switch (error.type) {
        case StripeApiErrorType.invalidRequestError:
          throw InvalidRequestException(
            error.message.toString(),
            statusCode: statusCode,
            error: error,
          );
        default:
          throw UnknownTypeException(
            'The status code returned was $statusCode but the error '
            'type is unknown.',
            statusCode: statusCode,
            error: error,
          );
      }
    }

    if (data is T) return data;

    throw InvalidRequestException(
      'The returned data was unparsable ($data).',
      statusCode: statusCode,
    );
  }
}

/// The http client implementation that will make requests to the stripe API.
///
/// Internally this uses a [Dio] http client.
class DioClient extends Client {
  final String version;
  final String apiKey;

  /// Creates a [Dio] client that will make requests to [baseUrl].
  factory DioClient({
    required String apiKey,
    required String version,
  }) =>
      DioClient.withDio(
        Dio(),
        version: version,
        apiKey: apiKey,
      );

  @visibleForTesting
  DioClient.withDio(
    this.dio, {
    required this.apiKey,
    required this.version,
  }) {
    dio.transformer = FormDataTransformer();
    dio.options
      ..responseType = ResponseType.json
      ..contentType = 'application/x-www-form-urlencoded'
      ..headers = {
        'Authorization': 'Basic ${base64Encode(utf8.encode('$apiKey:'))}',
        'Stripe-Version': version,
        'Content-Type': 'application/x-www-form-urlencoded',
      };
  }

  /// The actual [Dio] instance that makes the request. You shouldn't need to
  /// access this.
  @visibleForTesting
  final Dio dio;

  /// Makes a post request to the Stripe API
  @override
  Future<Map<String, dynamic>> post(
    final Uri url, {
    final Map<String, dynamic>? data,
    final String? idempotencyKey,
  }) async {
    try {
      final response = await dio.post<Map<String, dynamic>>(url.toString(),
          data: data,
          options: _createRequestOptions(idempotencyKey: idempotencyKey));
      return _processDioResponse(response);
    } on DioException catch (e) {
      var message = e.message ?? '';
      if (e.response?.data != null) {
        message += '${e.response!.data}';
      }
      throw InvalidRequestException(
        message,
        statusCode: e.response?.statusCode,
      );
    }
  }

  /// Makes a DELETE request to the Stripe API
  @override
  Future<Map<String, dynamic>> delete(
    final Uri url, {
    final Map<String, dynamic>? data,
    final String? idempotencyKey,
  }) async {
    try {
      final response = await dio.delete<Map<String, dynamic>>(url.toString(),
          data: data,
          options: _createRequestOptions(idempotencyKey: idempotencyKey));
      return _processDioResponse(response);
    } on DioException catch (e) {
      var message = e.message ?? '';
      if (e.response?.data != null) {
        message += '${e.response!.data}';
      }
      throw InvalidRequestException(
        message,
        statusCode: e.response?.statusCode,
      );
    }
  }

  /// Makes a get request to the Stripe API
  @override
  Future<Map<String, dynamic>> get(
    final Uri url, {
    String? idempotencyKey,
    Map<String, dynamic>? queryParameters,
  }) async {
    final response = await dio.get<Map<String, dynamic>>(
      url.toString(),
      queryParameters: queryParameters,
      options: _createRequestOptions(idempotencyKey: idempotencyKey),
    );
    return _processDioResponse(response);
  }

  /// Makes a GET request to the Stripe API, returns plain body
  @override
  Future<String> getPlain(
    final Uri url, {
    String? idempotencyKey,
    Map<String, dynamic>? queryParameters,
  }) async {
    final response = await dio.get<String>(
      url.toString(),
      queryParameters: queryParameters,
      options: _createRequestOptions(
        idempotencyKey: idempotencyKey,
        responseType: ResponseType.plain,
      ),
    );
    return _processDioResponse(response);
  }

  /// Makes a get request to the Stripe API, returns body bytes.
  @override
  Future<Uint8List> getBytes(
    final Uri url, {
    String? idempotencyKey,
    Map<String, dynamic>? queryParameters,
  }) async {
    final response = await dio.get<Uint8List>(
      url.toString(),
      queryParameters: queryParameters,
      options: _createRequestOptions(
        idempotencyKey: idempotencyKey,
        responseType: ResponseType.bytes,
      ),
    );
    return _processDioResponse(response);
  }

  Options? _createRequestOptions({
    String? idempotencyKey,
    ResponseType? responseType,
  }) =>
      idempotencyKey == null &&
              (responseType == null || responseType == ResponseType.json)
          ? null
          : Options(
              headers: {
                'Idempotency-Key': idempotencyKey,
              },
              responseType: responseType,
              validateStatus: (_) => true,
            );

  T _processDioResponse<T>(
    Response<T> response,
  ) {
    return processResponse(
      statusCode: response.statusCode,
      data: response.data,
    );
  }
}

/// This converter is used by Dio to convert [List] objects to [Map] so they
/// are encoded properly for Stripe.
///
/// Stripe expects array to be submited like this: `some_field[0]=value` and not
/// `some_field=[value]`.
class FormDataTransformer extends BackgroundTransformer {
  void fixMap(Map object) {
    for (final key in object.keys) {
      var value = object[key];
      if (value is List) {
        object[key] = Map.fromIterables(
            List.generate(value.length, (index) => '$index'), value);
      }

      var newValue = object[key];
      if (newValue is Map) {
        fixMap(newValue);
      }
    }
  }

  @override
  Future<String> transformRequest(RequestOptions options) async {
    if (options.data is Map) {
      fixMap(options.data);
    }
    return super.transformRequest(options);
  }
}
