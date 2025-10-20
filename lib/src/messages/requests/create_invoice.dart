part of '../../../messages.dart';

/// https://docs.stripe.com/api/invoices/create
@JsonSerializable()
class CreateInvoiceRequest {
  /// Controls whether Stripe performs automatic collection of the invoice. If
  /// false, the invoice’s state doesn’t automatically advance without an
  /// explicit action. Defaults to false.
  final bool? autoAdvance;

  /// Settings for automatic tax lookup for this invoice.
  final CreateInvoiceAutomaticTaxRequest? automaticTax;

  /// Either charge_automatically, or send_invoice. When charging automatically,
  /// Stripe will attempt to pay this invoice using the default source attached
  /// to the customer. When sending an invoice, Stripe will email this invoice
  /// to the customer with payment instructions. Defaults to
  /// charge_automatically.
  final InvoiceCollectionMethod? collectionMethod;

  /// The ID of the customer who will be billed.
  final String? customer;

  /// An arbitrary string attached to the object. Often useful for displaying to users. Referenced as ‘memo’ in the Dashboard.
  final String? description;

  /// Set of key-value pairs that you can attach to an object. This can be
  /// useful for storing additional information about the object in a structured
  /// format. Individual keys can be unset by posting an empty value to them.
  /// All keys can be unset by posting an empty value to metadata.
  final Map<String, String>? metadata;

  /// The currency to create this invoice in. Defaults to that of customer if not specified.
  final String? currency;

  /// ID of the default payment method for the invoice. It must belong to the
  /// customer associated with the invoice. If not set, defaults to the
  /// subscription’s default payment method, if any, or to the default payment
  /// method in the customer’s invoice settings.
  final String? defaultPaymentMethod;

  /// ID of the default payment source for the invoice. It must belong to the
  /// customer associated with the invoice and be in a chargeable state. If not
  /// set, defaults to the subscription’s default source, if any, or to the
  /// customer’s default source.
  final String? defaultSource;

  /// The coupons and promotion codes to redeem into discounts for the invoice.
  /// If not specified, inherits the discount from the invoice’s customer. Pass
  /// an empty string to avoid inheriting any discounts.
  final List<CreateDiscountRequest>? discounts;

  CreateInvoiceRequest({
    this.autoAdvance,
    this.automaticTax,
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

/// https://docs.stripe.com/api/invoices/create#create_invoice-automatic_tax
@JsonSerializable()
class CreateInvoiceAutomaticTaxRequest {
  /// Whether Stripe automatically computes tax on this invoice. Note that
  /// incompatible invoice items (invoice items with manually specified tax
  /// rates, negative amounts, or tax_behavior=unspecified) cannot be added to
  /// automatic tax invoices.
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
