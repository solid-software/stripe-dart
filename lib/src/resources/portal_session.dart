import 'dart:async';

import 'package:stripe/messages.dart';
import 'package:stripe/src/resources/_api_config.dart';

import '../client.dart';
import '_resource.dart';

class PortalSessionResource extends Resource<PortalSession> {
  PortalSessionResource(Client client, ApiConfig config)
      : super(client, config);

  /// Creates a Stripe Checkout Session.
  Future<PortalSession> create(CreatePortalSessionRequest request) async {
    final response = await client.post(
      makeUrl('billing_portal/sessions'),
      data: request.toJson(),
    );
    return PortalSession.fromJson(response);
  }
}
