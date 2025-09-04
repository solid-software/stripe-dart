import 'dart:async';

import 'package:stripe/messages.dart';
import 'package:stripe/src/resources/_api_config.dart';

import '../client.dart';
import '_resource.dart';

class PriceResource extends Resource<Price> {
  PriceResource(Client client, ApiConfig config) : super(client, config);

  Future<Price> retrieve(String id) async {
    final map = await client.get(
      makeUrl('prices/$id'),
    );
    return Price.fromJson(map);
  }

  Future<DataList<Price>> list([ListPricesRequest? request]) async {
    final map = await client.get(
      makeUrl('prices'),
      queryParameters: request?.toJson(),
    );
    return DataList<Price>.fromJson(
        map, (value) => Price.fromJson(value as Map<String, dynamic>));
  }

  Future<Price> create(CreatePriceRequest request) async {
    final map = await client.post(
      makeUrl('prices'),
      data: request.toJson(),
    );
    return Price.fromJson(map);
  }

  Future<DataList<Price>> search({
    /// https://docs.stripe.com/search#query-fields-for-prices
    required String queryString,
  }) async {
    final Map<String, dynamic> map = await client.get(
      makeUrl('prices/search'),
      queryParameters: {'query': queryString},
    );

    final prices = DataList<Price>.fromJson(
      map,
      (subscriptionMap) =>
          Price.fromJson(subscriptionMap as Map<String, dynamic>),
    );

    return prices;
  }
}
