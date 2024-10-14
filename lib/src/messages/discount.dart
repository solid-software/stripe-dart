part of '../../messages.dart';

enum _DiscountObject { discount }

/// https://docs.stripe.com/api/discounts/object
@JsonSerializable()
class Discount extends Message {
  final _DiscountObject object;

  /// The ID of the discount object. Discounts cannot be fetched by ID. Use
  /// expand[]=discounts in API calls to expand discount IDs in an array.
  final String id;

  /// Hash describing the coupon applied to create this discount.
  final Coupon coupon;

  /// Date that the coupon was applied.
  final int start;

  /// The ID of the customer associated with this discount.
  final String? customer;

  /// If the coupon has a duration of repeating, the date that this discount
  /// will end. If the coupon has a duration of once or forever, this attribute
  /// will be null.
  final int? end;

  /// The subscription that this coupon is applied to, if it is applied to a
  /// particular subscription.
  final String? subscription;

  /// The Checkout session that this coupon is applied to, if it is applied to
  /// a particular session in payment mode. Will not be present for subscription
  /// mode.
  final String? checkoutSession;

  /// The invoice that the discount’s coupon was applied to, if it was applied
  /// directly to a particular invoice.
  final String? invoice;

  /// The invoice item id (or invoice line item id for invoice line items of
  /// type=‘subscription’) that the discount’s coupon was applied to, if it was
  /// applied directly to a particular invoice item or invoice line item.
  final String? invoiceItem;

  /// The promotion code applied to create this discount.
  final String? promotionCode;

  /// The subscription item that this coupon is applied to, if it is applied to
  /// a particular subscription item.
  final String? subscriptionItem;

  Discount({
    required this.object,
    required this.id,
    required this.coupon,
    required this.start,
    this.customer,
    this.end,
    this.subscription,
    this.checkoutSession,
    this.invoice,
    this.invoiceItem,
    this.promotionCode,
    this.subscriptionItem,
  });

  factory Discount.fromJson(Map<String, dynamic> json) =>
      _$DiscountFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$DiscountToJson(this);
}

class ExpandableDiscountJsonConverter
    extends ExpandableJsonConverter<Discount> {
  const ExpandableDiscountJsonConverter() : super(Discount.fromJson);
}

class ExpandableDiscountListJsonConverter
    extends ExpandableListJsonConverter<Discount> {
  const ExpandableDiscountListJsonConverter() : super(Discount.fromJson);
}
