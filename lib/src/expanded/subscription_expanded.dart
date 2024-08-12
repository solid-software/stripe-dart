import 'package:stripe/messages.dart';
import 'package:stripe/src/utils/expandable_fields/discounts_expandable_field.dart';

class SubscriptionExpanded {
  final Subscription subscription;
  final List<Discount>? discounts;

  SubscriptionExpanded({
    required this.subscription,
    this.discounts,
  });

  factory SubscriptionExpanded.fromJson(
    Map<String, dynamic> json,
    Set<SubscriptionExpandableField> expand,
  ) {
    List<Discount>? discounts;
    if (expand.contains(SubscriptionExpandableField.discounts)) {
      discounts = DiscountsExpandableField().extract(json);
    }

    return SubscriptionExpanded(
      subscription: Subscription.fromJson(json),
      discounts: discounts,
    );
  }
}
