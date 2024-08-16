part of '../../../messages.dart';

@JsonSerializable()
class CreateDiscountRequest {
  final String? coupon;
  final String? discount;
  final String? promotionCode;

  CreateDiscountRequest({
    this.coupon,
    this.discount,
    this.promotionCode,
  });

  factory CreateDiscountRequest.fromJson(Map<String, dynamic> json) =>
      _$CreateDiscountRequestFromJson(json);

  Map<String, dynamic> toJson() => _$CreateDiscountRequestToJson(this);
}
