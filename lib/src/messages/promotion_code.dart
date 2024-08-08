part of '../../messages.dart';

enum _PromotionCodeObject {
  @JsonValue('promotion_code')
  promotionCode
}

/// https://docs.stripe.com/api/promotion_codes/object
@JsonSerializable()
class PromotionCode extends Message {
  final _PromotionCodeObject object;

  /// Unique identifier for the object.
  final String id;

  /// The customer-facing code. Regardless of case, this code must be unique
  /// across all active promotion codes for each customer.
  final String code;

  /// Hash describing the coupon for this promotion code.
  final Coupon coupon;

  /// Whether the promotion code is currently active. A promotion code is only
  /// active if the coupon is also valid.
  final bool active;

  /// Time at which the object was created. Measured in seconds since the Unix
  /// epoch.
  final int created;

  /// Has the value true if the object exists in live mode or the value false if
  /// the object exists in test mode.
  final bool livemode;

  /// Settings that restrict the redemption of the promotion code.
  final PromotionCodeRestrictions restrictions;

  /// Number of times this promotion code has been used.
  final int timesRedeemed;

  /// Set of key-value pairs that you can attach to an object. This can be
  /// useful for storing additional information about the object in a structured
  /// format.
  final Map<String, dynamic>? metadata;

  /// The customer that this promotion code can be used by.
  final String? customer;

  /// Date at which the promotion code can no longer be redeemed.
  final int? expiresAt;

  /// Maximum number of times this promotion code can be redeemed.
  final int? maxRedemptions;

  PromotionCode({
    required this.object,
    required this.id,
    required this.code,
    required this.coupon,
    required this.active,
    required this.created,
    required this.livemode,
    required this.restrictions,
    required this.timesRedeemed,
    this.metadata,
    this.customer,
    this.expiresAt,
    this.maxRedemptions,
  });

  factory PromotionCode.fromJson(Map<String, dynamic> json) =>
      _$PromotionCodeFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$PromotionCodeToJson(this);
}

/// https://docs.stripe.com/api/promotion_codes/object#promotion_code_object-restrictions
@JsonSerializable()
class PromotionCodeRestrictions {
  /// A Boolean indicating if the Promotion Code should only be redeemed for
  /// Customers without any successful payments or invoices
  final bool firstTimeTransaction;

  /// Promotion code restrictions defined in each available currency option.
  /// Each key must be a three-letter ISO currency code and a supported
  /// currency.
  final Map<String, dynamic>? currencyOptions;

  /// Minimum amount required to redeem this Promotion Code into a Coupon
  /// (e.g., a purchase must be $100 or more to work).
  final int? minimumAmount;

  /// Three-letter ISO code for minimum_amount
  final String? minimumAmountCurrency;

  PromotionCodeRestrictions({
    required this.firstTimeTransaction,
    this.currencyOptions,
    this.minimumAmount,
    this.minimumAmountCurrency,
  });

  factory PromotionCodeRestrictions.fromJson(Map<String, dynamic> json) =>
      _$PromotionCodeRestrictionsFromJson(json);

  Map<String, dynamic> toJson() => _$PromotionCodeRestrictionsToJson(this);
}
