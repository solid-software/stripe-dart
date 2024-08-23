import 'dart:async';

import 'package:stripe/messages.dart';
import 'package:stripe/src/expanded.dart';
import 'package:stripe/src/utils/expandable_fields/discounts_expandable_field.dart';
import 'package:stripe/src/utils/expandable_fields/latest_invoice_expandable_field.dart';
import 'package:stripe/src/utils/expandable_fields/subscription_expandable_field.dart';

import '../client.dart';
import '_resource.dart';

class SubscriptionResource extends Resource<Subscription> {
  static const _resourceName = 'subscriptions';

  SubscriptionResource(Client client) : super(client);

  /// https://docs.stripe.com/api/subscriptions/create
  Future<SubscriptionExpanded> create(CreateSubscriptionRequest request) async {
    final response = await post(_resourceName, data: request.toJson());

    return SubscriptionExpandableField(
      discountsExpansion: DiscountsExpandableField(),
      latestInvoiceExpansion: LatestInvoiceExpandableField(),
    ).extract(response)!;
  }

  Future<Subscription> retrieve(String id) async {
    final response = await get('$_resourceName/$id');
    return Subscription.fromJson(response);
  }

  Future<SubscriptionExpanded> retrieveExpanded(
    String id, {
    required SubscriptionExpandableField expand,
  }) async {
    final response = await get(
      '$_resourceName/$id',
      queryParameters: {
        'expand': expand.nestedFieldPaths.toList(),
      },
    );

    return expand.extract(response)!;
  }

  Future<DataList<Subscription>> list(
      [ListSubscriptionsRequest? request]) async {
    final map = await get(_resourceName, queryParameters: request?.toJson());
    return DataList<Subscription>.fromJson(
        map, (value) => Subscription.fromJson(value as Map<String, dynamic>));
  }

  Future<DataList<SubscriptionExpanded>> listExpanded({
    required SubscriptionExpandableField expand,
    ListSubscriptionsRequest? request,
  }) async {
    final response = await get(
      _resourceName,
      queryParameters: {
        ...?request?.toJson(),
        'expand': expand.nestedFieldPaths.toList(),
      },
    );

    return DataList<SubscriptionExpanded>.fromJson(
      response,
      (value) => expand.extract(value as Map<String, Object?>)!,
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
