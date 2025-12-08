import 'dart:async';

import 'package:stripe/messages.dart';

import '../client.dart';
import '_resource.dart';

/// https://docs.stripe.com/api/customer_balance_transactions
class CustomerBalanceTransactionResource
    extends Resource<CustomerBalanceTransaction> {
  CustomerBalanceTransactionResource(Client client) : super(client);

  /// Creates an immutable transaction that updates the customer’s credit
  /// balance.
  Future<CustomerBalanceTransaction> create(
    String customerId,
    CreateCustomerBalanceTransactionRequest request, {
    String? idempotencyKey,
  }) async {
    final map = await post(
      _buildPath(customerId),
      data: request.toJson(),
      idempotencyKey: idempotencyKey,
    );

    return CustomerBalanceTransaction.fromJson(map);
  }

  String _buildPath(String customerId, [String? customerBalanceTransactionId]) {
    return [
      'customers',
      customerId,
      'balance_transactions',
      if (customerBalanceTransactionId != null) customerBalanceTransactionId,
    ].join('/');
  }

  /// Most credit balance transaction fields are immutable, but you may update
  /// its description and metadata.
  Future<CustomerBalanceTransaction> update(
    String customerId,
    String customerBalanceTransactionId,
    UpdateCustomerBalanceTransactionRequest request,
  ) async {
    final map = await post(
      _buildPath(customerId, customerBalanceTransactionId),
      data: request.toJson(),
    );

    return CustomerBalanceTransaction.fromJson(map);
  }

  /// Retrieves a specific customer balance transaction that updated the
  /// customer’s balances.
  Future<CustomerBalanceTransaction> retrieve(
      String customerId, String customerBalanceTransactionId) async {
    final map = await get(
      _buildPath(customerId, customerBalanceTransactionId),
    );

    return CustomerBalanceTransaction.fromJson(map);
  }

  /// Returns a list of transactions that updated the customer’s balances.
  Future<DataList<CustomerBalanceTransaction>> list(
    String customerId, [
    ListCustomerBalanceTransactionsRequest? request,
  ]) async {
    final map = await get(
      _buildPath(customerId),
      queryParameters: request?.toJson(),
    );

    return DataList<CustomerBalanceTransaction>.fromJson(
      map,
      (value) =>
          CustomerBalanceTransaction.fromJson(value as Map<String, dynamic>),
    );
  }
}
