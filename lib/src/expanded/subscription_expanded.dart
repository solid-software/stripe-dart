import 'package:stripe/messages.dart';

class SubscriptionExpanded {
  final Subscription subscription;
  final List<Discount>? discounts;

  SubscriptionExpanded({
    required this.subscription,
    this.discounts,
  });
}
