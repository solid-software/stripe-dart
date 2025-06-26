part of '../../../messages.dart';

@JsonSerializable()
class CreateCustomerBalanceTransactionRequest {
  final int amount;

  final String currency;

  final String? description;

  final Map<String, dynamic>? metadata;

  CreateCustomerBalanceTransactionRequest({
    required this.amount,
    required this.currency,
    this.description,
    this.metadata,
});

  factory CreateCustomerBalanceTransactionRequest.fromJson(
    Map<String, dynamic> json,
  ) =>
      _$CreateCustomerBalanceTransactionRequestFromJson(json);

  Map<String, dynamic> toJson() =>
      _$CreateCustomerBalanceTransactionRequestToJson(this);
}
