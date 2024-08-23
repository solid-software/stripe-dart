import 'dart:async';

import 'package:stripe/messages.dart';
import 'package:stripe/src/expanded.dart';

import '../client.dart';
import '_resource.dart';

class SubscriptionResource extends Resource<Subscription> {
  static const _resourceName = 'subscriptions';

  SubscriptionResource(Client client) : super(client);

  /// https://docs.stripe.com/api/subscriptions/create
  Future<SubscriptionExpanded> create(CreateSubscriptionRequest request) async {
    final response = await post(_resourceName, data: request.toJson());

    return SubscriptionExpanded.fromJson(response, {
      SubscriptionExpandableField.discounts,
      SubscriptionExpandableField.latestInvoice,
    });
  }

  Future<Subscription> retrieve(String id) async {
    final response = await get('$_resourceName/$id');
    return Subscription.fromJson(response);
  }

  Future<SubscriptionExpanded> retrieveExpanded(
    String id, {
    required Set<SubscriptionExpandableField> expand,
  }) async {
    final response = await get(
      '$_resourceName/$id',
      queryParameters: {
        'expand': _expandParamComponents(expand),
      },
    );

    return SubscriptionExpanded.fromJson(response, expand);
  }

  List<String> _expandParamComponents(Set<SubscriptionExpandableField> fields) {
    return fields.map((field) {
      switch (field) {
        case SubscriptionExpandableField.discounts:
          return 'discounts';
        case SubscriptionExpandableField.latestInvoice:
          return 'latest_invoice.payment_intent';
        case SubscriptionExpandableField.customer:
          return 'customer';
      }
    }).toList();
  }

  Future<DataList<Subscription>> list(
      [ListSubscriptionsRequest? request]) async {
    final map = await get(_resourceName, queryParameters: request?.toJson());
    return DataList<Subscription>.fromJson(
        map, (value) => Subscription.fromJson(value as Map<String, dynamic>));
  }

  Future<DataList<SubscriptionExpanded>> listExpanded({
    required Set<SubscriptionExpandableField> expand,
    ListSubscriptionsRequest? request,
  }) async {
    final response = await get(
      _resourceName,
      queryParameters: {
        ...?request?.toJson(),
        'expand': _expandParamComponents(expand).map((e) => 'data.$e').toList(),
      },
    );

    return DataList<SubscriptionExpanded>.fromJson(
      response,
      (value) => SubscriptionExpanded.fromJson(
        value as Map<String, dynamic>,
        expand,
      ),
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
