import 'package:json_annotation/json_annotation.dart';

/// https://docs.stripe.com/api/invoices/object#invoice_object-billing_reason
enum InvoiceBillingReason {
  /// Unrelated to a subscription, for example, created via the invoice editor.
  manual,

  /// No longer in use. Applies to subscriptions from before May 2018 where no
  /// distinction was made between updates, cycles, and thresholds.
  subscription,

  /// A new subscription was created.
  @JsonValue('subscription_create')
  subscriptionCreate,

  /// A subscription advanced into a new period.
  @JsonValue('subscription_cycle')
  subscriptionCycle,

  /// A subscription reached a billing threshold.
  @JsonValue('subscription_threshold')
  subscriptionThreshold,

  /// A subscription was updated.
  @JsonValue('subscription_update')
  subscriptionUpdate,

  /// Reserved for simulated invoices, per the upcoming invoice endpoint.
  upcoming,
}
