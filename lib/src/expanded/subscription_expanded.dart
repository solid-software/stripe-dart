import 'package:stripe/messages.dart';
import 'package:stripe/src/expanded.dart';
import 'package:stripe/src/utils/expandable_fields/discounts_expandable_field.dart';
import 'package:stripe/src/utils/expandable_fields/latest_invoice_expanded_expandable_field.dart';

class SubscriptionExpanded {
  final Subscription subscription;
  final List<Discount>? discounts;
  final InvoiceExpanded? latestInvoice;

  SubscriptionExpanded({
    required this.subscription,
    this.discounts,
    this.latestInvoice,
  });

  factory SubscriptionExpanded.fromJson(
    Map<String, dynamic> json,
    Set<SubscriptionExpandableField> expand,
  ) {
    List<Discount>? discounts;
    if (expand.contains(SubscriptionExpandableField.discounts)) {
      discounts = DiscountsExpandableField().extract(json);
    }

    InvoiceExpanded? latestInvoice;
    if (expand.contains(SubscriptionExpandableField.latestInvoice)) {
      latestInvoice = LatestInvoiceExpandedExpandableField(
        expand: {InvoiceExpandableField.paymentIntent},
      ).extract(json);
    }

    return SubscriptionExpanded(
      subscription: Subscription.fromJson(json),
      discounts: discounts,
      latestInvoice: latestInvoice,
    );
  }
}
