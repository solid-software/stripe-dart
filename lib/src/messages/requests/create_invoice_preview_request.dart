part of '../../../messages.dart';

/// https://docs.stripe.com/api/invoices/create_preview
@JsonSerializable()
class CreatePreviewInvoiceRequest {
  /// The identifier of the customer whose upcoming invoice you’d like to
  /// retrieve. If automatic_tax is enabled then one of customer,
  /// customer_details, subscription, or schedule must be set.
  final String? customer;

  /// The identifier of the subscription for which you’d like to retrieve the
  /// upcoming invoice. If not provided, but a subscription_details.items is
  /// provided, you will preview creating a subscription with those items. If
  /// neither subscription nor subscription_details.items is provided, you will
  /// retrieve the next upcoming invoice from among the customer’s
  /// subscriptions.
  final String? subscription;

  /// The coupons to redeem into discounts for the invoice preview. If not
  /// specified, inherits the discount from the subscription or customer. This
  /// works for both coupons directly applied to an invoice and coupons applied
  /// to a subscription. Pass an empty string to avoid inheriting any discounts.
  final List<CreateDiscountRequest>? discounts;

  /// Customizes the types of values to include when calculating the invoice.
  /// Defaults to next if unspecified.
  final PreviewInvoiceMode? previewMode;

  /// The subscription creation or modification params to apply as a preview.
  /// Cannot be used with schedule or schedule_details fields.
  final CreatePreviewInvoiceSubscriptionDetailsRequest? subscriptionDetails;

  CreatePreviewInvoiceRequest({
    this.customer,
    this.subscription,
    this.discounts,
    this.previewMode,
    this.subscriptionDetails,
  });

  factory CreatePreviewInvoiceRequest.fromJson(Map<String, dynamic> json) =>
      _$CreatePreviewInvoiceRequestFromJson(json);

  Map<String, dynamic> toJson() => _$CreatePreviewInvoiceRequestToJson(this);
}

/// https://docs.stripe.com/api/invoices/create_preview#create_create_preview-subscription_details
@JsonSerializable()
class CreatePreviewInvoiceSubscriptionDetailsRequest {
  /// For new subscriptions, a future timestamp to anchor the subscription’s
  /// billing cycle. This is used to determine the date of the first full
  /// invoice, and, for plans with month or year intervals, the day of the month
  /// for subsequent invoices. For existing subscriptions, the value can only be
  /// set to now or unchanged.
  final DateTime? billingCycleAnchor;

  /// A timestamp at which the subscription should cancel. If set to a date
  /// before the current period ends, this will cause a proration if prorations
  /// have been enabled using proration_behavior. If set during a future period,
  /// this will always cause a proration for that period.
  final DateTime? cancelAt;

  /// Indicate whether this subscription should cancel at the end of the current
  /// period (current_period_end). Defaults to false.
  final bool? cancelAtPeriodEnd;

  /// This simulates the subscription being canceled or expired immediately.
  final bool? cancelNow;

  /// If provided, the invoice returned will preview updating or creating a
  /// subscription with these default tax rates. The default tax rates will
  /// apply to any line item that does not have tax_rates set.
  final List<String>? defaultTaxRates;

  /// A list of up to 20 subscription items, each with an attached price.
  final List<CreatePreviewInvoiceSubscriptionItemDetailsRequest>? items;

  /// Determines how to handle prorations when the billing cycle changes (e.g.,
  /// when switching plans, resetting billing_cycle_anchor=now, or starting a
  /// trial), or if an item’s quantity changes. The default value is
  /// create_prorations.
  final ProrationBehavior? prorationBehavior;

  /// If previewing an update to a subscription, and doing proration,
  /// subscription_details.proration_date forces the proration to be calculated
  /// as though the update was done at the specified time. The time given must
  /// be within the current subscription period and within the current phase of
  /// the schedule backing this subscription, if the schedule exists. If set,
  /// subscription, and one of subscription_details.items, or
  /// subscription_details.trial_end are required. Also,
  /// subscription_details.proration_behavior cannot be set to ‘none’.
  final DateTime? prorationDate;

  /// Date a subscription is intended to start (can be future or past).
  final DateTime? startDate;

  /// If provided, the invoice returned will preview updating or creating a
  /// subscription with that trial end. If set, one of
  /// subscription_details.items or subscription is required.
  final DateTime? trialEnd;

  CreatePreviewInvoiceSubscriptionDetailsRequest({
    this.billingCycleAnchor,
    this.cancelAt,
    this.cancelAtPeriodEnd,
    this.cancelNow,
    this.defaultTaxRates,
    this.items,
    this.prorationBehavior,
    this.prorationDate,
    this.startDate,
    this.trialEnd,
  });

  factory CreatePreviewInvoiceSubscriptionDetailsRequest.fromJson(
          Map<String, dynamic> json) =>
      _$CreatePreviewInvoiceSubscriptionDetailsRequestFromJson(json);

  Map<String, dynamic> toJson() =>
      _$CreatePreviewInvoiceSubscriptionDetailsRequestToJson(this);
}

/// https://docs.stripe.com/api/invoices/create_preview#create_create_preview-subscription_details-items
@JsonSerializable()
class CreatePreviewInvoiceSubscriptionItemDetailsRequest {
  /// Delete all usage for a given subscription item. Allowed only when deleted
  /// is set to true and the current plan’s usage_type is metered.
  final bool? clearUsage;

  /// A flag that, if set to true, will delete the specified item.
  final bool? deleted;

  /// The coupons to redeem into discounts for the subscription item.
  final List<CreateDiscountRequest>? discounts;

  /// Subscription item to update.
  final String? id;

  /// Set of key-value pairs that you can attach to an object. This can be
  /// useful for storing additional information about the object in a structured
  /// format. Individual keys can be unset by posting an empty value to them.
  /// All keys can be unset by posting an empty value to metadata.
  final Map<String, String>? metadata;

  /// The ID of the price object. One of price or price_data is required. When
  /// changing a subscription item’s price, quantity is set to 1 unless a
  /// quantity parameter is provided.
  final String? price;

  /// Quantity for this item.
  final int? quantity;

  /// A list of Tax Rate ids. These Tax Rates will override the
  /// default_tax_rates on the Subscription. When updating, pass an empty string
  /// to remove previously-defined tax rates.
  final List<String>? taxRates;

  CreatePreviewInvoiceSubscriptionItemDetailsRequest({
    this.clearUsage,
    this.deleted,
    this.discounts,
    this.id,
    this.metadata,
    this.price,
    this.quantity,
    this.taxRates,
  });

  factory CreatePreviewInvoiceSubscriptionItemDetailsRequest.fromJson(
          Map<String, dynamic> json) =>
      _$CreatePreviewInvoiceSubscriptionItemDetailsRequestFromJson(json);

  Map<String, dynamic> toJson() =>
      _$CreatePreviewInvoiceSubscriptionItemDetailsRequestToJson(this);
}

/// https://docs.stripe.com/api/invoices/create_preview#create_create_preview-preview_mode
enum PreviewInvoiceMode {
  /// Will calculate the next invoice for the customer or subscription,
  /// factoring in all one-time and recurring items.
  next,

  /// Will calculate an invoice that is an estimate of the subscription’s
  /// long-term recurring bill. The invoice lines will only include recurring
  /// subscription items, taxes, and coupons with applicability=repeating or
  /// applicability=forever.
  ///
  /// To calculate a recurring estimate, you must provide at least one of
  /// subscription or subscription_details.items. Prorations, subscription
  /// cancellations, and trials are not supported with recurring estimates.
  recurring,
}
