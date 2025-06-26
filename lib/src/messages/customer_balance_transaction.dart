part of '../../../messages.dart';

enum _CustomerBalanceTransactionObject {
  @JsonValue('customer_balance_transaction')
  customerBalanceTransaction,
}

@JsonSerializable()
class CustomerBalanceTransaction extends Message {
  final _CustomerBalanceTransactionObject object;

  final String id;

  final int amount;

  final String currency;

  final String customer;

  final int endingBalance;

  final CustomerBalanceTransactionType type;

  final int created;

  final bool livemode;

  final String? description;

  final Map<String, dynamic>? metadata;

  final String? checkoutSession;

  final String? creditNote;

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

enum CustomerBalanceTransactionType {
  adjustment,
  @JsonValue('applied_to_invoice')
  appliedToInvoice,
  @JsonValue('checkout_session_subscription_payment')
  checkoutSessionSubscriptionPayment,
  @JsonValue('checkout_session_subscription_payment_canceled')
  checkoutSessionSubscriptionPaymentCanceled,
  @JsonValue('credit_note')
  creditNote,
  initial,
  @JsonValue('invoice_overpaid')
  invoiceOverpaid,
  @JsonValue('invoice_too_large')
  invoiceTooLarge,
  @JsonValue('invoice_too_small')
  invoiceToSmall,
  migration,
  @JsonValue('unapplied_from_invoice')
  unappliedFromInvoice,
  @JsonValue('unspent_receiver_credit')
  unspentReceiverCredit
}
