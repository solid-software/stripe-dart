part of '../../../messages.dart';

/// https://docs.stripe.com/api/customer_balance_transactions/create
@JsonSerializable()
class CreateCustomerBalanceTransactionRequest {
  /// The integer amount in cents to apply to the customer’s credit balance.
  final int amount;


  /// Three-letter ISO currency code, in lowercase. Must be a supported
  /// currency. Specifies the invoice_credit_balance that this transaction will
  /// apply to. If the customer’s currency is not set, it will be updated to
  /// this value.
  final String currency;

  /// An arbitrary string attached to the object. Often useful for displaying to
  /// users.
  final String? description;

  /// Set of key-value pairs that you can attach to an object. This can be
  /// useful for storing additional information about the object in a structured
  /// format. Individual keys can be unset by posting an empty value to them.
  /// All keys can be unset by posting an empty value to metadata.
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
