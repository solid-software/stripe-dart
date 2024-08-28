import 'dart:async';

import 'package:stripe/messages.dart';

import '../client.dart';
import '_resource.dart';

/// Source objects allow you to accept a variety of payment methods.
/// They represent a customer’s payment instrument,
/// and can be used with the Stripe API just like a Card object:
/// once chargeable, they can be charged, or can be attached to customers.
@Deprecated('''Stripe doesn't recommend using the deprecated Sources API.
We recommend that you adopt the PaymentMethods API.
This newer API provides access to our latest features and payment method types.
''')
class SourcesResource extends Resource<Subscription> {
  final String customerId;

  String get _resourcePath => 'customers/$customerId/sources';

  SourcesResource(Client client, this.customerId) : super(client);

  Future<DataList<Source>> list() async {
    final map = await get(_resourcePath);
    return DataList<Source>.fromJson(
        map, (value) => Source.fromJson(value as Map<String, dynamic>));
  }
}
