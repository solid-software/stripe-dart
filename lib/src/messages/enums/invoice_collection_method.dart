import 'package:json_annotation/json_annotation.dart';

/// https://docs.stripe.com/api/invoices/object#invoice_object-collection_method
enum InvoiceCollectionMethod {
  /// Attempt payment using the default source attached to the customer.
  @JsonValue('charge_automatically')
  chargeAutomatically,

  /// Email payment instructions to the customer.
  @JsonValue('send_invoice')
  sendInvoice,
}
