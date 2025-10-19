part of '../../../messages.dart';

@JsonSerializable()
class CreateInvoiceItemRequest extends Message {
  final String customer;

  final String? description;

  const CreateInvoiceItemRequest({
    required this.customer,
    this.description,
  });

  factory CreateInvoiceItemRequest.fromJson(Map<String, dynamic> json) =>
      _$CreateInvoiceItemRequestFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$CreateInvoiceItemRequestToJson(this);
}

@JsonSerializable()
class CreateInvoiceItemPricingRequest extends Message {
  final String? price;

  final String? invoice;

  const CreateInvoiceItemPricingRequest({
    this.price,
    this.invoice,
  });

  factory CreateInvoiceItemPricingRequest.fromJson(Map<String, dynamic> json) =>
      _$CreateInvoiceItemPricingRequestFromJson(json);

  @override
  Map<String, dynamic> toJson() =>
      _$CreateInvoiceItemPricingRequestToJson(this);
}
