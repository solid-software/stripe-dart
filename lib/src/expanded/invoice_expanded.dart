import 'package:stripe/messages.dart';
import 'package:stripe/src/utils/expandable_fields/discounts_expandable_field.dart';
import 'package:stripe/src/utils/expandable_fields/invoice_confirmation_secret_expandable_field.dart';
import 'package:stripe/src/utils/expandable_fields/payment_intent_expandable_field.dart';

class InvoiceExpanded {
  final Invoice invoice;
  final PaymentIntent? paymentIntent;
  final List<Discount>? discounts;
  final InvoiceConfirmationSecret? confirmationSecret;

  InvoiceExpanded({
    required this.invoice,
    this.paymentIntent,
    this.discounts,
    this.confirmationSecret,
  });

  factory InvoiceExpanded.fromJson(
    Map<String, dynamic> json,
    Set<InvoiceExpandableField> expand,
  ) {
    PaymentIntent? paymentIntent;
    if (expand.contains(InvoiceExpandableField.paymentIntent)) {
      paymentIntent = PaymentIntentExpandableField().extract(json);
    }

    List<Discount>? discounts;
    if (expand.contains(InvoiceExpandableField.discounts)) {
      discounts = DiscountsExpandableField().extract(json);
    }

    InvoiceConfirmationSecret? confirmationSecret;
    if (expand.contains(InvoiceExpandableField.confirmationSecret)) {
      confirmationSecret =
          InvoiceConfirmationSecretExpandableField().extract(json);
    }

    return InvoiceExpanded(
      invoice: Invoice.fromJson(json),
      paymentIntent: paymentIntent,
      discounts: discounts,
      confirmationSecret: confirmationSecret,
    );
  }
}
