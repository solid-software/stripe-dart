import 'package:stripe/messages.dart';
import 'package:stripe/src/messages/enums/expandable_fields/invoice_expandable_field.dart';
import 'package:stripe/src/utils/expandable_fields/payment_intent_expandable_field.dart';

class InvoiceExpanded {
  final Invoice invoice;
  final PaymentIntent? paymentIntent;

  InvoiceExpanded({
    required this.invoice,
    this.paymentIntent,
  });

  factory InvoiceExpanded.fromJson(
    Map<String, dynamic> json,
    Set<InvoiceExpandableField> expand,
  ) {
    PaymentIntent? paymentIntent;
    if (expand.contains(InvoiceExpandableField.paymentIntent)) {
      paymentIntent = PaymentIntentExpandableField().extract(json);
    }

    return InvoiceExpanded(
      invoice: Invoice.fromJson(json),
      paymentIntent: paymentIntent,
    );
  }
}
