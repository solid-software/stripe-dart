import 'package:stripe/messages.dart';
import 'package:stripe/src/expanded/customer_expanded.dart';
import 'package:stripe/src/expanded/discount_expanded.dart';
import 'package:stripe/src/expanded/invoice_expanded.dart';
import 'package:stripe/src/expanded/subscription_expanded.dart';
import 'package:stripe/src/utils/expandable_fields/customer_expandable_field.dart';
import 'package:stripe/src/utils/expandable_fields/discounts_expandable_field.dart';
import 'package:stripe/src/utils/expandable_fields/latest_invoice_expandable_field.dart';
import 'package:stripe/src/utils/expandable_object_field.dart';

class SubscriptionExpandableField
    extends ExpandableObjectField<SubscriptionExpanded> {
  final DiscountsExpandableField? discountsExpansion;
  final LatestInvoiceExpandableField? latestInvoiceExpansion;
  final CustomerExpandableField? customerExpansion;

  const SubscriptionExpandableField({
    this.discountsExpansion,
    this.latestInvoiceExpansion,
    this.customerExpansion,
  });

  @override
  String get field => 'subscription';

  @override
  Iterable<String> get innerNestedFields => [
        ...?customerExpansion?.nestedFields,
        ...?latestInvoiceExpansion?.nestedFields,
        ...?discountsExpansion?.nestedFields,
      ];

  @override
  SubscriptionExpanded parse(Map<String, dynamic> object) {
    List<DiscountExpanded>? discounts;
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
