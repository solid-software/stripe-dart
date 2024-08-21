part of '../../../messages.dart';

/// https://stripe.com/docs/api/prices/list
@JsonSerializable()
class ListPricesRequest {
  /// Only return products that are active or inactive (e.g., pass false to list
  /// all inactive products).
  final bool? active;

  /// Only return prices for the given currency.
  final String? currency;

  /// Only return prices for the given product.
  final String? product;

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

  ListPricesRequest({
    this.active,
    this.currency,
    this.product,
    this.endingBefore,
    this.limit,
    this.startingAfter,
  });

  factory ListPricesRequest.fromJson(Map<String, dynamic> json) =>
      _$ListPricesRequestFromJson(json);

  Map<String, dynamic> toJson() => _$ListPricesRequestToJson(this);
}
