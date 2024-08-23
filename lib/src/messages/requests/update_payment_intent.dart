part of '../../../messages.dart';

@JsonSerializable()
class UpdatePaymentIntentRequest {
  /// Amount intended to be collected by this PaymentIntent. A positive integer representing how much to charge in the smallest currency unit (e.g., 100 cents to charge $1.00 or 100 to charge ¥100, a zero-decimal currency). The minimum amount is $0.50 US or equivalent in charge currency. The amount value supports up to eight digits (e.g., a value of 99999999 for a USD charge of $999,999.99).
  final int? amount;

  /// Three-letter ISO currency code, in lowercase. Must be a supported currency.
  final String? currency;

  /// ID of the Customer this PaymentIntent belongs to, if one exists.
  /// Payment methods attached to other Customers cannot be used with this
  /// PaymentIntent.
  ///
  /// If setup_future_usage is set and this PaymentIntent’s payment method is
  /// not card_present, then the payment method attaches to the Customer after
  /// the PaymentIntent has been confirmed and any required actions from the
  /// user are complete. If the payment method is card_present and isn’t a
  /// digital wallet, then a generated_card payment method representing the
  /// card is created and attached to the Customer instead.
  final String? customer;

  /// An arbitrary string attached to the object. Often useful for displaying
  /// to users.
  final String? description;

  /// Set of key-value pairs that you can attach to an object. This can be
  /// useful for storing additional information about the object in a
  /// structured format. Individual keys can be unset by posting an empty value
  /// to them. All keys can be unset by posting an empty value to metadata.
  final Map<String, dynamic>? metadata;

  /// ID of the payment method (a PaymentMethod, Card, or compatible Source
  /// object) to attach to this PaymentIntent. To unset this field to null, pass
  /// in an empty string.
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

  /// Text that appears on the customer’s statement as the statement descriptor
  /// for a non-card charge. This value overrides the account’s default
  /// statement descriptor. For information about requirements, including the
  /// 22-character limit, see the Statement Descriptor docs.
  ///
  /// Setting this value for a card charge returns an error. For card charges,
  /// set the statement_descriptor_suffix instead.
  final String? statementDescriptor;

  /// Provides information about a card charge. Concatenated to the account’s
  /// statement descriptor prefix to form the complete statement descriptor that
  /// appears on the customer’s statement.
  final String? statementDescriptorSuffix;

  /// The ID of the payment method configuration to use with this PaymentIntent.
  final String? paymentMethodConfiguration;

  const UpdatePaymentIntentRequest({
    this.amount,
    this.currency,
    this.customer,
    this.description,
    this.metadata,
    this.paymentMethod,
    this.receiptEmail,
    this.setupFutureUsage,
    this.statementDescriptor,
    this.statementDescriptorSuffix,
    this.paymentMethodConfiguration,
  });

  factory UpdatePaymentIntentRequest.fromJson(Map<String, dynamic> json) =>
      _$UpdatePaymentIntentRequestFromJson(json);

  Map<String, dynamic> toJson() => _$UpdatePaymentIntentRequestToJson(this);
}
