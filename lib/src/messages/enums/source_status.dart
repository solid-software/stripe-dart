import 'package:json_annotation/json_annotation.dart';

@Deprecated('''Stripe doesn't recommend using the deprecated Sources API.
We recommend that you adopt the PaymentMethods API.
This newer API provides access to our latest features and payment method types.
''')
enum SourceStatus {
  @JsonValue('canceled')
  canceled,
  @JsonValue('chargeable')
  chargeable,
  @JsonValue('consumed')
  consumed,
  @JsonValue('failed')
  failed,
  @JsonValue('pending')
  pending,
}
