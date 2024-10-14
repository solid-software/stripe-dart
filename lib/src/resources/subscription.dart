import 'dart:async';

import 'package:stripe/messages.dart';
import 'package:stripe/src/messages/expandable_objects/subscription_expandable_object.dart';

import '../client.dart';
import '_resource.dart';

class SubscriptionResource extends Resource<Subscription> {
  static const _resourceName = 'subscriptions';

  SubscriptionResource(Client client) : super(client);

  /// https://docs.stripe.com/api/subscriptions/create
  Future<Subscription> create(CreateSubscriptionRequest request) async {
    final response = await post(_resourceName, data: request.toJson());

    return Subscription.fromJson(response);
  }

  Future<Subscription> retrieve(
    String id, {
    SubscriptionExpandableObject? expand,
  }) async {
    final response = await get(
      '$_resourceName/$id',
      queryParameters: {
        if (expand != null) 'expand': expand.expandQuery(),
      },
    );
    return Subscription.fromJson(response);
  }

  Future<DataList<Subscription>> list([
    ListSubscriptionsRequest? request,
    SubscriptionExpandableObject? expand,
  ]) async {
    final map = await get(
      _resourceName,
      queryParameters: {
        ...?request?.toJson(),
        if (expand != null) 'expand': expand.expandQuery(),
      },
    );
    return DataList<Subscription>.fromJson(
      map,
      (value) => Subscription.fromJson(value as Map<String, dynamic>),
    );
  }

  Future<DataList<Subscription>> search({
    /// https://docs.stripe.com/search#query-fields-for-subscriptions
    required String queryString,
  }) async {
    final Map<String, dynamic> map = await get(
      '$_resourceName/search',
      queryParameters: {'query': queryString},
    );

    final subscriptions = DataList<Subscription>.fromJson(
      map,
      (subscriptionMap) =>
          Subscription.fromJson(subscriptionMap as Map<String, dynamic>),
    );

    return subscriptions;
  }

  /// https://docs.stripe.com/api/subscriptions/update
  Future<Subscription> update(
    String id, {
    required SubscriptionUpdate update,
  }) async {
    final response = await post(
      '$_resourceName/$id',
      data: update.toJson(),
    );

    return Subscription.fromJson(response);
  }

  /// https://docs.stripe.com/api/subscriptions/cancel
  Future<Subscription> cancel(
    String id, {
    bool? invoiceNow,
    bool? prorate,
  }) async {
    final response = await delete(
      '$_resourceName/$id',
      data: {
        if (invoiceNow != null) 'invoice_now': invoiceNow,
        if (prorate != null) 'prorate': invoiceNow,
      },
    );

    return Subscription.fromJson(response);
  }
}
