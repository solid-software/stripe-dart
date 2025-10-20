part of '../../../messages.dart';

/// https://docs.stripe.com/api/invoiceitems/create
@JsonSerializable()
class CreateInvoiceItemRequest extends Message {
  /// The ID of the customer who will be billed when this invoice item is billed.
  final String customer;

  /// An arbitrary string which you can attach to the invoice item. The
  /// description is displayed in the invoice for easy tracking.
  final String? description;

  /// The pricing information for the invoice item.
  final CreateInvoiceItemPricingRequest? pricing;

  /// The ID of an existing invoice to add this invoice item to. For
  /// subscription invoices, when left blank, the invoice item will be added to
  /// the next upcoming scheduled invoice. For standalone invoices, the invoice
  /// item won’t be automatically added unless you pass
  /// pending_invoice_item_behavior: 'include' when creating the invoice. This
  /// is useful when adding invoice items in response to an invoice.created
  /// webhook. You can only add invoice items to draft invoices and there is a
  /// maximum of 250 items per invoice.
  final String? invoice;

  /// Set of key-value pairs that you can attach to an object. This can be
  /// useful for storing additional information about the object in a structured
  /// format. Individual keys can be unset by posting an empty value to them.
  /// All keys can be unset by posting an empty value to metadata.
  final Map<String, dynamic>? metadata;

  const CreateInvoiceItemRequest({
    required this.customer,
    this.description,
    this.pricing,
    this.invoice,
    this.metadata,
  });

  factory CreateInvoiceItemRequest.fromJson(Map<String, dynamic> json) =>
      _$CreateInvoiceItemRequestFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$CreateInvoiceItemRequestToJson(this);
}

/// https://docs.stripe.com/api/invoiceitems/create#create_invoiceitem-pricing
@JsonSerializable()
class CreateInvoiceItemPricingRequest extends Message {
  /// The ID of the price object.
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
