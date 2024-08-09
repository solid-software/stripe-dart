import 'dart:async';

import 'package:stripe/messages.dart';

import '../client.dart';
import '_resource.dart';

class CouponResource extends Resource<Coupon> {
  static const _resourceName = 'coupons';

  CouponResource(Client client) : super(client);

  Future<DataList<Coupon>> list([
    ListCouponsRequest? request,
  ]) async {
    final map = await get(_resourceName, queryParameters: request?.toJson());
    return DataList<Coupon>.fromJson(
      map,
      (value) => Coupon.fromJson(value as Map<String, dynamic>),
    );
  }
}
