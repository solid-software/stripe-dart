import 'package:stripe/messages.dart';

class InvoiceExpanded {
  final Invoice invoice;
  final PaymentIntent? paymentIntent;
  final List<Discount>? discounts;

  InvoiceExpanded({
    required this.invoice,
    this.paymentIntent,
    this.discounts,
  });
}
