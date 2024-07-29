part of '../../messages.dart';

enum _CouponObject { coupon }

/// https://docs.stripe.com/api/coupons/object#coupon_object-duration
enum CouponDuration {
  /// Applies to all charges from a subscription with this coupon applied.
  forever,

  /// Applies to the first charge from a subscription with this coupon applied.
  once,

  /// Applies to charges in the first duration_in_months months from a
  /// subscription with this coupon applied.
  repeating,
}

/// https://docs.stripe.com/api/coupons/object#coupon_object-applies_to
@JsonSerializable()
class CouponAppliesTo {
  /// A list of product IDs this coupon applies to.
  final List<String>? products;

  CouponAppliesTo({
    this.products,
  });

  factory CouponAppliesTo.fromJson(Map<String, dynamic> json) =>
      _$CouponAppliesToFromJson(json);

  Map<String, dynamic> toJson() => _$CouponAppliesToToJson(this);
}

/// https://docs.stripe.com/api/coupons/object
@JsonSerializable()
class Coupon extends Message {
  final _CouponObject object;

  /// Unique identifier for the object.
  final String id;

  /// One of forever, once, and repeating. Describes how long a customer who
  /// applies this coupon will get the discount.
  final CouponDuration duration;

  /// Time at which the object was created. Measured in seconds since the Unix
  /// epoch.
  final int created;

  /// Has the value true if the object exists in live mode or the value false if
  /// the object exists in test mode.
  final bool livemode;

  /// Number of times this coupon has been applied to a customer.
  final int timesRedeemed;

  /// Taking account of the above properties, whether this coupon can still be
  /// applied to a customer.
  final bool valid;

  /// Amount (in the [currency] specified) that will be taken off the subtotal
  /// of any invoices for this customer.
  final int? amountOff;

  /// If [amountOff] has been set, the three-letter ISO code for the currency
  /// of the amount to take off.
  final String? currency;

  /// If [duration] is repeating, the number of months the coupon applies.
  /// Null if coupon [duration] is forever or once.
  final int? durationInMonths;

  /// Set of key-value pairs that you can attach to an object. This can be
  /// useful for storing additional information about the object in a structured
  /// format.
  final Map<String, dynamic>? metadata;

  /// Name of the coupon displayed to customers on for instance invoices or
  /// receipts.
  final String? name;

  /// Percent that will be taken off the subtotal of any invoices for this
  /// customer for the duration of the coupon. For example, a coupon with
  /// percent_off of 50 will make a $100 invoice $50 instead.
  final double? percentOff;

  /// Contains information about what this coupon applies to.
  final CouponAppliesTo? appliesTo;

  /// Coupons defined in each available currency option. Each key must be a
  /// three-letter ISO currency code and a supported currency.
  final Map<String, dynamic>? currencyOptions;

  /// Maximum number of times this coupon can be redeemed, in total, across all
  /// customers, before it is no longer valid.
  final int? maxRedemptions;

  /// Date after which the coupon can no longer be redeemed.
  final int? redeemBy;

  Coupon({
    required this.object,
    required this.id,
    required this.duration,
    required this.created,
    required this.livemode,
    required this.timesRedeemed,
    required this.valid,
    this.amountOff,
    this.currency,
    this.durationInMonths,
    this.metadata,
    this.name,
    this.percentOff,
    this.appliesTo,
    this.currencyOptions,
    this.maxRedemptions,
    this.redeemBy,
  });

  factory Coupon.fromJson(Map<String, dynamic> json) => _$CouponFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$CouponToJson(this);
}
