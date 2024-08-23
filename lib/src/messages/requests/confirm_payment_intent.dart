part of '../../../messages.dart';

@JsonSerializable()
class ConfirmPaymentIntentRequest {
  /// ID of the payment method (a PaymentMethod, Card, or compatible Source
  /// object) to attach to this PaymentIntent.
  final String? paymentMethod;

  /// Email address that the receipt for the resulting payment will be sent to.
  /// If receipt_email is specified for a payment in live mode, a receipt will
  /// be sent regardless of your email settings.
  final String? receiptEmail;

  /// Indicates that you intend to make future payments with this
  /// PaymentIntent’s payment method.
  ///
  /// If you provide a Customer with the PaymentIntent, you can use this
  /// parameter to attach the payment method to the Customer after the
  /// PaymentIntent is confirmed and the customer completes any required
  /// actions. If you don’t provide a Customer, you can still attach the
  /// payment method to a Customer after the transaction completes.
  ///
  /// If the payment method is card_present and isn’t a digital wallet, Stripe
  /// creates and attaches a generated_card payment method representing the
  /// card to the Customer instead.
  ///
  /// When processing card payments, Stripe uses setup_future_usage to help you
  /// comply with regional legislation and network rules, such as SCA.
  ///
  /// If you’ve already set setup_future_usage and you’re performing a request
  /// using a publishable key, you can only update the value from on_session to
  /// off_session.
  final SetupFutureUsage? setupFutureUsage;

  /// ID of the ConfirmationToken used to confirm this PaymentIntent.
  ///
  /// If the provided ConfirmationToken contains properties that are also being
  /// provided in this request, such as payment_method, then the values in
  /// this request will take precedence.
  final String? confirmationToken;

  /// Set to true to fail the payment attempt if the PaymentIntent transitions
  /// into requires_action. This parameter is intended for simpler integrations
  /// that do not handle customer actions, like saving cards without
  /// authentication.
  final bool? errorOnRequiresAction;

  /// ID of the mandate that’s used for this payment.
  final String? mandate;

  /// Set to true to indicate that the customer isn’t in your checkout flow
  /// during this payment attempt and can’t authenticate. Use this parameter in
  /// scenarios where you collect card details and charge them later.
  final bool? offSession;

  /// The URL to redirect your customer back to after they authenticate or
  /// cancel their payment on the payment method’s app or site. If you’d prefer
  /// to redirect to a mobile application, you can alternatively supply an
  /// application URI scheme. This parameter is only used for cards and other
  /// redirect-based payment methods.
  final String? returnUrl;

  /// Set to true when confirming server-side and using Stripe.js, iOS, or
  /// Android client-side SDKs to handle the next actions.
  final bool? useStripeSdk;

  ConfirmPaymentIntentRequest({
    this.paymentMethod,
    this.receiptEmail,
    this.setupFutureUsage,
    this.confirmationToken,
    this.errorOnRequiresAction,
    this.mandate,
    this.offSession,
    this.returnUrl,
    this.useStripeSdk,
  });

  factory ConfirmPaymentIntentRequest.fromJson(Map<String, dynamic> json) =>
      _$ConfirmPaymentIntentRequestFromJson(json);

  Map<String, dynamic> toJson() => _$ConfirmPaymentIntentRequestToJson(this);
}
