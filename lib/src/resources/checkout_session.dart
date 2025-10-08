import 'dart:async';

import 'package:stripe/messages.dart';

import '../client.dart';
import '_resource.dart';

class CheckoutSessionResource extends Resource<CheckoutSession> {
  CheckoutSessionResource(Client client) : super(client);
  static const _resourceName = 'checkout/sessions';

  /// Creates a Stripe Checkout Session.
  Future<CheckoutSession> create(CreateCheckoutSessionRequest request) async {
    final response = await post(_resourceName, data: request.toJson());
    return CheckoutSession.fromJson(response);
  }

  Future<CheckoutSession> retrieve(String id) async {
    final response = await get('$_resourceName/$id');
    return CheckoutSession.fromJson(response);
  }

  Future<DataList<CheckoutSession>> list([
    ListCheckoutSessionsRequest? request,
  ]) async {
    final map = await get(
      _resourceName,
      queryParameters: request?.toJson(),
    );

    return DataList<CheckoutSession>.fromJson(
      map,
      (value) => CheckoutSession.fromJson(value as Map<String, dynamic>),
    );
  }

  Future<DataList<CheckoutSession>> listExpanded({
    required Set<CheckoutSessionExpandableField> expand,
    ListCheckoutSessionsRequest? request,
  }) async {
    final map = await get(
      _resourceName,
      queryParameters: {
        ...?request?.toJson(),
        'expand': _expandParamComponents(expand).map((e) => 'data.$e').toList(),
      },
    );

    return DataList<CheckoutSession>.fromJson(
      map,
      (value) => CheckoutSession.fromJson(value as Map<String, dynamic>),
    );
  }

  List<String> _expandParamComponents(
      Set<CheckoutSessionExpandableField> fields) {
    return fields.map((field) {
      switch (field) {
        case CheckoutSessionExpandableField.lineItems:
          return 'line_items';
      }
    }).toList();
  }
}
