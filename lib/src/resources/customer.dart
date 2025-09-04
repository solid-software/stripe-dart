import 'dart:async';

import 'package:stripe/messages.dart';
import 'package:stripe/src/resources/_api_config.dart';
import 'package:stripe/src/resources/source.dart';

import '../client.dart';
import '_resource.dart';

class CustomerResource extends Resource<Customer> {
  CustomerResource(Client client, ApiConfig config) : super(client, config);

  Future<Customer> create(CreateCustomerRequest request) async {
    final response = await client.post(
      makeUrl('customers'),
      data: request.toJson(),
    );
    return Customer.fromJson(response);
  }

  Future<Customer> retrieve(String customerId) async {
    final map = await client.get(
      makeUrl('customers/$customerId'),
    );
    return Customer.fromJson(map);
  }

  Future<Customer> update(UpdateCustomerRequest request) async {
    final response = await client.post(
      makeUrl('customers/${request.id}'),
      data: request.toJson(),
    );
    return Customer.fromJson(response);
  }

  Future<DataList<Customer>> search({
    /// https://docs.stripe.com/search#query-fields-for-customers
    required String queryString,
  }) async {
    final Map<String, dynamic> map = await client.get(
      makeUrl('customers/search'),
      queryParameters: {'query': queryString},
    );

    final customer = DataList<Customer>.fromJson(
      map,
      (customerMap) => Customer.fromJson(customerMap as Map<String, dynamic>),
    );

    return customer;
  }

  @Deprecated('''Stripe doesn't recommend using the deprecated Sources API.
We recommend that you adopt the PaymentMethods API.
This newer API provides access to our latest features and payment method types.
''')
  SourceResource sources(String customerId) {
    return SourceResource(
      client,
      config,
      customerId,
    );
  }
}
