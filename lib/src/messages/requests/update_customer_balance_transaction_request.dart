part of '../../../messages.dart';

@JsonSerializable()
class UpdateCustomerBalanceTransactionRequest {
  final String? description;

  final Map<String, dynamic>? metadata;

  UpdateCustomerBalanceTransactionRequest({
    this.description,
    this.metadata,
  });

  factory UpdateCustomerBalanceTransactionRequest.fromJson(
          Map<String, dynamic> json) =>
      _$UpdateCustomerBalanceTransactionRequestFromJson(json);

  Map<String, dynamic> toJson() =>
      _$UpdateCustomerBalanceTransactionRequestToJson(this);
}
