import 'package:stripe/messages.dart';
import 'package:stripe/src/utils/expandable_fields/invoice_expandable_field.dart';

class InvoiceExpanded {
  final Invoice invoice;
  final PaymentIntent? paymentIntent;
  final List<Discount>? discounts;

  InvoiceExpanded({
    required this.invoice,
    this.paymentIntent,
    this.discounts,
  });

  factory InvoiceExpanded.fromJson(
    Map<String, dynamic> json, {
    InvoiceExpandableField? expand,
  }) {
    PaymentIntent? paymentIntent;
    if (expand?.paymentIntentExpansion != null) {
      paymentIntent = expand?.paymentIntentExpansion!.extract(json);
    }

    List<Discount>? discounts;
    if (expand?.discountsExpansion != null) {
      discounts = expand?.discountsExpansion!.extract(json);
    }

    return InvoiceExpanded(
      invoice: Invoice.fromJson(json),
      paymentIntent: paymentIntent,
      discounts: discounts,
    );
  }
}
