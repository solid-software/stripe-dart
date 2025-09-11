import 'dart:async';

import 'package:stripe/messages.dart';
import 'package:stripe/src/api_config.dart';

import '../client.dart';
import '_resource.dart';

class ChargeResource extends Resource<Charge> {
  ChargeResource(Client client, ApiConfig config) : super(client, config);

  Future<Charge> retrieve(String chargeId) async {
    final map = await client.get(
      makeUrl('charges/$chargeId'),
    );
    return Charge.fromJson(map);
  }
}
