part of '../../messages.dart';

/// https://docs.stripe.com/api/invoices/object
@JsonSerializable()
class Invoice extends Message {
  /// Unique identifier for the object. This property is always present unless
  /// the invoice is an upcoming invoice.
  final String id;

  /// Three-letter ISO currency code, in lowercase. Must be a supported
  /// currency.
  final String currency;

  /// The ID of the customer who will be billed.
  final String customer;

  /// Total after discounts and taxes.
  final int total;

  /// The integer amount in cents representing the total amount of the invoice
  /// including all discounts but excluding all tax.
  final int totalExcludingTax;

  /// An arbitrary string attached to the object. Often useful for displaying
  /// to users. Referenced as ‘memo’ in the Dashboard.
  final String? description;

  /// The URL for the hosted invoice page, which allows customers to view and
  /// pay an invoice. If the invoice has not been finalized yet, this will be
  /// null.
  final String? hostedInvoiceUrl;

  /// The status of the invoice, one of draft, open, paid, uncollectible, or
  /// void.
  final String? status;

  /// The subscription that this invoice was prepared for, if any.
  final String? subscription;

  /// Total of all subscriptions, invoice items, and prorations on the invoice
  /// before any invoice level discount or exclusive tax is applied. Item
  /// discounts are already incorporated.
  final int subtotal;

  /// The integer amount in cents representing the subtotal of the invoice
  /// before any invoice level discount or tax is applied. Item discounts are
  /// already incorporated
  final int subtotalExcludingTax;

  /// The aggregate amounts calculated per discount across all line items.
  final List<TotalDiscountAmount> totalDiscountAmounts;

  /// The PaymentIntent associated with this invoice. The PaymentIntent is
  /// generated when the invoice is finalized, and can then be used to pay the
  /// invoice. Note that voiding an invoice will cancel the PaymentIntent.
  final String? paymentIntent;

  /// The country of the business associated with this invoice, most often the
  /// business creating the invoice.
  final String? accountCountry;

  /// The public name of the business associated with this invoice, most often
  /// the business creating the invoice.
  final String? accountName;

  Invoice({
    required this.id,
    required this.currency,
    required this.customer,
    required this.total,
    required this.totalExcludingTax,
    required this.subtotal,
    required this.subtotalExcludingTax,
    required this.totalDiscountAmounts,
    this.description,
    this.hostedInvoiceUrl,
    this.status,
    this.subscription,
    this.paymentIntent,
    this.accountCountry,
    this.accountName,
  });

  factory Invoice.fromJson(Map<String, dynamic> json) =>
      _$InvoiceFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$InvoiceToJson(this);
}

/// https://docs.stripe.com/api/invoices/object#invoice_object-total_discount_amounts
@JsonSerializable()
class TotalDiscountAmount extends Message {
  /// The amount, in cents, of the discount.
  final int amount;

  /// The discount that was applied to get this discount amount.
  final String discount;

  TotalDiscountAmount({
    required this.amount,
    required this.discount,
  });

  factory TotalDiscountAmount.fromJson(Map<String, dynamic> json) =>
      _$TotalDiscountAmountFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$TotalDiscountAmountToJson(this);
}
