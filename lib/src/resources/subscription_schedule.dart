import 'package:stripe/src/api_config.dart';

import '../../messages.dart';
import '../client.dart';
import '_resource.dart';

class SubscriptionScheduleResource extends Resource {
  SubscriptionScheduleResource(Client client, ApiConfig config)
      : super(client, config);

  /// https://stripe.com/docs/api/subscription_schedules/retrieve
  Future<SubscriptionSchedule> retrieve(String id) async {
    final response = await client.get(
      makeUrl('subscription_schedules/$id'),
    );

    return SubscriptionSchedule.fromJson(response);
  }

  /// https://stripe.com/docs/api/subscription_schedules/list
  Future<DataList<SubscriptionSchedule>> list([
    ListSubscriptionSchedulesRequest? request,
  ]) async {
    final map = await client.get(
      makeUrl('subscription_schedules'),
      queryParameters: request?.toJson(),
    );

    return DataList<SubscriptionSchedule>.fromJson(
      map,
      (value) => SubscriptionSchedule.fromJson(value as Map<String, dynamic>),
    );
  }

  /// https://stripe.com/docs/api/subscription_schedules/create
  Future<SubscriptionSchedule> create(
    CreateSubscriptionScheduleRequest request,
  ) async {
    final response = await client.post(
      makeUrl('subscription_schedules'),
      data: request.toJson(),
    );

    return SubscriptionSchedule.fromJson(response);
  }

  /// https://stripe.com/docs/api/subscription_schedules/update
  Future<SubscriptionSchedule> update(
    String id,
    UpdateSubscriptionScheduleRequest request,
  ) async {
    final response = await client.post(
      makeUrl('subscription_schedules/$id'),
      data: request.toJson(),
    );

    return SubscriptionSchedule.fromJson(response);
  }
}
