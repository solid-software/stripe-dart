import 'package:stripe/messages.dart';
import 'package:stripe/src/expanded.dart';
import 'package:stripe/src/utils/expandable_fields/customer_expandable_field.dart';
import 'package:stripe/src/utils/expandable_fields/default_payment_method_expandable_field.dart';
import 'package:stripe/src/utils/expandable_fields/default_source_expandable_field.dart';
import 'package:stripe/src/utils/expandable_fields/discounts_expandable_field.dart';
import 'package:stripe/src/utils/expandable_fields/latest_invoice_expanded_expandable_field.dart';

class SubscriptionExpanded {
  final Subscription subscription;
  final List<Discount>? discounts;
  final InvoiceExpanded? latestInvoice;
  final Customer? customer;
  final PaymentMethod? defaultPaymentMethod;
  final Source? defaultSource;

  SubscriptionExpanded({
    required this.subscription,
    this.discounts,
    this.latestInvoice,
    this.customer,
    this.defaultPaymentMethod,
    this.defaultSource,
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
      latestInvoice = const LatestInvoiceExpandedExpandableField(
        expand: {InvoiceExpandableField.paymentIntent},
      ).extract(json);
    }

    Customer? customer;
    if (expand.contains(SubscriptionExpandableField.customer)) {
      customer = const CustomerExpandableField().extract(json);
    }

    PaymentMethod? defaultPaymentMethod;
    if (expand.contains(SubscriptionExpandableField.defaultPaymentMethod)) {
      defaultPaymentMethod =
          const DefaultPaymentMethodExpandableField().extract(json);
    }

    Source? defaultSource;
    if (expand.contains(SubscriptionExpandableField.defaultSource)) {
      defaultSource = const DefaultSourceExpandableField().extract(json);
    }

    return SubscriptionExpanded(
      subscription: Subscription.fromJson(json),
      discounts: discounts,
      latestInvoice: latestInvoice,
      customer: customer,
      defaultPaymentMethod: defaultPaymentMethod,
      defaultSource: defaultSource,
    );
  }
}
