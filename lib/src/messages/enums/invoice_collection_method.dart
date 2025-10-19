import 'package:json_annotation/json_annotation.dart';

enum InvoiceCollectionMethod {
  @JsonValue('charge_automatically')
  chargeAutomatically,
  @JsonValue('send_invoice')
  sendInvoice,
}
