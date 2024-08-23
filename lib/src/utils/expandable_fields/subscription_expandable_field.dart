// ignore_for_file: false
import 'package:stripe/messages.dart';
import 'package:stripe/src/expanded/customer_expanded.dart';
import 'package:stripe/src/expanded/invoice_expanded.dart';
import 'package:stripe/src/expanded/subscription_expanded.dart';
import 'package:stripe/src/utils/expandable_fields/customer_expandable_field.dart';
import 'package:stripe/src/utils/expandable_fields/discounts_expandable_field.dart';
import 'package:stripe/src/utils/expandable_fields/latest_invoice_expandable_field.dart';
import 'package:stripe/src/utils/expandable_object_field.dart';

class SubscriptionExpandableField
    extends ExpandableObjectField<SubscriptionExpanded> {
  DiscountsExpandableField? discountsExpansion;
  LatestInvoiceExpandableField? latestInvoiceExpansion;
  CustomerExpandableField? customerExpansion;

  SubscriptionExpandableField({
    this.discountsExpansion,
    this.latestInvoiceExpansion,
    this.customerExpansion,
  });

  @override
  String get field => 'customer';

  @override
  SubscriptionExpanded parse(Map<String, dynamic> object) {
    List<Discount>? discounts;
    if (discountsExpansion != null) {
      discounts = discountsExpansion!.extract(object);
    }

    InvoiceExpanded? latestInvoice;
    if (latestInvoiceExpansion != null) {
      latestInvoice = latestInvoiceExpansion!.extract(object);
    }

    CustomerExpanded? customer;
    if (customerExpansion != null) {
      customer = customerExpansion!.extract(object);
    }

    return SubscriptionExpanded(
      subscription: Subscription.fromJson(object),
      discounts: discounts,
      latestInvoice: latestInvoice,
      customer: customer,
    );
  }

  @override
  String replacement(SubscriptionExpanded parsedValue) =>
      parsedValue.subscription.id;
}
