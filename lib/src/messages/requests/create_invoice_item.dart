part of '../../../messages.dart';

@JsonSerializable()
class CreateInvoiceItemRequest extends Message {
  final String customer;

  final String? description;

  final CreateInvoiceItemPricingRequest? pricing;

  final String? invoice;

  const CreateInvoiceItemRequest({
    required this.customer,
    this.description,
    this.pricing,
    this.invoice,
  });

  factory CreateInvoiceItemRequest.fromJson(Map<String, dynamic> json) =>
      _$CreateInvoiceItemRequestFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$CreateInvoiceItemRequestToJson(this);
}

@JsonSerializable()
class CreateInvoiceItemPricingRequest extends Message {
  final String? price;

  const CreateInvoiceItemPricingRequest({
    this.price,
  });

  factory CreateInvoiceItemPricingRequest.fromJson(Map<String, dynamic> json) =>
      _$CreateInvoiceItemPricingRequestFromJson(json);

  @override
  Map<String, dynamic> toJson() =>
      _$CreateInvoiceItemPricingRequestToJson(this);
}
