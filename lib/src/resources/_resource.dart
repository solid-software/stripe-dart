import 'dart:typed_data';

import 'package:meta/meta.dart';

import '../../messages.dart';
import '../client.dart';

abstract class Resource<T extends Message> {
  @protected
  final Client _client;

  Resource(this._client);

  @protected
  @visibleForOverriding
  String makeUrl(String path) {
    return path;
  }

  @protected
  Future<Map<String, dynamic>> get(final String path,
          {Map<String, dynamic>? queryParameters}) =>
      _client.get(makeUrl(path), queryParameters: queryParameters);

  @protected
  Future<String> getPlain(final String path,
          {Map<String, dynamic>? queryParameters}) =>
      _client.getPlain(makeUrl(path), queryParameters: queryParameters);

  @protected
  Future<Uint8List> getBytes(final String path,
          {Map<String, dynamic>? queryParameters}) =>
      _client.getBytes(makeUrl(path), queryParameters: queryParameters);

  @protected
  Future<Map<String, dynamic>> post(
    final String path, {
    final Map<String, dynamic>? data,
    String? idempotencyKey,
  }) =>
      _client.post(
        makeUrl(path),
        data: data,
        idempotencyKey: idempotencyKey,
      );

  @protected
  Future<Map<String, dynamic>> delete(final String path,
          {final Map<String, dynamic>? data}) =>
      _client.delete(makeUrl(path), data: data);
}
