part of '../../../messages.dart';

/// https://docs.stripe.com/api/customer_balance_transactions/list
@JsonSerializable()
class ListCustomerBalanceTransactionsRequest {
  /// Only return customer balance transactions that were created during the
  /// given date interval.
  final CreatedRequest? created;

  /// A cursor for use in pagination. ending_before is an object ID that defines
  /// your place in the list. For instance, if you make a list request and
  /// receive 100 objects, starting with obj_bar, your subsequent call can
  /// include ending_before=obj_bar in order to fetch the previous page of the
  /// list.
  final String? endingBefore;

  /// A limit on the number of objects to be returned. Limit can range between 1
  /// and 100, and the default is 10.
  final int? limit;

  /// A cursor for use in pagination. starting_after is an object ID that
  /// defines your place in the list. For instance, if you make a list request
  /// and receive 100 objects, ending with obj_foo, your subsequent call can
  /// include starting_after=obj_foo in order to fetch the next page of the
  /// list.
  final String? startingAfter;

  ListCustomerBalanceTransactionsRequest({
    this.created,
    this.endingBefore,
    this.limit,
    this.startingAfter,
  });

  factory ListCustomerBalanceTransactionsRequest.fromJson(
    Map<String, dynamic> json,
  ) =>
      _$ListCustomerBalanceTransactionsRequestFromJson(json);

  Map<String, dynamic> toJson() =>
      _$ListCustomerBalanceTransactionsRequestToJson(this);
}
