import 'dart:async';

import 'package:stripe/messages.dart';
import 'package:stripe/src/resources/_api_config.dart';

import '../client.dart';
import '_resource.dart';

class SubscriptionItemResource extends Resource<SubscriptionItem> {
  SubscriptionItemResource(Client client, ApiConfig config)
      : super(client, config);

  Future<SubscriptionItem> retrieve(String id) async {
    final response = await client.get(
      makeUrl('subscription_items/$id'),
    );
    return SubscriptionItem.fromJson(response);
  }

  Future<DataList<SubscriptionItem>> list([
    ListSubscriptionItemsRequest? request,
  ]) async {
    final map = await client.get(
      makeUrl('subscription_items'),
      queryParameters: request?.toJson(),
    );
    return DataList<SubscriptionItem>.fromJson(
      map,
      (value) => SubscriptionItem.fromJson(value as Map<String, dynamic>),
    );
  }

  Future<SubscriptionItem> update(
    String id, {
    required SubscriptionItemUpdate update,
  }) async {
    final response = await client.post(
      makeUrl('subscription_items/$id'),
      data: update.toJson(),
    );

    return SubscriptionItem.fromJson(response);
  }

  Future<SubscriptionItem> deleteItem(
    String id, {
    bool? clearUsage,
  }) async {
    final response = await client.delete(
      makeUrl('subscription_items/$id'),
    );

    return SubscriptionItem.fromJson(response);
  }
}
