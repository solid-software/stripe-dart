import 'package:stripe/messages.dart';

/// Exceptions thrown by Stripe
abstract class StripeException implements Exception {
  final String message;
  final int? statusCode;
  final StripeApiError? error;

  StripeException(
    this.message, {
    this.statusCode,
    this.error,
  });
}

/// Invalid request errors arise when your request has invalid parameters.
class InvalidRequestException extends StripeException {
  InvalidRequestException(
    String message, {
    int? statusCode,
    StripeApiError? error,
  }) : super(message, statusCode: statusCode, error: error);

  @override
  String toString() => 'Invalid request: $message.';
}

/// For all API error responses where the type is unknown or not provided.
class UnknownTypeException extends StripeException {
  UnknownTypeException(
    String message, {
    int? statusCode,
    StripeApiError? error,
  }) : super(message, statusCode: statusCode, error: error);

  @override
  String toString() => 'Invalid type: $message.';
}

/// Invalid resource.
class InvalidResourceException extends StripeException {
  InvalidResourceException(
    String message, {
    int? statusCode,
    StripeApiError? error,
  }) : super(message, statusCode: statusCode, error: error);

  @override
  String toString() => 'Invalid resource: $message.';
}

class InvalidSignatureException extends StripeException {
  InvalidSignatureException(String message) : super(message);

  @override
  String toString() => 'Invalid signature: $message.';
}
