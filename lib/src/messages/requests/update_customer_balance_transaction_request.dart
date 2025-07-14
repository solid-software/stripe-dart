part of '../../../messages.dart';

/// https://docs.stripe.com/api/customer_balance_transactions/update
@JsonSerializable()
class UpdateCustomerBalanceTransactionRequest {
  /// An arbitrary string attached to the object. Often useful for displaying to
  /// users.
  final String? description;

  /// Set of key-value pairs that you can attach to an object. This can be
  /// useful for storing additional information about the object in a structured
  /// format. Individual keys can be unset by posting an empty value to them.
  /// All keys can be unset by posting an empty value to metadata.
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
