import 'dart:async';
import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:meta/meta.dart';
import 'package:stripe/messages.dart';
import 'package:stripe/src/exceptions.dart';

const _defaultUrl = 'https://api.stripe.com/v1/';
const _defaultVersion = '2020-08-27';

/// The http client that will make requests to the stripe API.
abstract class Client {
  /// Makes a post request to the Stripe API
  Future<Map<String, dynamic>> post(
    final String path, {
    final Map<String, dynamic>? data,
    final String? idempotencyKey,
  });

  /// Makes a DELETE request to the Stripe API
  Future<Map<String, dynamic>> delete(
    final String path, {
    final Map<String, dynamic>? data,
    final String? idempotencyKey,
  });

  /// Makes a get request to the Stripe API
  Future<Map<String, dynamic>> get(
    final String path, {
    String? idempotencyKey,
    Map<String, dynamic>? queryParameters,
  });

  @protected
  Map<String, dynamic> processResponse({
    required int? statusCode,
    required Object? data,
  }) {
    if (statusCode != 200) {
      if (data == null ||
          data is! Map<String, dynamic> ||
          data['error'] == null) {
        throw InvalidRequestException(
          'The status code returned was $statusCode but no error was provided.',
        );
      }
      final errorJson = data['error'] as Map<String, dynamic>;
      final error = StripeApiError.fromJson(errorJson);

      switch (error.type) {
        case StripeApiErrorType.invalidRequestError:
          throw InvalidRequestException(error.message.toString(), error: error);
        default:
          throw UnknownTypeException(
            'The status code returned was $statusCode but the error '
            'type is unknown.',
            error: error,
          );
      }
    }
    if (data == null || data is! Map<String, dynamic>) {
      throw InvalidRequestException(
          'The JSON returned was unparsable ($data).');
    }

    return data;
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
    String baseUrl = _defaultUrl,
    String version = _defaultVersion,
  }) =>
      DioClient.withDio(
        Dio(),
        baseUrl: baseUrl,
        version: version,
        apiKey: apiKey,
      );

  @visibleForTesting
  DioClient.withDio(
    this.dio, {
    required this.apiKey,
    String baseUrl = _defaultUrl,
    this.version = _defaultVersion,
  }) {
    dio.transformer = FormDataTransformer();
    dio.options
      ..baseUrl = baseUrl
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
    final String path, {
    final Map<String, dynamic>? data,
    final String? idempotencyKey,
  }) async {
    try {
      final response = await dio.post<Map<String, dynamic>>(path,
          data: data,
          options: _createRequestOptions(idempotencyKey: idempotencyKey));
      return _processDioResponse(response);
    } on DioException catch (e) {
      var message = e.message ?? '';
      if (e.response?.data != null) {
        message += '${e.response!.data}';
      }
      throw InvalidRequestException(message);
    }
  }

  /// Makes a DELETE request to the Stripe API
  @override
  Future<Map<String, dynamic>> delete(
    final String path, {
    final Map<String, dynamic>? data,
    final String? idempotencyKey,
  }) async {
    try {
      final response = await dio.delete<Map<String, dynamic>>(path,
          data: data,
          options: _createRequestOptions(idempotencyKey: idempotencyKey));
      return _processDioResponse(response);
    } on DioException catch (e) {
      var message = e.message ?? '';
      if (e.response?.data != null) {
        message += '${e.response!.data}';
      }
      throw InvalidRequestException(message);
    }
  }

  /// Makes a get request to the Stripe API
  @override
  Future<Map<String, dynamic>> get(
    final String path, {
    String? idempotencyKey,
    Map<String, dynamic>? queryParameters,
  }) async {
    final response = await dio.get<Map<String, dynamic>>(
      path,
      queryParameters: queryParameters,
      options: _createRequestOptions(idempotencyKey: idempotencyKey),
    );
    return _processDioResponse(response);
  }

  Options? _createRequestOptions({String? idempotencyKey}) =>
      idempotencyKey == null
          ? null
          : Options(headers: {'Idempotency-Key': idempotencyKey});

  Map<String, dynamic> _processDioResponse(
    Response<Map<String, dynamic>> response,
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
