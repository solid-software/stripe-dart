import 'dart:async';

import 'package:stripe/messages.dart';
import 'package:stripe/src/resources/_api_config.dart';

import '../client.dart';
import '_resource.dart';

class ProductResource extends Resource<Product> {
  ProductResource(Client client, ApiConfig config) : super(client, config);

  Future<Product> retrieve(String id) async {
    final map = await client.get(
      makeUrl('products/$id'),
    );
    return Product.fromJson(map);
  }

  Future<DataList<Product>> list([ListProductsRequest? request]) async {
    final map = await client.get(
      makeUrl('products'),
      queryParameters: request?.toJson(),
    );
    return DataList<Product>.fromJson(
        map, (value) => Product.fromJson(value as Map<String, dynamic>));
  }

  Future<Product> create(CreateProductRequest request) async {
    final map = await client.post(
      makeUrl('products'),
      data: request.toJson(),
    );
    return Product.fromJson(map);
  }

  Future<DataList<Product>> search({
    /// https://docs.stripe.com/search#query-fields-for-products
    required String queryString,
  }) async {
    final Map<String, dynamic> map = await client.get(
      makeUrl('products/search'),
      queryParameters: {'query': queryString},
    );

    final products = DataList<Product>.fromJson(
      map,
      (subscriptionMap) =>
          Product.fromJson(subscriptionMap as Map<String, dynamic>),
    );

    return products;
  }
}
