part of '../../../messages.dart';

@JsonSerializable()
class CreateInvoiceRequest {
  final bool? autoAdvance;

  final CreateInvoiceAutomaticTaxRequest? automaticTax;

  final InvoiceBillingReason? billingReason;

  final InvoiceCollectionMethod? collectionMethod;

  final String? customer;

  final String? description;

  final Map<String, String>? metadata;

  final String? currency;

  final String? defaultPaymentMethod;

  final String? defaultSource;

  final List<CreateDiscountRequest>? discounts;

  CreateInvoiceRequest({
    this.autoAdvance,
    this.automaticTax,
    this.billingReason,
    this.collectionMethod,
    this.customer,
    this.description,
    this.metadata,
    this.currency,
    this.defaultPaymentMethod,
    this.defaultSource,
    this.discounts,
  });

  factory CreateInvoiceRequest.fromJson(Map<String, dynamic> json) =>
      _$CreateInvoiceRequestFromJson(json);

  Map<String, dynamic> toJson() => _$CreateInvoiceRequestToJson(this);
}

@JsonSerializable()
class CreateInvoiceAutomaticTaxRequest {
  final bool enabled;

  CreateInvoiceAutomaticTaxRequest({
    required this.enabled,
  });

  factory CreateInvoiceAutomaticTaxRequest.fromJson(
          Map<String, dynamic> json) =>
      _$CreateInvoiceAutomaticTaxRequestFromJson(json);

  Map<String, dynamic> toJson() =>
      _$CreateInvoiceAutomaticTaxRequestToJson(this);
}
