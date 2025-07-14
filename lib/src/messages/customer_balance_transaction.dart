part of '../../../messages.dart';

enum _CustomerBalanceTransactionObject {
  @JsonValue('customer_balance_transaction')
  customerBalanceTransaction,
}

/// https://docs.stripe.com/api/customer_balance_transactions/object
@JsonSerializable()
class CustomerBalanceTransaction extends Message {
  final _CustomerBalanceTransactionObject object;

  /// Unique identifier for the object.
  final String id;

  /// The amount of the transaction. A negative value is a credit for the
  /// customer’s balance, and a positive value is a debit to the customer’s
  /// balance.
  final int amount;

  /// Three-letter ISO currency code, in lowercase. Must be a supported
  /// currency.
  final String currency;

  /// The ID of the customer the transaction belongs to.
  final String customer;

  /// The customer’s balance after the transaction was applied. A negative value
  /// decreases the amount due on the customer’s next invoice. A positive value
  /// increases the amount due on the customer’s next invoice.
  final int endingBalance;

  /// Transaction type. See the Customer Balance page to learn more about
  /// transaction types.
  final CustomerBalanceTransactionType type;

  /// Time at which the object was created. Measured in seconds since the Unix
  /// epoch.
  final int created;

  /// Has the value true if the object exists in live mode or the value false if
  /// the object exists in test mode.
  final bool livemode;

  /// An arbitrary string attached to the object. Often useful for displaying
  /// to users.
  final String? description;

  /// Set of key-value pairs that you can attach to an object. This can be
  /// useful for storing additional information about the object in a structured
  /// format.
  final Map<String, dynamic>? metadata;

  /// The ID of the checkout session (if any) that created the transaction.
  final String? checkoutSession;

  /// The ID of the credit note (if any) related to the transaction.
  final String? creditNote;

  /// The ID of the invoice (if any) related to the transaction.
  final String? invoice;

  CustomerBalanceTransaction({
    required this.object,
    required this.id,
    required this.amount,
    required this.currency,
    required this.customer,
    required this.endingBalance,
    required this.type,
    required this.created,
    required this.livemode,
    this.description,
    this.metadata,
    this.checkoutSession,
    this.creditNote,
    this.invoice,
  });

  factory CustomerBalanceTransaction.fromJson(Map<String, dynamic> json) =>
      _$CustomerBalanceTransactionFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$CustomerBalanceTransactionToJson(this);
}

/// https://docs.stripe.com/api/customer_balance_transactions/object#customer_balance_transaction_object-type
enum CustomerBalanceTransactionType {
  /// An explicitly created adjustment transaction to debit or credit the credit
  /// balance.
  adjustment,

  /// Traces the application of credit against a linked Invoice.
  @JsonValue('applied_to_invoice')
  appliedToInvoice,

  /// Traces the customer balance applied to an Invoice to be created for the
  /// linked Checkout Session.
  @JsonValue('checkout_session_subscription_payment')
  checkoutSessionSubscriptionPayment,

  /// Traces the reversal of an applied balance by the linked Checkout Session.
  /// Paired with an earlier ‘checkout_session_subscription_payment‘
  /// transaction.
  @JsonValue('checkout_session_subscription_payment_canceled')
  checkoutSessionSubscriptionPaymentCanceled,

  /// Traces the creation of credit to a Credit Note and its associated Invoice.
  @JsonValue('credit_note')
  creditNote,

  /// The starting value of the customer’s credit balance.
  initial,

  /// Credits to the credit balance when an invoice receives payments exceeding the amount due.
  @JsonValue('invoice_overpaid')
  invoiceOverpaid,

  /// Debits to the credit balance when the amount due on an invoice is greater
  /// than Stripe’s maximum chargeable amount and the customer does not have a
  /// cash balance.
  @JsonValue('invoice_too_large')
  invoiceTooLarge,

  /// Debits to the credit balance when the amount due on an invoice is less
  /// than Stripe’s minimum chargeable amount and the customer does not have a
  /// cash balance.
  @JsonValue('invoice_too_small')
  invoiceToSmall,

  /// Funds migrated from the legacy customer credit balance.
  migration,

  /// Traces the reversal of an applied credit balance from a linked Invoice.
  /// Paired with an earlier ‘applied_to_invoice’ transaction.
  @JsonValue('unapplied_from_invoice')
  unappliedFromInvoice,

  /// Unspent funds in receiver Sources that got automatically charged and
  /// credited to the balance.
  @JsonValue('unspent_receiver_credit')
  unspentReceiverCredit
}
