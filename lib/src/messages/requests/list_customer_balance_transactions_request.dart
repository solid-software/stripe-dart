part of '../../../messages.dart';

@JsonSerializable()
class ListCustomerBalanceTransactionsRequest {
  final String? endingBefore;

  final int? limit;

  final String? startingAfter;

  ListCustomerBalanceTransactionsRequest({
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
