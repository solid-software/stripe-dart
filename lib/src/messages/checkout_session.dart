part of '../../messages.dart';

enum _CheckoutSessionObject {
  @JsonValue('checkout.session')
  checkoutSession
}

enum PaymentMethodType {
  // ignore: constant_identifier_names
  acss_debit,
  affirm,
  // ignore: constant_identifier_names
  afterpay_clearpay,
  alipay,
  // ignore: constant_identifier_names
  amazon_pay,
  // ignore: constant_identifier_names
  au_becs_debit,
  // ignore: constant_identifier_names
  bacs_debit,
  bancontact,
  blik,
  boleto,
  card,
  cashapp,
  // ignore: constant_identifier_names
  customer_balance,
  eps,
  fpx,
  giropay,
  grabpay,
  ideal,
  klarna,
  konbini,
  link,
  oxxo,
  p24,
  paynow,
  pix,
  promptpay,
  // ignore: constant_identifier_names
  sepa_debit,
  sofort,
  // ignore: constant_identifier_names
  us_bank_account,
  // ignore: constant_identifier_names
  wechat_pay,
}

enum CheckoutSessionMode {
  payment,
  setup,
  subscription,
}

enum CheckoutSessionPaymentStatus {
  @JsonValue('no_payment_required')
  noPaymentRequired,
  paid,
  unpaid,
}

enum CheckoutSessionStatus {
  complete,
  expired,
  open,
}

enum CheckoutSessionUIMode {
  custom,
  embedded,
  hosted,
}

/// https://stripe.com/docs/api/checkout/sessions/object
@JsonSerializable()
class CheckoutSession extends Message {
  final _CheckoutSessionObject object;
  final String id;
  final String? clientReferenceId;
  final String? customer;
  final String? customerEmail;
  final DataList<CheckoutSessionLineItem>? lineItems;
  final Map<String, dynamic>? metadata;
  final CheckoutSessionMode mode;
  final String? paymentIntent;
  final CheckoutSessionPaymentStatus paymentStatus;
  final String? returnUrl;
  final CheckoutSessionStatus status;
  final String? successfulUrl;
  final CheckoutSessionUIMode? uiMode;
  final String? url;
  final int? amountSubtotal;
  final int? amountTotal;
  final String? cancelUrl;
  final String? clientSecret;
  final int created;
  final int expiresAt;
  final String? invoice;
  final bool livemode;
  final String? paymentLink;
  final String? setupIntent;
  final String? subscription;
  final List<PaymentMethodType> paymentMethodTypes;

  CheckoutSession({
    required this.object,
    required this.id,
    required this.paymentMethodTypes,
    required this.mode,
    required this.paymentStatus,
    required this.status,
    required this.created,
    required this.expiresAt,
    required this.livemode,
    this.clientReferenceId,
    this.customer,
    this.customerEmail,
    this.lineItems,
    this.metadata,
    this.returnUrl,
    this.successfulUrl,
    this.url,
    this.uiMode,
    this.amountSubtotal,
    this.amountTotal,
    this.cancelUrl,
    this.clientSecret,
    this.invoice,
    this.paymentLink,
    this.setupIntent,
    this.subscription,
    this.paymentIntent,
  });

  factory CheckoutSession.fromJson(Map<String, dynamic> json) =>
      _$CheckoutSessionFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$CheckoutSessionToJson(this);
}

enum _CheckoutSessionLineItemObject {
  @JsonValue('line_item')
  lineItem,
}

@JsonSerializable()
class CheckoutSessionLineItem extends Message {
  final _CheckoutSessionLineItemObject object;
  final String id;
  final int amountDiscount;
  final int amountSubtotal;
  final int amountTax;
  final int amountTotal;
  final String currency;
  final String? description;
  final Price? price;
  final int? quantity;

  const CheckoutSessionLineItem({
    required this.object,
    required this.id,
    required this.amountDiscount,
    required this.amountSubtotal,
    required this.amountTax,
    required this.amountTotal,
    required this.currency,
    this.description,
    this.price,
    this.quantity,
  });

  factory CheckoutSessionLineItem.fromJson(Map<String, dynamic> json) =>
      _$CheckoutSessionLineItemFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$CheckoutSessionLineItemToJson(this);
}
