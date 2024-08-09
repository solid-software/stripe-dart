part of '../../../messages.dart';

/// https://docs.stripe.com/api/coupons/list
@JsonSerializable()
class ListCouponsRequest {
  /// A filter on the list, based on the object created field. The value can be
  /// a string with an integer Unix timestamp, or it can be a dictionary with a
  /// number of different query options.
  final CreatedRequest? created;

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

  ListCouponsRequest({
    this.created,
    this.endingBefore,
    this.limit,
    this.startingAfter,
  });

  factory ListCouponsRequest.fromJson(Map<String, dynamic> json) =>
      _$ListCouponsRequestFromJson(json);

  Map<String, dynamic> toJson() => _$ListCouponsRequestToJson(this);
}
