part of '../../../messages.dart';

/// https://docs.stripe.com/api/subscriptions/list
@JsonSerializable()
class ListSubscriptionsRequest {
  /// The ID of the customer whose subscriptions will be retrieved.
  final String? customer;

  /// Filter for subscriptions that contain this recurring price ID.
  final String? price;

  /// The status of the subscriptions to retrieve. Passing in a value of
  /// canceled will return all canceled subscriptions, including those belonging
  /// to deleted customers. Pass ended to find subscriptions that are canceled
  /// and subscriptions that are expired due to incomplete payment. Passing in a
  /// value of all will return subscriptions of all statuses.
  final SubscriptionStatus? status;

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

  ListSubscriptionsRequest({
    this.customer,
    this.price,
    this.status,
    this.endingBefore,
    this.limit,
    this.startingAfter,
  });

  factory ListSubscriptionsRequest.fromJson(Map<String, dynamic> json) =>
      _$ListSubscriptionsRequestFromJson(json);

  Map<String, dynamic> toJson() => _$ListSubscriptionsRequestToJson(this);
}
