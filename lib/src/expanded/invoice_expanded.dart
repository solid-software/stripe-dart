import 'package:stripe/messages.dart';
import 'package:stripe/src/expanded/discount_expanded.dart';

class InvoiceExpanded {
  final Invoice invoice;
  final PaymentIntent? paymentIntent;
  final List<DiscountExpanded>? discounts;

  InvoiceExpanded({
    required this.invoice,
    this.paymentIntent,
    this.discounts,
  });
}
