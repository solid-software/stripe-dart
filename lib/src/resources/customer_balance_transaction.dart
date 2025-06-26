import 'dart:async';

import 'package:stripe/messages.dart';

import '../client.dart';
import '_resource.dart';

class CustomerBalanceTransactionResource
    extends Resource<CustomerBalanceTransaction> {
  static const _resourceName = 'customer_balance_transaction';

  CustomerBalanceTransactionResource(Client client) : super(client);

  Future<CustomerBalanceTransaction> create(
      CreateCustomerBalanceTransactionRequest request) async {
    final map = await post(_resourceName, data: request.toJson());

    return CustomerBalanceTransaction.fromJson(map);
  }

  Future<CustomerBalanceTransaction> update(
    String customerBalanceTransactionId,
    UpdateCustomerBalanceTransactionRequest request,
  ) async {
    final map = await post(
      '$_resourceName/$customerBalanceTransactionId',
      data: request.toJson(),
    );

    return CustomerBalanceTransaction.fromJson(map);
  }

  Future<CustomerBalanceTransaction> retrieve(
      String customerBalanceTransactionId) async {
    final map = await get('$_resourceName/$customerBalanceTransactionId');

    return CustomerBalanceTransaction.fromJson(map);
  }

  Future<DataList<CustomerBalanceTransaction>> list([
    ListCouponsRequest? request,
  ]) async {
    final map = await get(_resourceName, queryParameters: request?.toJson());

    return DataList<CustomerBalanceTransaction>.fromJson(
      map,
      (value) =>
          CustomerBalanceTransaction.fromJson(value as Map<String, dynamic>),
    );
  }
}
