part of '../../../messages.dart';

/// https://docs.stripe.com/api/promotion_codes/list
@JsonSerializable()
class ListPromotionCodesRequest {
  /// Filter promotion codes by whether they are active.
  final bool? active;

  /// Only return promotion codes that have this case-insensitive code.
  final String? code;

  /// Only return promotion codes for this coupon.
  final String? coupon;

  /// A filter on the list, based on the object created field. The value can be
  /// a string with an integer Unix timestamp, or it can be a dictionary with a
  /// number of different query options.
  final ListPromotionCodesCreatedRequest? created;

  /// Only return promotion codes that are restricted to this customer.
  final String? customer;

  /// A cursor for use in pagination. ending_before is an object ID that defines
  /// your place in the list. For instance, if you make a list request and
  /// receive 100 objects, starting with obj_bar, your subsequent call can
  /// include ending_before=obj_bar in order to fetch the previous page of the
  /// list.
  final String? endingBefore;

  /// A limit on the number of objects to be returned. Limit can range between
  /// 1 and 100, and the default is 10.
  final int? limit;

  /// A cursor for use in pagination. starting_after is an object ID that
  /// defines your place in the list. For instance, if you make a list request
  /// and receive 100 objects, ending with obj_foo, your subsequent call can
  /// include starting_after=obj_foo in order to fetch the next page of the
  /// list.
  final String? startingAfter;

  ListPromotionCodesRequest({
    this.active,
    this.code,
    this.coupon,
    this.created,
    this.customer,
    this.endingBefore,
    this.limit,
    this.startingAfter,
  });

  factory ListPromotionCodesRequest.fromJson(Map<String, dynamic> json) =>
      _$ListPromotionCodesRequestFromJson(json);

  Map<String, dynamic> toJson() => _$ListPromotionCodesRequestToJson(this);
}

/// https://docs.stripe.com/api/promotion_codes/list#list_promotion_code-created
@JsonSerializable()
class ListPromotionCodesCreatedRequest {
  /// Minimum value to filter by (exclusive).
  final int? gt;

  /// Minimum value to filter by (inclusive).
  final int? gte;

  /// Maximum value to filter by (exclusive).
  final int? lt;

  /// Maximum value to filter by (inclusive).
  final int? lte;

  ListPromotionCodesCreatedRequest({
    this.gt,
    this.gte,
    this.lt,
    this.lte,
  });

  factory ListPromotionCodesCreatedRequest.fromJson(
          Map<String, dynamic> json) =>
      _$ListPromotionCodesCreatedRequestFromJson(json);

  Map<String, dynamic> toJson() =>
      _$ListPromotionCodesCreatedRequestToJson(this);
}
