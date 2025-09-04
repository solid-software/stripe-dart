import 'dart:async';

import 'package:stripe/messages.dart';
import 'package:stripe/src/resources/_api_config.dart';

import '../client.dart';
import '_resource.dart';

class BalanceTransactionResource extends Resource<BalanceTransaction> {
  BalanceTransactionResource(Client client, ApiConfig config)
      : super(client, config);

  Future<BalanceTransaction> retrieve(String balanceTransactionId) async {
    final map = await client.get(
      makeUrl('balance_transactions/$balanceTransactionId'),
    );
    return BalanceTransaction.fromJson(map);
  }
}
