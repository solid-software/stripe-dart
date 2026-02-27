part of '../../messages.dart';

enum _InvoiceLineItemObject {
  @JsonValue('line_item')
  lineItem,
}

/// https://docs.stripe.com/api/invoice-line-item/object
@JsonSerializable()
class InvoiceLineItem extends Message {
  final _InvoiceLineItemObject object;

  /// Unique identifier for the object.
  final String id;

  /// The amount, in cents.
  final int amount;

  /// Three-letter ISO currency code, in lowercase. Must be a supported currency.
  final String currency;

  /// An arbitrary string attached to the object. Often useful for displaying to
  /// users.
  final String? description;

  /// The ID of the invoice that contains this line item.
  final String? invoice;

  /// Set of key-value pairs that you can attach to an object. This can be
  /// useful for storing additional information about the object in a structured
  /// format. Note that for line items with type=subscription, metadata reflects
  /// the current metadata from the subscription associated with the line item,
  /// unless the invoice line was directly updated with different metadata after
  /// creation.
  final Map<String, dynamic>? metadata;

  /// The parent that generated this line item.
  final InvoiceLineItemParent? parent;

  /// The period this line_item covers. For subscription line items, this is the
  /// subscription period. For prorations, this starts when the proration was
  /// calculated, and ends at the period end of the subscription. For invoice
  /// items, this is the time at which the invoice item was created or the
  /// period of the item. If you have Stripe Revenue Recognition enabled, the
  /// period will be used to recognize and defer revenue. See the Revenue
  /// Recognition documentation for details.
  final InvoiceLineItemPeriod? period;

  /// The price of the line item.
  final Price? price;

  /// The quantity of the subscription, if the line item is a subscription or a
  /// proration.
  final int? quantity;

  const InvoiceLineItem({
    required this.object,
    required this.id,
    required this.amount,
    required this.currency,
    this.description,
    this.invoice,
    this.metadata,
    this.parent,
    this.period,
    this.price,
    this.quantity,
  });

  factory InvoiceLineItem.fromJson(Map<String, dynamic> json) =>
      _$InvoiceLineItemFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$InvoiceLineItemToJson(this);
}

/// https://docs.stripe.com/api/invoice-line-item/object#invoice_line_item_object-period
@JsonSerializable()
class InvoiceLineItemPeriod extends Message {
  /// The start of the period. This value is inclusive.
  @TimestampConverter()
  final DateTime start;

  /// The end of the period, which must be greater than or equal to the start.
  /// This value is inclusive.
  @TimestampConverter()
  final DateTime end;

  const InvoiceLineItemPeriod({
    required this.start,
    required this.end,
  });

  factory InvoiceLineItemPeriod.fromJson(Map<String, dynamic> json) =>
      _$InvoiceLineItemPeriodFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$InvoiceLineItemPeriodToJson(this);
}

/// https://docs.stripe.com/api/invoices/object#invoice_object-lines-data-parent
@JsonSerializable()
class InvoiceLineItemParent extends Message {
  /// Details about the invoice item that generated this line item
  final InvoiceLineItemInvoiceItemDetails? invoiceItemDetails;

  /// The type of parent that generated this line item
  final InvoiceLineItemParentType type;

  const InvoiceLineItemParent({
    required this.type,
    this.invoiceItemDetails,
  });

  factory InvoiceLineItemParent.fromJson(Map<String, dynamic> json) =>
      _$InvoiceLineItemParentFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$InvoiceLineItemParentToJson(this);
}

/// https://docs.stripe.com/api/invoices/object#invoice_object-lines-data-parent-invoice_item_details
@JsonSerializable()
class InvoiceLineItemInvoiceItemDetails extends Message {
  /// The invoice item that generated this line item
  final String? invoiceItem;

  const InvoiceLineItemInvoiceItemDetails({
    this.invoiceItem,
  });

  factory InvoiceLineItemInvoiceItemDetails.fromJson(
          Map<String, dynamic> json) =>
      _$InvoiceLineItemInvoiceItemDetailsFromJson(json);

  @override
  Map<String, dynamic> toJson() =>
      _$InvoiceLineItemInvoiceItemDetailsToJson(this);
}

/// https://docs.stripe.com/api/invoices/object#invoice_object-lines-data-parent-type
enum InvoiceLineItemParentType {
  @JsonValue('invoice_item_details')
  invoiceItemDetails,

  @JsonValue('subscription_item_details')
  subscriptionItemDetails,
}
