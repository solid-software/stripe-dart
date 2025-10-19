import 'package:json_annotation/json_annotation.dart';

enum InvoiceBillingReason {
  manual,
  subscription,
  @JsonValue('subscription_create')
  subscriptionCreate,
  @JsonValue('subscription_cycle')
  subscriptionCycle,
  @JsonValue('subscription_threshold')
  subscriptionThreshold,
  @JsonValue('subscription_update')
  subscriptionUpdate,
  upcoming,
}
