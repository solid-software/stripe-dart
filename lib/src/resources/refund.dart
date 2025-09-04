import 'dart:async';

import 'package:stripe/messages.dart';
import 'package:stripe/src/resources/_api_config.dart';

import '../client.dart';
import '_resource.dart';

class RefundResource extends Resource<Refund> {
  RefundResource(Client client, ApiConfig config) : super(client, config);

  Future<Refund> create(CreateRefundRequest request) async {
    final map = await client.post(
      makeUrl('refunds'),
      data: request.toJson(),
    );
    return Refund.fromJson(map);
  }
}
