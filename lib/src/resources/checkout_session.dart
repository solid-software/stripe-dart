import 'dart:async';

import 'package:stripe/messages.dart';
import 'package:stripe/src/api_config.dart';

import '../client.dart';
import '_resource.dart';

class CheckoutSessionResource extends Resource<CheckoutSession> {
  CheckoutSessionResource(Client client, ApiConfig config)
      : super(client, config);

  /// Creates a Stripe Checkout Session.
  Future<CheckoutSession> create(CreateCheckoutSessionRequest request) async {
    final response = await client.post(
      makeUrl('checkout/sessions'),
      data: request.toJson(),
    );
    return CheckoutSession.fromJson(response);
  }

  Future<CheckoutSession> retrieve(String id) async {
    final response = await client.get(
      makeUrl('checkout/sessions/$id'),
    );
    return CheckoutSession.fromJson(response);
  }
}
