import 'package:json_annotation/json_annotation.dart';

/// https://docs.stripe.com/api/invoices/object#invoice_object-status
enum InvoiceStatus {
  /// The invoice isn’t ready to use. All invoices start in draft status.
  draft,

  /// The invoice is finalised and awaiting payment.
  open,

  /// This invoice is paid.
  paid,

  /// This invoice is cancelled.
  uncollectible,

  /// The customer is unlikely to pay the invoice. Normally, you treat it as
  /// bad debt in your accounting process.
  @JsonValue('void')
  voidStatus,
}
