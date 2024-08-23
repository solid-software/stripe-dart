import 'package:stripe/messages.dart';
import 'package:stripe/src/expanded.dart';
import 'package:stripe/src/expanded/customer_expanded.dart';

class SubscriptionExpanded {
  final Subscription subscription;
  final List<Discount>? discounts;
  final InvoiceExpanded? latestInvoice;
  final CustomerExpanded? customer;

  SubscriptionExpanded({
    required this.subscription,
    this.discounts,
    this.latestInvoice,
    this.customer,
  });
}
