import 'dart:async';

import 'package:stripe/messages.dart';
import 'package:stripe/src/expanded/subscription_expanded.dart';
import 'package:stripe/src/utils/expandable_field.dart';
import 'package:stripe/src/utils/expandable_list_field.dart';

import '../client.dart';
import '_resource.dart';

class SubscriptionResource extends Resource<Subscription> {
  static const _resourceName = 'subscriptions';

  SubscriptionResource(Client client) : super(client);

  Future<Subscription> retrieve(String id) async {
    final response = await get('$_resourceName/$id');
    return Subscription.fromJson(response);
  }

  Future<SubscriptionExpanded> retrieveExpanded(
    String id, {
    required Set<SubscriptionExpandableField> expand,
  }) async {
    final expandableFields = _expandableFields(expand);
    final response = await get(
      '$_resourceName/$id',
      queryParameters: {
        'expand': expandableFields.map((e) => e.field).toList(),
      },
    );

    List<Discount>? discounts;
    if (expand.contains(SubscriptionExpandableField.discounts)) {
      discounts = _DiscountsExpandableField().extract(response);
    }

    return SubscriptionExpanded(
      subscription: Subscription.fromJson(response),
      discounts: discounts,
    );
  }

  Iterable<ExpandableField> _expandableFields(
    Set<SubscriptionExpandableField> fields,
  ) {
    return fields.map(
      (field) => _expandableField(field),
    );
  }

  ExpandableField _expandableField(
    SubscriptionExpandableField field,
  ) {
    switch (field) {
      case SubscriptionExpandableField.discounts:
        return _DiscountsExpandableField();
    }
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
    final expandableFields = _expandableFields(expand);

    final response = await get(
      _resourceName,
      queryParameters: {
        ...?request?.toJson(),
        'expand': expandableFields.map((e) => 'data.${e.field}').toList(),
      },
    );

    return DataList<SubscriptionExpanded>.fromJson(
      response,
      (value) => _parseSubscriptionExpanded(
        value as Map<String, dynamic>,
        expand,
      ),
    );
  }

  SubscriptionExpanded _parseSubscriptionExpanded(
    Map<String, dynamic> json,
    Set<SubscriptionExpandableField> expand,
  ) {
    List<Discount>? discounts;
    if (expand.contains(SubscriptionExpandableField.discounts)) {
      discounts = _DiscountsExpandableField().extract(json);
    }

    return SubscriptionExpanded(
      subscription: Subscription.fromJson(json),
      discounts: discounts,
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

class _DiscountsExpandableField extends ExpandableListField<Discount> {
  @override
  String get field => 'discounts';

  const _DiscountsExpandableField();

  @override
  String elementReplacement(Discount element) => element.id;

  @override
  Discount parseElement(Map<String, dynamic> element) =>
      Discount.fromJson(element);
}
