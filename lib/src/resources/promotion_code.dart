import 'dart:async';

import 'package:stripe/messages.dart';
import 'package:stripe/src/resources/_api_config.dart';

import '../client.dart';
import '_resource.dart';

class PromotionCodeResource extends Resource<PromotionCode> {
  static const _resourceName = 'promotion_codes';

  PromotionCodeResource(Client client, ApiConfig config)
      : super(client, config);

  Future<DataList<PromotionCode>> list([
    ListPromotionCodesRequest? request,
  ]) async {
    final map = await client.get(
      makeUrl(_resourceName),
      queryParameters: request?.toJson(),
    );
    return DataList<PromotionCode>.fromJson(
      map,
      (value) => PromotionCode.fromJson(value as Map<String, dynamic>),
    );
  }
}
