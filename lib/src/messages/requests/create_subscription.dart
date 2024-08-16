part of '../../../messages.dart';

/// https://docs.stripe.com/api/subscriptions/create
@JsonSerializable()
class CreateSubscriptionRequest {
  /// The identifier of the customer to subscribe.
  final String customer;

  /// A list of up to 20 subscription items, each with an attached price.
  final List<CreateSubscriptionItemRequest> items;

  /// Indicate whether this subscription should cancel at the end of the
  /// current period (current_period_end). Defaults to false.
  final bool? cancelAtPeriodEnd;

  /// Three-letter ISO currency code, in lowercase. Must be a supported
  /// currency.
  final String? currency;

  /// ID of the default payment method for the subscription. It must belong to
  /// the customer associated with the subscription. This takes precedence over
  /// default_source. If neither are set, invoices will use the customer’s
  /// invoice_settings.default_payment_method or default_source.
  final String? defaultPaymentMethod;

  /// The subscription’s description, meant to be displayable to the customer.
  /// Use this field to optionally store an explanation of the subscription for
  /// rendering in Stripe surfaces and certain local payment methods UIs.
  final String? description;

  /// Set of key-value pairs that you can attach to an object. This can be
  /// useful for storing additional information about the object in a
  /// structured format. Individual keys can be unset by posting an empty value
  /// to them. All keys can be unset by posting an empty value to metadata.
  final Map<String, String>? metadata;

  /// Only applies to subscriptions with collection_method=charge_automatically.
  final PaymentBehavior? paymentBehavior;

  /// For new subscriptions, a past timestamp to backdate the subscription’s
  /// start date to. If set, the first invoice will contain a proration for the
  /// timespan between the start date and the current time. Can be combined with
  /// trials and the billing cycle anchor.
  @TimestampConverter()
  final DateTime? backdateStartDate;

  /// A future timestamp in UTC format to anchor the subscription’s billing
  /// cycle. The anchor is the reference point that aligns future billing cycle
  /// dates. It sets the day of week for week intervals, the day of month for
  /// month and year intervals, and the month of year for year intervals.
  @TimestampConverter()
  final DateTime? billingCycleAnchor;

  /// Mutually exclusive with billing_cycle_anchor and only valid with monthly
  /// and yearly price intervals. When provided, the billing_cycle_anchor is set
  /// to the next occurence of the day_of_month at the hour, minute, and second
  /// UTC.
  final BillingCycleAnchorConfig? billingCycleAnchorConfig;

  /// A timestamp at which the subscription should cancel. If set to a date
  /// before the current period ends, this will cause a proration if prorations
  /// have been enabled using proration_behavior. If set during a future period,
  /// this will always cause a proration for that period.
  @TimestampConverter()
  final DateTime? cancelAt;

  /// The tax rates that will apply to any subscription item that does not have
  /// tax_rates set. Invoices created will have their default_tax_rates
  /// populated from the subscription.
  final List<String>? defaultTaxRates;

  /// The coupons to redeem into discounts for the subscription. If not
  /// specified or empty, inherits the discount from the subscription’s
  /// customer.
  final List<CreateDiscountRequest>? discounts;

  /// Indicates if a customer is on or off-session while an invoice payment is
  /// attempted. Defaults to false (on-session).
  final bool? offSession;

  /// Payment settings to pass to invoices created by the subscription.
  final SubscriptionPaymentSettingsRequest? paymentSettings;

  /// Determines how to handle prorations resulting from the
  /// billing_cycle_anchor. If no value is passed, the default is
  /// create_prorations.
  final ProrationBehavior? prorationBehavior;

  /// Unix timestamp representing the end of the trial period the customer will
  /// get before being charged for the first time. If set, trial_end will
  /// override the default trial period of the plan the customer is being
  /// subscribed to. The special value now can be provided to end the customer’s
  /// trial immediately. Can be at most two years from billing_cycle_anchor.
  @TimestampConverter()
  final DateTime? trialEnd;

  /// Indicates if a plan’s trial_period_days should be applied to the
  /// subscription. Setting trial_end per subscription is preferred, and this
  /// defaults to false. Setting this flag to true together with trial_end is
  /// not allowed.
  final bool? trialFromPlan;

  /// Integer representing the number of trial period days before the customer
  /// is charged for the first time. This will always overwrite any trials that
  /// might apply via a subscribed plan.
  final int? trialPeriodDays;

  CreateSubscriptionRequest({
    required this.customer,
    required this.items,
    this.cancelAtPeriodEnd,
    this.currency,
    this.defaultPaymentMethod,
    this.description,
    this.metadata,
    this.paymentBehavior,
    this.backdateStartDate,
    this.billingCycleAnchor,
    this.billingCycleAnchorConfig,
    this.cancelAt,
    this.defaultTaxRates,
    this.discounts,
    this.offSession,
    this.paymentSettings,
    this.prorationBehavior,
    this.trialEnd,
    this.trialFromPlan,
    this.trialPeriodDays,
  });

  factory CreateSubscriptionRequest.fromJson(Map<String, dynamic> json) =>
      _$CreateSubscriptionRequestFromJson(json);

  Map<String, dynamic> toJson() => _$CreateSubscriptionRequestToJson(this);
}

/// https://docs.stripe.com/api/subscriptions/create#create_subscription-items
@JsonSerializable()
class CreateSubscriptionItemRequest {
  /// The ID of the price object.
  final String? price;

  /// The coupons to redeem into discounts for the subscription item.
  final List<CreateDiscountRequest>? discounts;

  /// Set of key-value pairs that you can attach to an object. This can be
  /// useful for storing additional information about the object in a
  /// structured format. Individual keys can be unset by posting an empty value
  /// to them. All keys can be unset by posting an empty value to metadata.
  final Map<String, String>? metadata;

  /// Quantity for this item.
  final int? quantity;

  /// A list of Tax Rate ids. These Tax Rates will override the
  /// default_tax_rates on the Subscription. When updating, pass an empty
  /// string to remove previously-defined tax rates.
  final List<String>? taxRates;

  CreateSubscriptionItemRequest({
    this.price,
    this.discounts,
    this.metadata,
    this.quantity,
    this.taxRates,
  });

  factory CreateSubscriptionItemRequest.fromJson(Map<String, dynamic> json) =>
      _$CreateSubscriptionItemRequestFromJson(json);

  Map<String, dynamic> toJson() => _$CreateSubscriptionItemRequestToJson(this);
}
