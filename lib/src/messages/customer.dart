part of '../../messages.dart';

enum _CustomerObject { customer }

/// https://stripe.com/docs/api/charges/object
@JsonSerializable()
class Customer extends Message {
  final _CustomerObject object;

  /// Unique identifier for the object.
  final String id;

  /// The customer’s address.
  final Address? address;

  /// The customer’s default invoice settings.
  final InvoiceSettings? invoiceSettings;

  /// An arbitrary string attached to the object. Often useful for displaying to
  /// users.
  final String? description;

  /// The customer’s email address.
  final String? email;

  /// Set of key-value pairs that you can attach to an object. This can be
  /// useful for storing additional information about the object in a structured
  /// format.
  final Map<String, dynamic>? metadata;

  /// The customer’s full name or business name.
  final String? name;

  /// ID of the default payment source for the customer.

  /// If you use payment methods created through the PaymentMethods API,
  /// see the invoice_settings.default_payment_method field instead.
  @Deprecated('Use PaymentMethods API instead.')
  final String? defaultSource;

  /// The current balance, if any, that’s stored on the customer in their
  /// default currency. If negative, the customer has credit to apply to their
  /// next invoice. If positive, the customer has an amount owed that’s added
  /// to their next invoice. The balance only considers amounts that Stripe
  /// hasn’t successfully applied to any invoice. It doesn’t reflect unpaid
  /// invoices. This balance is only taken into account after invoices finalize.
  final int balance;

  /// Mailing and shipping address for the customer. Appears on invoices
  /// emailed to this customer.
  final Shipping? shipping;

  Customer({
    required this.object,
    required this.id,
    required this.invoiceSettings,
    required this.balance,
    this.address,
    this.description,
    this.email,
    this.metadata,
    this.name,
    this.defaultSource,
    this.shipping,
  });

  factory Customer.fromJson(Map<String, dynamic> json) =>
      _$CustomerFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$CustomerToJson(this);
}

/// The customer’s default invoice settings.
/// https://docs.stripe.com/api/customers/object#customer_object-invoice_settings
@JsonSerializable()
class InvoiceSettings {
  /// ID of a payment method that’s attached to the customer, to be used as the
  /// customer’s default payment method for subscriptions and invoices.
  final String? defaultPaymentMethod;

  InvoiceSettings({
    this.defaultPaymentMethod,
  });

  factory InvoiceSettings.fromJson(Map<String, dynamic> json) =>
      _$InvoiceSettingsFromJson(json);

  Map<String, dynamic> toJson() => _$InvoiceSettingsToJson(this);
}

/// Mailing and shipping address for the customer. Appears on invoices emailed
/// to this customer.
/// https://docs.stripe.com/api/customers/object#customer_object-shipping
@JsonSerializable()
class Shipping {
  /// Customer shipping address.
  final Address? address;

  /// Customer name.
  final String? name;

  /// Customer phone (including extension).
  final String? phone;

  const Shipping({
    this.address,
    this.name,
    this.phone,
  });

  factory Shipping.fromJson(Map<String, dynamic> json) =>
      _$ShippingFromJson(json);

  Map<String, dynamic> toJson() => _$ShippingToJson(this);
}
