part of '../../messages.dart';

/// https://docs.stripe.com/api/subscriptions/object#subscription_object-billing_cycle_anchor_config
@JsonSerializable()
class BillingCycleAnchorConfig {
  /// The month to start full cycle billing periods.
  final int? month;

  /// The day of the month of the billing_cycle_anchor.
  final int? dayOfMonth;

  /// The hour of the day of the billing_cycle_anchor.
  final int? hour;

  /// The minute of the hour of the billing_cycle_anchor.
  final int? minute;

  /// The second of the minute of the billing_cycle_anchor.
  final int? second;

  BillingCycleAnchorConfig({
    this.month,
    this.dayOfMonth,
    this.hour,
    this.minute,
    this.second,
  });

  factory BillingCycleAnchorConfig.fromJson(Map<String, dynamic> json) =>
      _$BillingCycleAnchorConfigFromJson(json);

  Map<String, dynamic> toJson() => _$BillingCycleAnchorConfigToJson(this);
}
