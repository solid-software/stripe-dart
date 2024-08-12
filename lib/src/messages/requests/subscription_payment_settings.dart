part of '../../../messages.dart';

@JsonSerializable()
class SubscriptionPaymentSettingsRequest {
  /// The list of payment method types (e.g. card) to provide to the invoice’s
  /// PaymentIntent. If not set, Stripe attempts to automatically determine the
  /// types to use by looking at the invoice’s default payment method, the
  /// subscription’s default payment method, the customer’s default payment
  /// method, and your invoice template settings.
  final List<String>? paymentMethodTypes;

  SubscriptionPaymentSettingsRequest({
    this.paymentMethodTypes,
  });

  factory SubscriptionPaymentSettingsRequest.fromJson(
          Map<String, dynamic> json) =>
      _$SubscriptionPaymentSettingsRequestFromJson(json);

  Map<String, dynamic> toJson() =>
      _$SubscriptionPaymentSettingsRequestToJson(this);
}
