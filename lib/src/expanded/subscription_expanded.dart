import 'package:stripe/messages.dart';
import 'package:stripe/src/expanded.dart';
import 'package:stripe/src/utils/expandable_fields/customer_expandable_field.dart';
import 'package:stripe/src/utils/expandable_fields/discounts_expandable_field.dart';
import 'package:stripe/src/utils/expandable_fields/latest_invoice_expandable_field.dart';

class SubscriptionExpanded {
  final Subscription subscription;
  final List<Discount>? discounts;
  final InvoiceExpanded? latestInvoice;
  final Customer? customer;

  SubscriptionExpanded({
    required this.subscription,
    this.discounts,
    this.latestInvoice,
    this.customer,
  });

  factory SubscriptionExpanded.fromJson(
    Map<String, dynamic> json,
    Set<SubscriptionExpandableField> expand,
  ) {
    List<Discount>? discounts;
    if (expand.contains(SubscriptionExpandableField.discounts)) {
      discounts = const DiscountsExpandableField().extract(json);
    }

    InvoiceExpanded? latestInvoice;
    if (expand.contains(SubscriptionExpandableField.latestInvoice)) {
      latestInvoice = const LatestInvoiceExpandableField(
       
      ).extract(json);
    }

    Customer? customer;
    if (expand.contains(SubscriptionExpandableField.customer)) {
      customer = const CustomerExpandableField().extract(json);
    }

    return SubscriptionExpanded(
      subscription: Subscription.fromJson(json),
      discounts: discounts,
      latestInvoice: latestInvoice,
      customer: customer,
    );
  }
}
