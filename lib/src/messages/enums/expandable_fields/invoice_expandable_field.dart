import 'package:json_annotation/json_annotation.dart';

enum InvoiceExpandableField {
  @JsonValue('payment_intent')
  paymentIntent,
  @JsonValue('discounts')
  discounts,
}
