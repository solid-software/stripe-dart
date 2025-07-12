import 'dart:async';

import 'package:stripe/messages.dart';

import '../client.dart';
import '_resource.dart';

class CustomerBalanceTransactionResource
    extends Resource<CustomerBalanceTransaction> {
  CustomerBalanceTransactionResource(Client client) : super(client);

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

  Future<CustomerBalanceTransaction> retrieve(
      String customerId, String customerBalanceTransactionId) async {
    final map = await get(
      _buildPath(customerId, customerBalanceTransactionId),
    );

    return CustomerBalanceTransaction.fromJson(map);
  }

  Future<DataList<CustomerBalanceTransaction>> list(
    String customerId, [
    ListCouponsRequest? request,
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
