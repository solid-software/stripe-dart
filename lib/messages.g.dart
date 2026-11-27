// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'messages.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Address _$AddressFromJson(Map<String, dynamic> json) => Address(
  city: json['city'] as String?,
  country: json['country'] as String?,
  line1: json['line1'] as String?,
  line2: json['line2'] as String?,
  postalCode: json['postal_code'] as String?,
  state: json['state'] as String?,
);

Map<String, dynamic> _$AddressToJson(Address instance) => <String, dynamic>{
  'city': ?instance.city,
  'country': ?instance.country,
  'line1': ?instance.line1,
  'line2': ?instance.line2,
  'postal_code': ?instance.postalCode,
  'state': ?instance.state,
};

BalanceTransaction _$BalanceTransactionFromJson(Map<String, dynamic> json) =>
    BalanceTransaction(
      object: $enumDecode(_$_BalanceTransactionObjectEnumMap, json['object']),
      id: json['id'] as String,
      amount: (json['amount'] as num).toInt(),
      fee: (json['fee'] as num).toInt(),
      feeDetails: (json['fee_details'] as List<dynamic>)
          .map((e) => FeeDetails.fromJson(e as Map<String, dynamic>))
          .toList(),
      net: (json['net'] as num).toInt(),
      currency: json['currency'] as String,
    );

Map<String, dynamic> _$BalanceTransactionToJson(BalanceTransaction instance) =>
    <String, dynamic>{
      'object': _$_BalanceTransactionObjectEnumMap[instance.object]!,
      'id': instance.id,
      'amount': instance.amount,
      'fee': instance.fee,
      'fee_details': instance.feeDetails.map((e) => e.toJson()).toList(),
      'net': instance.net,
      'currency': instance.currency,
    };

const _$_BalanceTransactionObjectEnumMap = {
  _BalanceTransactionObject.balance_transaction: 'balance_transaction',
};

FeeDetails _$FeeDetailsFromJson(Map<String, dynamic> json) => FeeDetails(
  amount: (json['amount'] as num).toInt(),
  application: json['application'] as String?,
  currency: json['currency'] as String,
  description: json['description'] as String,
  type: json['type'] as String,
);

Map<String, dynamic> _$FeeDetailsToJson(FeeDetails instance) =>
    <String, dynamic>{
      'amount': instance.amount,
      'application': ?instance.application,
      'currency': instance.currency,
      'description': instance.description,
      'type': instance.type,
    };

BillingCycleAnchorConfig _$BillingCycleAnchorConfigFromJson(
  Map<String, dynamic> json,
) => BillingCycleAnchorConfig(
  month: (json['month'] as num?)?.toInt(),
  dayOfMonth: (json['day_of_month'] as num?)?.toInt(),
  hour: (json['hour'] as num?)?.toInt(),
  minute: (json['minute'] as num?)?.toInt(),
  second: (json['second'] as num?)?.toInt(),
);

Map<String, dynamic> _$BillingCycleAnchorConfigToJson(
  BillingCycleAnchorConfig instance,
) => <String, dynamic>{
  'month': ?instance.month,
  'day_of_month': ?instance.dayOfMonth,
  'hour': ?instance.hour,
  'minute': ?instance.minute,
  'second': ?instance.second,
};

BillingDetails _$BillingDetailsFromJson(Map<String, dynamic> json) =>
    BillingDetails(
      address: json['address'] == null
          ? null
          : Address.fromJson(json['address'] as Map<String, dynamic>),
      email: json['email'] as String?,
      name: json['name'] as String?,
      phone: json['phone'] as String?,
    );

Map<String, dynamic> _$BillingDetailsToJson(BillingDetails instance) =>
    <String, dynamic>{
      'address': ?instance.address?.toJson(),
      'email': ?instance.email,
      'name': ?instance.name,
      'phone': ?instance.phone,
    };

Charge _$ChargeFromJson(Map<String, dynamic> json) => Charge(
  object: $enumDecode(_$_ChargeObjectEnumMap, json['object']),
  id: json['id'] as String,
  balanceTransaction: json['balance_transaction'] as String,
  paymentMethodDetails: PaymentMethodDetails.fromJson(
    json['payment_method_details'] as Map<String, dynamic>,
  ),
  livemode: json['livemode'] as bool,
);

Map<String, dynamic> _$ChargeToJson(Charge instance) => <String, dynamic>{
  'object': _$_ChargeObjectEnumMap[instance.object]!,
  'id': instance.id,
  'balance_transaction': instance.balanceTransaction,
  'payment_method_details': instance.paymentMethodDetails.toJson(),
  'livemode': instance.livemode,
};

const _$_ChargeObjectEnumMap = {_ChargeObject.charge: 'charge'};

PaymentMethodDetails _$PaymentMethodDetailsFromJson(
  Map<String, dynamic> json,
) => PaymentMethodDetails(
  card: json['card'] == null
      ? null
      : PaymentMethodDetailsCard.fromJson(json['card'] as Map<String, dynamic>),
);

Map<String, dynamic> _$PaymentMethodDetailsToJson(
  PaymentMethodDetails instance,
) => <String, dynamic>{'card': ?instance.card?.toJson()};

PaymentMethodDetailsCard _$PaymentMethodDetailsCardFromJson(
  Map<String, dynamic> json,
) => PaymentMethodDetailsCard(
  brand: json['brand'] as String,
  last4: json['last4'] as String,
);

Map<String, dynamic> _$PaymentMethodDetailsCardToJson(
  PaymentMethodDetailsCard instance,
) => <String, dynamic>{'brand': instance.brand, 'last4': instance.last4};

CheckoutSession _$CheckoutSessionFromJson(
  Map<String, dynamic> json,
) => CheckoutSession(
  object: $enumDecode(_$_CheckoutSessionObjectEnumMap, json['object']),
  id: json['id'] as String,
  paymentMethodTypes: (json['payment_method_types'] as List<dynamic>)
      .map((e) => $enumDecode(_$PaymentMethodTypeEnumMap, e))
      .toList(),
  mode: $enumDecode(_$CheckoutSessionModeEnumMap, json['mode']),
  paymentStatus: $enumDecode(
    _$CheckoutSessionPaymentStatusEnumMap,
    json['payment_status'],
  ),
  status: $enumDecode(_$CheckoutSessionStatusEnumMap, json['status']),
  created: (json['created'] as num).toInt(),
  expiresAt: (json['expires_at'] as num).toInt(),
  livemode: json['livemode'] as bool,
  clientReferenceId: json['client_reference_id'] as String?,
  customer: json['customer'] as String?,
  customerEmail: json['customer_email'] as String?,
  lineItems: json['line_items'] == null
      ? null
      : DataList<CheckoutSessionLineItem>.fromJson(
          json['line_items'] as Map<String, dynamic>,
          (value) =>
              CheckoutSessionLineItem.fromJson(value as Map<String, dynamic>),
        ),
  metadata: json['metadata'] as Map<String, dynamic>?,
  returnUrl: json['return_url'] as String?,
  successfulUrl: json['successful_url'] as String?,
  url: json['url'] as String?,
  uiMode: $enumDecodeNullable(_$CheckoutSessionUIModeEnumMap, json['ui_mode']),
  amountSubtotal: (json['amount_subtotal'] as num?)?.toInt(),
  amountTotal: (json['amount_total'] as num?)?.toInt(),
  cancelUrl: json['cancel_url'] as String?,
  clientSecret: json['client_secret'] as String?,
  invoice: json['invoice'] as String?,
  paymentLink: json['payment_link'] as String?,
  setupIntent: json['setup_intent'] as String?,
  subscription: json['subscription'] as String?,
  paymentIntent: json['payment_intent'] as String?,
);

Map<String, dynamic> _$CheckoutSessionToJson(CheckoutSession instance) =>
    <String, dynamic>{
      'object': _$_CheckoutSessionObjectEnumMap[instance.object]!,
      'id': instance.id,
      'client_reference_id': ?instance.clientReferenceId,
      'customer': ?instance.customer,
      'customer_email': ?instance.customerEmail,
      'line_items': ?instance.lineItems?.toJson((value) => value.toJson()),
      'metadata': ?instance.metadata,
      'mode': _$CheckoutSessionModeEnumMap[instance.mode]!,
      'payment_intent': ?instance.paymentIntent,
      'payment_status':
          _$CheckoutSessionPaymentStatusEnumMap[instance.paymentStatus]!,
      'return_url': ?instance.returnUrl,
      'status': _$CheckoutSessionStatusEnumMap[instance.status]!,
      'successful_url': ?instance.successfulUrl,
      'ui_mode': ?_$CheckoutSessionUIModeEnumMap[instance.uiMode],
      'url': ?instance.url,
      'amount_subtotal': ?instance.amountSubtotal,
      'amount_total': ?instance.amountTotal,
      'cancel_url': ?instance.cancelUrl,
      'client_secret': ?instance.clientSecret,
      'created': instance.created,
      'expires_at': instance.expiresAt,
      'invoice': ?instance.invoice,
      'livemode': instance.livemode,
      'payment_link': ?instance.paymentLink,
      'setup_intent': ?instance.setupIntent,
      'subscription': ?instance.subscription,
      'payment_method_types': instance.paymentMethodTypes
          .map((e) => _$PaymentMethodTypeEnumMap[e]!)
          .toList(),
    };

const _$_CheckoutSessionObjectEnumMap = {
  _CheckoutSessionObject.checkoutSession: 'checkout.session',
};

const _$PaymentMethodTypeEnumMap = {
  PaymentMethodType.acss_debit: 'acss_debit',
  PaymentMethodType.affirm: 'affirm',
  PaymentMethodType.afterpay_clearpay: 'afterpay_clearpay',
  PaymentMethodType.alipay: 'alipay',
  PaymentMethodType.amazon_pay: 'amazon_pay',
  PaymentMethodType.au_becs_debit: 'au_becs_debit',
  PaymentMethodType.bacs_debit: 'bacs_debit',
  PaymentMethodType.bancontact: 'bancontact',
  PaymentMethodType.blik: 'blik',
  PaymentMethodType.boleto: 'boleto',
  PaymentMethodType.card: 'card',
  PaymentMethodType.cashapp: 'cashapp',
  PaymentMethodType.customer_balance: 'customer_balance',
  PaymentMethodType.eps: 'eps',
  PaymentMethodType.fpx: 'fpx',
  PaymentMethodType.giropay: 'giropay',
  PaymentMethodType.grabpay: 'grabpay',
  PaymentMethodType.ideal: 'ideal',
  PaymentMethodType.klarna: 'klarna',
  PaymentMethodType.konbini: 'konbini',
  PaymentMethodType.link: 'link',
  PaymentMethodType.oxxo: 'oxxo',
  PaymentMethodType.p24: 'p24',
  PaymentMethodType.paynow: 'paynow',
  PaymentMethodType.pix: 'pix',
  PaymentMethodType.promptpay: 'promptpay',
  PaymentMethodType.sepa_debit: 'sepa_debit',
  PaymentMethodType.sofort: 'sofort',
  PaymentMethodType.us_bank_account: 'us_bank_account',
  PaymentMethodType.wechat_pay: 'wechat_pay',
};

const _$CheckoutSessionModeEnumMap = {
  CheckoutSessionMode.payment: 'payment',
  CheckoutSessionMode.setup: 'setup',
  CheckoutSessionMode.subscription: 'subscription',
};

const _$CheckoutSessionPaymentStatusEnumMap = {
  CheckoutSessionPaymentStatus.noPaymentRequired: 'no_payment_required',
  CheckoutSessionPaymentStatus.paid: 'paid',
  CheckoutSessionPaymentStatus.unpaid: 'unpaid',
};

const _$CheckoutSessionStatusEnumMap = {
  CheckoutSessionStatus.complete: 'complete',
  CheckoutSessionStatus.expired: 'expired',
  CheckoutSessionStatus.open: 'open',
};

const _$CheckoutSessionUIModeEnumMap = {
  CheckoutSessionUIMode.custom: 'custom',
  CheckoutSessionUIMode.embedded: 'embedded',
  CheckoutSessionUIMode.hosted: 'hosted',
};

CheckoutSessionLineItem _$CheckoutSessionLineItemFromJson(
  Map<String, dynamic> json,
) => CheckoutSessionLineItem(
  object: $enumDecode(_$_CheckoutSessionLineItemObjectEnumMap, json['object']),
  id: json['id'] as String,
  amountDiscount: (json['amount_discount'] as num).toInt(),
  amountSubtotal: (json['amount_subtotal'] as num).toInt(),
  amountTax: (json['amount_tax'] as num).toInt(),
  amountTotal: (json['amount_total'] as num).toInt(),
  currency: json['currency'] as String,
  description: json['description'] as String?,
  price: json['price'] == null
      ? null
      : Price.fromJson(json['price'] as Map<String, dynamic>),
  quantity: (json['quantity'] as num?)?.toInt(),
);

Map<String, dynamic> _$CheckoutSessionLineItemToJson(
  CheckoutSessionLineItem instance,
) => <String, dynamic>{
  'object': _$_CheckoutSessionLineItemObjectEnumMap[instance.object]!,
  'id': instance.id,
  'amount_discount': instance.amountDiscount,
  'amount_subtotal': instance.amountSubtotal,
  'amount_tax': instance.amountTax,
  'amount_total': instance.amountTotal,
  'currency': instance.currency,
  'description': ?instance.description,
  'price': ?instance.price?.toJson(),
  'quantity': ?instance.quantity,
};

const _$_CheckoutSessionLineItemObjectEnumMap = {
  _CheckoutSessionLineItemObject.item: 'item',
};

CouponAppliesTo _$CouponAppliesToFromJson(Map<String, dynamic> json) =>
    CouponAppliesTo(
      products: (json['products'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$CouponAppliesToToJson(CouponAppliesTo instance) =>
    <String, dynamic>{'products': ?instance.products};

Coupon _$CouponFromJson(Map<String, dynamic> json) => Coupon(
  object: $enumDecode(_$_CouponObjectEnumMap, json['object']),
  id: json['id'] as String,
  duration: $enumDecode(_$CouponDurationEnumMap, json['duration']),
  created: (json['created'] as num).toInt(),
  livemode: json['livemode'] as bool,
  timesRedeemed: (json['times_redeemed'] as num).toInt(),
  valid: json['valid'] as bool,
  amountOff: (json['amount_off'] as num?)?.toInt(),
  currency: json['currency'] as String?,
  durationInMonths: (json['duration_in_months'] as num?)?.toInt(),
  metadata: json['metadata'] as Map<String, dynamic>?,
  name: json['name'] as String?,
  percentOff: (json['percent_off'] as num?)?.toDouble(),
  appliesTo: json['applies_to'] == null
      ? null
      : CouponAppliesTo.fromJson(json['applies_to'] as Map<String, dynamic>),
  currencyOptions: json['currency_options'] as Map<String, dynamic>?,
  maxRedemptions: (json['max_redemptions'] as num?)?.toInt(),
  redeemBy: (json['redeem_by'] as num?)?.toInt(),
);

Map<String, dynamic> _$CouponToJson(Coupon instance) => <String, dynamic>{
  'object': _$_CouponObjectEnumMap[instance.object]!,
  'id': instance.id,
  'duration': _$CouponDurationEnumMap[instance.duration]!,
  'created': instance.created,
  'livemode': instance.livemode,
  'times_redeemed': instance.timesRedeemed,
  'valid': instance.valid,
  'amount_off': ?instance.amountOff,
  'currency': ?instance.currency,
  'duration_in_months': ?instance.durationInMonths,
  'metadata': ?instance.metadata,
  'name': ?instance.name,
  'percent_off': ?instance.percentOff,
  'applies_to': ?instance.appliesTo?.toJson(),
  'currency_options': ?instance.currencyOptions,
  'max_redemptions': ?instance.maxRedemptions,
  'redeem_by': ?instance.redeemBy,
};

const _$_CouponObjectEnumMap = {_CouponObject.coupon: 'coupon'};

const _$CouponDurationEnumMap = {
  CouponDuration.forever: 'forever',
  CouponDuration.once: 'once',
  CouponDuration.repeating: 'repeating',
};

Customer _$CustomerFromJson(Map<String, dynamic> json) => Customer(
  object: $enumDecode(_$_CustomerObjectEnumMap, json['object']),
  id: json['id'] as String,
  invoiceSettings: json['invoice_settings'] == null
      ? null
      : InvoiceSettings.fromJson(
          json['invoice_settings'] as Map<String, dynamic>,
        ),
  balance: (json['balance'] as num).toInt(),
  address: json['address'] == null
      ? null
      : Address.fromJson(json['address'] as Map<String, dynamic>),
  description: json['description'] as String?,
  email: json['email'] as String?,
  metadata: json['metadata'] as Map<String, dynamic>?,
  name: json['name'] as String?,
  defaultSource: json['default_source'] as String?,
  shipping: json['shipping'] == null
      ? null
      : Shipping.fromJson(json['shipping'] as Map<String, dynamic>),
);

Map<String, dynamic> _$CustomerToJson(Customer instance) => <String, dynamic>{
  'object': _$_CustomerObjectEnumMap[instance.object]!,
  'id': instance.id,
  'address': ?instance.address?.toJson(),
  'invoice_settings': ?instance.invoiceSettings?.toJson(),
  'description': ?instance.description,
  'email': ?instance.email,
  'metadata': ?instance.metadata,
  'name': ?instance.name,
  'default_source': ?instance.defaultSource,
  'balance': instance.balance,
  'shipping': ?instance.shipping?.toJson(),
};

const _$_CustomerObjectEnumMap = {_CustomerObject.customer: 'customer'};

InvoiceSettings _$InvoiceSettingsFromJson(Map<String, dynamic> json) =>
    InvoiceSettings(
      defaultPaymentMethod: json['default_payment_method'] as String?,
    );

Map<String, dynamic> _$InvoiceSettingsToJson(InvoiceSettings instance) =>
    <String, dynamic>{'default_payment_method': ?instance.defaultPaymentMethod};

Shipping _$ShippingFromJson(Map<String, dynamic> json) => Shipping(
  address: Address.fromJson(json['address'] as Map<String, dynamic>),
  name: json['name'] as String,
  phone: json['phone'] as String?,
);

Map<String, dynamic> _$ShippingToJson(Shipping instance) => <String, dynamic>{
  'address': instance.address.toJson(),
  'name': instance.name,
  'phone': ?instance.phone,
};

CustomerBalanceTransaction _$CustomerBalanceTransactionFromJson(
  Map<String, dynamic> json,
) => CustomerBalanceTransaction(
  object: $enumDecode(
    _$_CustomerBalanceTransactionObjectEnumMap,
    json['object'],
  ),
  id: json['id'] as String,
  amount: (json['amount'] as num).toInt(),
  currency: json['currency'] as String,
  customer: json['customer'] as String,
  endingBalance: (json['ending_balance'] as num).toInt(),
  type: $enumDecode(_$CustomerBalanceTransactionTypeEnumMap, json['type']),
  created: (json['created'] as num).toInt(),
  livemode: json['livemode'] as bool,
  description: json['description'] as String?,
  metadata: json['metadata'] as Map<String, dynamic>?,
  checkoutSession: json['checkout_session'] as String?,
  creditNote: json['credit_note'] as String?,
  invoice: json['invoice'] as String?,
);

Map<String, dynamic> _$CustomerBalanceTransactionToJson(
  CustomerBalanceTransaction instance,
) => <String, dynamic>{
  'object': _$_CustomerBalanceTransactionObjectEnumMap[instance.object]!,
  'id': instance.id,
  'amount': instance.amount,
  'currency': instance.currency,
  'customer': instance.customer,
  'ending_balance': instance.endingBalance,
  'type': _$CustomerBalanceTransactionTypeEnumMap[instance.type]!,
  'created': instance.created,
  'livemode': instance.livemode,
  'description': ?instance.description,
  'metadata': ?instance.metadata,
  'checkout_session': ?instance.checkoutSession,
  'credit_note': ?instance.creditNote,
  'invoice': ?instance.invoice,
};

const _$_CustomerBalanceTransactionObjectEnumMap = {
  _CustomerBalanceTransactionObject.customerBalanceTransaction:
      'customer_balance_transaction',
};

const _$CustomerBalanceTransactionTypeEnumMap = {
  CustomerBalanceTransactionType.adjustment: 'adjustment',
  CustomerBalanceTransactionType.appliedToInvoice: 'applied_to_invoice',
  CustomerBalanceTransactionType.checkoutSessionSubscriptionPayment:
      'checkout_session_subscription_payment',
  CustomerBalanceTransactionType.checkoutSessionSubscriptionPaymentCanceled:
      'checkout_session_subscription_payment_canceled',
  CustomerBalanceTransactionType.creditNote: 'credit_note',
  CustomerBalanceTransactionType.initial: 'initial',
  CustomerBalanceTransactionType.invoiceOverpaid: 'invoice_overpaid',
  CustomerBalanceTransactionType.invoiceTooLarge: 'invoice_too_large',
  CustomerBalanceTransactionType.invoiceToSmall: 'invoice_too_small',
  CustomerBalanceTransactionType.migration: 'migration',
  CustomerBalanceTransactionType.unappliedFromInvoice: 'unapplied_from_invoice',
  CustomerBalanceTransactionType.unspentReceiverCredit:
      'unspent_receiver_credit',
};

DataList<T> _$DataListFromJson<T>(
  Map<String, dynamic> json,
  T Function(Object? json) fromJsonT,
) => DataList<T>(
  object: $enumDecode(_$_SubListObjectEnumMap, json['object']),
  data: (json['data'] as List<dynamic>).map(fromJsonT).toList(),
  hasMore: json['has_more'] as bool,
  url: json['url'] as String,
);

Map<String, dynamic> _$DataListToJson<T>(
  DataList<T> instance,
  Object? Function(T value) toJsonT,
) => <String, dynamic>{
  'object': _$_SubListObjectEnumMap[instance.object]!,
  'data': instance.data.map(toJsonT).toList(),
  'has_more': instance.hasMore,
  'url': instance.url,
};

const _$_SubListObjectEnumMap = {
  _SubListObject.list: 'list',
  _SubListObject.searchResult: 'search_result',
};

Discount _$DiscountFromJson(Map<String, dynamic> json) => Discount(
  object: $enumDecode(_$_DiscountObjectEnumMap, json['object']),
  id: json['id'] as String,
  coupon: Coupon.fromJson(json['coupon'] as Map<String, dynamic>),
  start: (json['start'] as num).toInt(),
  customer: json['customer'] as String?,
  end: (json['end'] as num?)?.toInt(),
  subscription: json['subscription'] as String?,
  checkoutSession: json['checkout_session'] as String?,
  invoice: json['invoice'] as String?,
  invoiceItem: json['invoice_item'] as String?,
  promotionCode: json['promotion_code'] as String?,
  subscriptionItem: json['subscription_item'] as String?,
);

Map<String, dynamic> _$DiscountToJson(Discount instance) => <String, dynamic>{
  'object': _$_DiscountObjectEnumMap[instance.object]!,
  'id': instance.id,
  'coupon': instance.coupon.toJson(),
  'start': instance.start,
  'customer': ?instance.customer,
  'end': ?instance.end,
  'subscription': ?instance.subscription,
  'checkout_session': ?instance.checkoutSession,
  'invoice': ?instance.invoice,
  'invoice_item': ?instance.invoiceItem,
  'promotion_code': ?instance.promotionCode,
  'subscription_item': ?instance.subscriptionItem,
};

const _$_DiscountObjectEnumMap = {_DiscountObject.discount: 'discount'};

EventData<T> _$EventDataFromJson<T>(
  Map<String, dynamic> json,
  T Function(Object? json) fromJsonT,
) => EventData<T>(
  object: fromJsonT(json['object']),
  previousAttributes: json['previous_attributes'] as Map<String, dynamic>?,
);

Map<String, dynamic> _$EventDataToJson<T>(
  EventData<T> instance,
  Object? Function(T value) toJsonT,
) => <String, dynamic>{
  'object': ?toJsonT(instance.object),
  'previous_attributes': ?instance.previousAttributes,
};

SubscriptionEvent _$SubscriptionEventFromJson(Map<String, dynamic> json) =>
    SubscriptionEvent(
      object: $enumDecode(_$EventObjectEnumMap, json['object']),
      id: json['id'] as String,
      created: (json['created'] as num).toInt(),
      type: json['type'] as String,
      data: EventData<Subscription>.fromJson(
        json['data'] as Map<String, dynamic>,
        (value) => Subscription.fromJson(value as Map<String, dynamic>),
      ),
      livemode: json['livemode'] as bool,
    );

Map<String, dynamic> _$SubscriptionEventToJson(SubscriptionEvent instance) =>
    <String, dynamic>{
      'object': _$EventObjectEnumMap[instance.object]!,
      'id': instance.id,
      'created': instance.created,
      'data': instance.data.toJson((value) => value.toJson()),
      'type': instance.type,
      'livemode': instance.livemode,
    };

const _$EventObjectEnumMap = {EventObject.event: 'event'};

CustomerEvent _$CustomerEventFromJson(Map<String, dynamic> json) =>
    CustomerEvent(
      object: $enumDecode(_$EventObjectEnumMap, json['object']),
      id: json['id'] as String,
      created: (json['created'] as num).toInt(),
      type: json['type'] as String,
      data: EventData<Customer>.fromJson(
        json['data'] as Map<String, dynamic>,
        (value) => Customer.fromJson(value as Map<String, dynamic>),
      ),
      livemode: json['livemode'] as bool,
    );

Map<String, dynamic> _$CustomerEventToJson(CustomerEvent instance) =>
    <String, dynamic>{
      'object': _$EventObjectEnumMap[instance.object]!,
      'id': instance.id,
      'created': instance.created,
      'data': instance.data.toJson((value) => value.toJson()),
      'type': instance.type,
      'livemode': instance.livemode,
    };

ChargeEvent _$ChargeEventFromJson(Map<String, dynamic> json) => ChargeEvent(
  object: $enumDecode(_$EventObjectEnumMap, json['object']),
  id: json['id'] as String,
  created: (json['created'] as num).toInt(),
  type: json['type'] as String,
  data: EventData<Charge>.fromJson(
    json['data'] as Map<String, dynamic>,
    (value) => Charge.fromJson(value as Map<String, dynamic>),
  ),
  livemode: json['livemode'] as bool,
);

Map<String, dynamic> _$ChargeEventToJson(ChargeEvent instance) =>
    <String, dynamic>{
      'object': _$EventObjectEnumMap[instance.object]!,
      'id': instance.id,
      'created': instance.created,
      'data': instance.data.toJson((value) => value.toJson()),
      'type': instance.type,
      'livemode': instance.livemode,
    };

PaymentIntentEvent _$PaymentIntentEventFromJson(Map<String, dynamic> json) =>
    PaymentIntentEvent(
      object: $enumDecode(_$EventObjectEnumMap, json['object']),
      id: json['id'] as String,
      created: (json['created'] as num).toInt(),
      type: json['type'] as String,
      data: EventData<PaymentIntent>.fromJson(
        json['data'] as Map<String, dynamic>,
        (value) => PaymentIntent.fromJson(value as Map<String, dynamic>),
      ),
      livemode: json['livemode'] as bool,
    );

Map<String, dynamic> _$PaymentIntentEventToJson(PaymentIntentEvent instance) =>
    <String, dynamic>{
      'object': _$EventObjectEnumMap[instance.object]!,
      'id': instance.id,
      'created': instance.created,
      'data': instance.data.toJson((value) => value.toJson()),
      'type': instance.type,
      'livemode': instance.livemode,
    };

ProductEvent _$ProductEventFromJson(Map<String, dynamic> json) => ProductEvent(
  object: $enumDecode(_$EventObjectEnumMap, json['object']),
  id: json['id'] as String,
  created: (json['created'] as num).toInt(),
  type: json['type'] as String,
  data: EventData<Product>.fromJson(
    json['data'] as Map<String, dynamic>,
    (value) => Product.fromJson(value as Map<String, dynamic>),
  ),
  livemode: json['livemode'] as bool,
);

Map<String, dynamic> _$ProductEventToJson(ProductEvent instance) =>
    <String, dynamic>{
      'object': _$EventObjectEnumMap[instance.object]!,
      'id': instance.id,
      'created': instance.created,
      'data': instance.data.toJson((value) => value.toJson()),
      'type': instance.type,
      'livemode': instance.livemode,
    };

PriceEvent _$PriceEventFromJson(Map<String, dynamic> json) => PriceEvent(
  object: $enumDecode(_$EventObjectEnumMap, json['object']),
  id: json['id'] as String,
  created: (json['created'] as num).toInt(),
  type: json['type'] as String,
  data: EventData<Price>.fromJson(
    json['data'] as Map<String, dynamic>,
    (value) => Price.fromJson(value as Map<String, dynamic>),
  ),
  livemode: json['livemode'] as bool,
);

Map<String, dynamic> _$PriceEventToJson(PriceEvent instance) =>
    <String, dynamic>{
      'object': _$EventObjectEnumMap[instance.object]!,
      'id': instance.id,
      'created': instance.created,
      'data': instance.data.toJson((value) => value.toJson()),
      'type': instance.type,
      'livemode': instance.livemode,
    };

RefundEvent _$RefundEventFromJson(Map<String, dynamic> json) => RefundEvent(
  object: $enumDecode(_$EventObjectEnumMap, json['object']),
  id: json['id'] as String,
  created: (json['created'] as num).toInt(),
  type: json['type'] as String,
  data: EventData<Refund>.fromJson(
    json['data'] as Map<String, dynamic>,
    (value) => Refund.fromJson(value as Map<String, dynamic>),
  ),
  livemode: json['livemode'] as bool,
);

Map<String, dynamic> _$RefundEventToJson(RefundEvent instance) =>
    <String, dynamic>{
      'object': _$EventObjectEnumMap[instance.object]!,
      'id': instance.id,
      'created': instance.created,
      'data': instance.data.toJson((value) => value.toJson()),
      'type': instance.type,
      'livemode': instance.livemode,
    };

CheckoutSessionEvent _$CheckoutSessionEventFromJson(
  Map<String, dynamic> json,
) => CheckoutSessionEvent(
  object: $enumDecode(_$EventObjectEnumMap, json['object']),
  id: json['id'] as String,
  created: (json['created'] as num).toInt(),
  type: json['type'] as String,
  data: EventData<CheckoutSession>.fromJson(
    json['data'] as Map<String, dynamic>,
    (value) => CheckoutSession.fromJson(value as Map<String, dynamic>),
  ),
  livemode: json['livemode'] as bool,
);

Map<String, dynamic> _$CheckoutSessionEventToJson(
  CheckoutSessionEvent instance,
) => <String, dynamic>{
  'object': _$EventObjectEnumMap[instance.object]!,
  'id': instance.id,
  'created': instance.created,
  'data': instance.data.toJson((value) => value.toJson()),
  'type': instance.type,
  'livemode': instance.livemode,
};

PaymentMethodEvent _$PaymentMethodEventFromJson(Map<String, dynamic> json) =>
    PaymentMethodEvent(
      object: $enumDecode(_$EventObjectEnumMap, json['object']),
      id: json['id'] as String,
      created: (json['created'] as num).toInt(),
      type: json['type'] as String,
      data: EventData<PaymentMethod>.fromJson(
        json['data'] as Map<String, dynamic>,
        (value) => PaymentMethod.fromJson(value as Map<String, dynamic>),
      ),
      livemode: json['livemode'] as bool,
    );

Map<String, dynamic> _$PaymentMethodEventToJson(PaymentMethodEvent instance) =>
    <String, dynamic>{
      'object': _$EventObjectEnumMap[instance.object]!,
      'id': instance.id,
      'created': instance.created,
      'data': instance.data.toJson((value) => value.toJson()),
      'type': instance.type,
      'livemode': instance.livemode,
    };

InvoiceEvent _$InvoiceEventFromJson(Map<String, dynamic> json) => InvoiceEvent(
  object: $enumDecode(_$EventObjectEnumMap, json['object']),
  id: json['id'] as String,
  created: (json['created'] as num).toInt(),
  type: json['type'] as String,
  data: EventData<Invoice>.fromJson(
    json['data'] as Map<String, dynamic>,
    (value) => Invoice.fromJson(value as Map<String, dynamic>),
  ),
  livemode: json['livemode'] as bool,
);

Map<String, dynamic> _$InvoiceEventToJson(InvoiceEvent instance) =>
    <String, dynamic>{
      'object': _$EventObjectEnumMap[instance.object]!,
      'id': instance.id,
      'created': instance.created,
      'data': instance.data.toJson((value) => value.toJson()),
      'type': instance.type,
      'livemode': instance.livemode,
    };

CouponEvent _$CouponEventFromJson(Map<String, dynamic> json) => CouponEvent(
  object: $enumDecode(_$EventObjectEnumMap, json['object']),
  id: json['id'] as String,
  created: (json['created'] as num).toInt(),
  type: json['type'] as String,
  data: EventData<Coupon>.fromJson(
    json['data'] as Map<String, dynamic>,
    (value) => Coupon.fromJson(value as Map<String, dynamic>),
  ),
  livemode: json['livemode'] as bool,
);

Map<String, dynamic> _$CouponEventToJson(CouponEvent instance) =>
    <String, dynamic>{
      'object': _$EventObjectEnumMap[instance.object]!,
      'id': instance.id,
      'created': instance.created,
      'data': instance.data.toJson((value) => value.toJson()),
      'type': instance.type,
      'livemode': instance.livemode,
    };

Invoice _$InvoiceFromJson(Map<String, dynamic> json) => Invoice(
  id: json['id'] as String,
  amountDue: (json['amount_due'] as num).toInt(),
  amountOverpaid: (json['amount_overpaid'] as num).toInt(),
  amountPaid: (json['amount_paid'] as num).toInt(),
  amountRemaining: (json['amount_remaining'] as num).toInt(),
  amountShipping: (json['amount_shipping'] as num).toInt(),
  created: (json['created'] as num).toInt(),
  currency: json['currency'] as String,
  customer: json['customer'] as String,
  startingBalance: (json['starting_balance'] as num).toInt(),
  total: (json['total'] as num).toInt(),
  subtotal: (json['subtotal'] as num).toInt(),
  totalDiscountAmounts: (json['total_discount_amounts'] as List<dynamic>)
      .map((e) => TotalDiscountAmount.fromJson(e as Map<String, dynamic>))
      .toList(),
  lines: DataList<InvoiceLineItem>.fromJson(
    json['lines'] as Map<String, dynamic>,
    (value) => InvoiceLineItem.fromJson(value as Map<String, dynamic>),
  ),
  billingReason: $enumDecodeNullable(
    _$InvoiceBillingReasonEnumMap,
    json['billing_reason'],
  ),
  description: json['description'] as String?,
  endingBalance: (json['ending_balance'] as num?)?.toInt(),
  hostedInvoiceUrl: json['hosted_invoice_url'] as String?,
  status: $enumDecodeNullable(_$InvoiceStatusEnumMap, json['status']),
  subscription: json['subscription'] as String?,
  subtotalExcludingTax: (json['subtotal_excluding_tax'] as num?)?.toInt(),
  totalExcludingTax: (json['total_excluding_tax'] as num?)?.toInt(),
  paymentIntent: json['payment_intent'] as String?,
  accountCountry: json['account_country'] as String?,
  accountName: json['account_name'] as String?,
  metadata: (json['metadata'] as Map<String, dynamic>?)?.map(
    (k, e) => MapEntry(k, e as String),
  ),
);

Map<String, dynamic> _$InvoiceToJson(Invoice instance) => <String, dynamic>{
  'id': instance.id,
  'amount_due': instance.amountDue,
  'amount_overpaid': instance.amountOverpaid,
  'amount_paid': instance.amountPaid,
  'amount_remaining': instance.amountRemaining,
  'amount_shipping': instance.amountShipping,
  'billing_reason': ?_$InvoiceBillingReasonEnumMap[instance.billingReason],
  'created': instance.created,
  'currency': instance.currency,
  'customer': instance.customer,
  'starting_balance': instance.startingBalance,
  'total': instance.total,
  'total_excluding_tax': ?instance.totalExcludingTax,
  'description': ?instance.description,
  'ending_balance': ?instance.endingBalance,
  'hosted_invoice_url': ?instance.hostedInvoiceUrl,
  'status': ?_$InvoiceStatusEnumMap[instance.status],
  'subscription': ?instance.subscription,
  'subtotal': instance.subtotal,
  'subtotal_excluding_tax': ?instance.subtotalExcludingTax,
  'total_discount_amounts': instance.totalDiscountAmounts
      .map((e) => e.toJson())
      .toList(),
  'lines': instance.lines.toJson((value) => value.toJson()),
  'metadata': ?instance.metadata,
  'payment_intent': ?instance.paymentIntent,
  'account_country': ?instance.accountCountry,
  'account_name': ?instance.accountName,
};

const _$InvoiceBillingReasonEnumMap = {
  InvoiceBillingReason.manual: 'manual',
  InvoiceBillingReason.subscription: 'subscription',
  InvoiceBillingReason.subscriptionCreate: 'subscription_create',
  InvoiceBillingReason.subscriptionCycle: 'subscription_cycle',
  InvoiceBillingReason.subscriptionThreshold: 'subscription_threshold',
  InvoiceBillingReason.subscriptionUpdate: 'subscription_update',
  InvoiceBillingReason.upcoming: 'upcoming',
};

const _$InvoiceStatusEnumMap = {
  InvoiceStatus.draft: 'draft',
  InvoiceStatus.open: 'open',
  InvoiceStatus.paid: 'paid',
  InvoiceStatus.uncollectible: 'uncollectible',
  InvoiceStatus.voidStatus: 'void',
};

TotalDiscountAmount _$TotalDiscountAmountFromJson(Map<String, dynamic> json) =>
    TotalDiscountAmount(
      amount: (json['amount'] as num).toInt(),
      discount: json['discount'] as String,
    );

Map<String, dynamic> _$TotalDiscountAmountToJson(
  TotalDiscountAmount instance,
) => <String, dynamic>{
  'amount': instance.amount,
  'discount': instance.discount,
};

InvoiceConfirmationSecret _$InvoiceConfirmationSecretFromJson(
  Map<String, dynamic> json,
) => InvoiceConfirmationSecret(clientSecret: json['client_secret'] as String?);

Map<String, dynamic> _$InvoiceConfirmationSecretToJson(
  InvoiceConfirmationSecret instance,
) => <String, dynamic>{'client_secret': ?instance.clientSecret};

InvoiceItem _$InvoiceItemFromJson(Map<String, dynamic> json) => InvoiceItem(
  object: $enumDecode(_$_InvoiceItemObjectEnumMap, json['object']),
  id: json['id'] as String,
);

Map<String, dynamic> _$InvoiceItemToJson(InvoiceItem instance) =>
    <String, dynamic>{
      'object': _$_InvoiceItemObjectEnumMap[instance.object]!,
      'id': instance.id,
    };

const _$_InvoiceItemObjectEnumMap = {
  _InvoiceItemObject.invoiceItem: 'invoiceitem',
};

InvoiceLineItem _$InvoiceLineItemFromJson(
  Map<String, dynamic> json,
) => InvoiceLineItem(
  object: $enumDecode(_$_InvoiceLineItemObjectEnumMap, json['object']),
  id: json['id'] as String,
  amount: (json['amount'] as num).toInt(),
  currency: json['currency'] as String,
  description: json['description'] as String?,
  invoice: json['invoice'] as String?,
  metadata: json['metadata'] as Map<String, dynamic>?,
  parent: json['parent'] == null
      ? null
      : InvoiceLineItemParent.fromJson(json['parent'] as Map<String, dynamic>),
  period: json['period'] == null
      ? null
      : InvoiceLineItemPeriod.fromJson(json['period'] as Map<String, dynamic>),
  price: json['price'] == null
      ? null
      : Price.fromJson(json['price'] as Map<String, dynamic>),
  quantity: (json['quantity'] as num?)?.toInt(),
);

Map<String, dynamic> _$InvoiceLineItemToJson(InvoiceLineItem instance) =>
    <String, dynamic>{
      'object': _$_InvoiceLineItemObjectEnumMap[instance.object]!,
      'id': instance.id,
      'amount': instance.amount,
      'currency': instance.currency,
      'description': ?instance.description,
      'invoice': ?instance.invoice,
      'metadata': ?instance.metadata,
      'parent': ?instance.parent?.toJson(),
      'period': ?instance.period?.toJson(),
      'price': ?instance.price?.toJson(),
      'quantity': ?instance.quantity,
    };

const _$_InvoiceLineItemObjectEnumMap = {
  _InvoiceLineItemObject.lineItem: 'line_item',
};

InvoiceLineItemPeriod _$InvoiceLineItemPeriodFromJson(
  Map<String, dynamic> json,
) => InvoiceLineItemPeriod(
  start: const TimestampConverter().fromJson((json['start'] as num).toInt()),
  end: const TimestampConverter().fromJson((json['end'] as num).toInt()),
);

Map<String, dynamic> _$InvoiceLineItemPeriodToJson(
  InvoiceLineItemPeriod instance,
) => <String, dynamic>{
  'start': const TimestampConverter().toJson(instance.start),
  'end': const TimestampConverter().toJson(instance.end),
};

InvoiceLineItemParent _$InvoiceLineItemParentFromJson(
  Map<String, dynamic> json,
) => InvoiceLineItemParent(
  type: $enumDecode(_$InvoiceLineItemParentTypeEnumMap, json['type']),
  invoiceItemDetails: json['invoice_item_details'] == null
      ? null
      : InvoiceLineItemInvoiceItemDetails.fromJson(
          json['invoice_item_details'] as Map<String, dynamic>,
        ),
);

Map<String, dynamic> _$InvoiceLineItemParentToJson(
  InvoiceLineItemParent instance,
) => <String, dynamic>{
  'invoice_item_details': ?instance.invoiceItemDetails?.toJson(),
  'type': _$InvoiceLineItemParentTypeEnumMap[instance.type]!,
};

const _$InvoiceLineItemParentTypeEnumMap = {
  InvoiceLineItemParentType.invoiceItemDetails: 'invoice_item_details',
  InvoiceLineItemParentType.subscriptionItemDetails:
      'subscription_item_details',
};

InvoiceLineItemInvoiceItemDetails _$InvoiceLineItemInvoiceItemDetailsFromJson(
  Map<String, dynamic> json,
) => InvoiceLineItemInvoiceItemDetails(
  invoiceItem: json['invoice_item'] as String?,
);

Map<String, dynamic> _$InvoiceLineItemInvoiceItemDetailsToJson(
  InvoiceLineItemInvoiceItemDetails instance,
) => <String, dynamic>{'invoice_item': ?instance.invoiceItem};

PauseCollection _$PauseCollectionFromJson(Map<String, dynamic> json) =>
    PauseCollection(
      behavior: $enumDecode(_$PauseCollectionBehaviorEnumMap, json['behavior']),
      resumesAt: _$JsonConverterFromJson<int, DateTime>(
        json['resumes_at'],
        const TimestampConverter().fromJson,
      ),
    );

Map<String, dynamic> _$PauseCollectionToJson(PauseCollection instance) =>
    <String, dynamic>{
      'behavior': _$PauseCollectionBehaviorEnumMap[instance.behavior]!,
      'resumes_at': ?_$JsonConverterToJson<int, DateTime>(
        instance.resumesAt,
        const TimestampConverter().toJson,
      ),
    };

const _$PauseCollectionBehaviorEnumMap = {
  PauseCollectionBehavior.keepAsDraft: 'keep_as_draft',
  PauseCollectionBehavior.markUncollectible: 'mark_uncollectible',
  PauseCollectionBehavior.void_: 'void',
};

Value? _$JsonConverterFromJson<Json, Value>(
  Object? json,
  Value? Function(Json json) fromJson,
) => json == null ? null : fromJson(json as Json);

Json? _$JsonConverterToJson<Json, Value>(
  Value? value,
  Json? Function(Value value) toJson,
) => value == null ? null : toJson(value);

PaymentIntent _$PaymentIntentFromJson(Map<String, dynamic> json) =>
    PaymentIntent(
      object: $enumDecode(_$_PaymentIntentObjectEnumMap, json['object']),
      id: json['id'] as String,
      amount: (json['amount'] as num).toInt(),
      amountReceived: (json['amount_received'] as num).toInt(),
      clientSecret: json['client_secret'] as String,
      currency: json['currency'] as String,
      status: json['status'] as String,
      automaticPaymentMethods: json['automatic_payment_methods'] == null
          ? const AutomaticPaymentMethods()
          : AutomaticPaymentMethods.fromJson(
              json['automatic_payment_methods'] as Map<String, dynamic>,
            ),
      canceledAt: _$JsonConverterFromJson<int, DateTime>(
        json['canceled_at'],
        const TimestampConverter().fromJson,
      ),
      created: _$JsonConverterFromJson<int, DateTime>(
        json['created'],
        const TimestampConverter().fromJson,
      ),
      customer: json['customer'] as String?,
      description: json['description'] as String?,
      latestCharge: json['latest_charge'] as String?,
      metadata: (json['metadata'] as Map<String, dynamic>?)?.map(
        (k, e) => MapEntry(k, e as String),
      ),
      paymentMethod: json['payment_method'] as String?,
      paymentMethodTypes: (json['payment_method_types'] as List<dynamic>?)
          ?.map((e) => $enumDecode(_$PaymentMethodTypeEnumMap, e))
          .toSet(),
      receiptEmail: json['receipt_email'] as String?,
      setupFutureUsage: $enumDecodeNullable(
        _$SetupFutureUsageEnumMap,
        json['setup_future_usage'],
      ),
      shipping: json['shipping'] == null
          ? null
          : ShippingSpecification.fromJson(
              json['shipping'] as Map<String, dynamic>,
            ),
      statementDescriptor: json['statement_descriptor'] as String?,
      statementDescriptorSuffix: json['statement_descriptor_suffix'] as String?,
    );

Map<String, dynamic> _$PaymentIntentToJson(
  PaymentIntent instance,
) => <String, dynamic>{
  'object': _$_PaymentIntentObjectEnumMap[instance.object]!,
  'id': instance.id,
  'amount': instance.amount,
  'amount_received': instance.amountReceived,
  'automatic_payment_methods': instance.automaticPaymentMethods.toJson(),
  'client_secret': instance.clientSecret,
  'currency': instance.currency,
  'status': instance.status,
  'canceled_at': ?_$JsonConverterToJson<int, DateTime>(
    instance.canceledAt,
    const TimestampConverter().toJson,
  ),
  'created': ?_$JsonConverterToJson<int, DateTime>(
    instance.created,
    const TimestampConverter().toJson,
  ),
  'customer': ?instance.customer,
  'description': ?instance.description,
  'latest_charge': ?instance.latestCharge,
  'metadata': ?instance.metadata,
  'payment_method': ?instance.paymentMethod,
  'payment_method_types': ?instance.paymentMethodTypes
      ?.map((e) => _$PaymentMethodTypeEnumMap[e]!)
      .toList(),
  'receipt_email': ?instance.receiptEmail,
  'setup_future_usage': ?_$SetupFutureUsageEnumMap[instance.setupFutureUsage],
  'shipping': ?instance.shipping?.toJson(),
  'statement_descriptor': ?instance.statementDescriptor,
  'statement_descriptor_suffix': ?instance.statementDescriptorSuffix,
};

const _$_PaymentIntentObjectEnumMap = {
  _PaymentIntentObject.payment_intent: 'payment_intent',
};

const _$SetupFutureUsageEnumMap = {
  SetupFutureUsage.on_session: 'on_session',
  SetupFutureUsage.off_session: 'off_session',
};

AutomaticPaymentMethods _$AutomaticPaymentMethodsFromJson(
  Map<String, dynamic> json,
) => AutomaticPaymentMethods(enabled: json['enabled'] as bool? ?? false);

Map<String, dynamic> _$AutomaticPaymentMethodsToJson(
  AutomaticPaymentMethods instance,
) => <String, dynamic>{'enabled': instance.enabled};

PaymentMethod _$PaymentMethodFromJson(Map<String, dynamic> json) =>
    PaymentMethod(
      id: json['id'] as String,
      livemode: json['livemode'] as bool,
      type: json['type'] as String,
      billingDetails: BillingDetails.fromJson(
        json['billing_details'] as Map<String, dynamic>,
      ),
      customer: json['customer'] as String?,
      card: json['card'] == null
          ? null
          : PaymentMethodCard.fromJson(json['card'] as Map<String, dynamic>),
      usBankAccount: json['us_bank_account'] == null
          ? null
          : PaymentMethodUsBankAccount.fromJson(
              json['us_bank_account'] as Map<String, dynamic>,
            ),
    );

Map<String, dynamic> _$PaymentMethodToJson(PaymentMethod instance) =>
    <String, dynamic>{
      'id': instance.id,
      'livemode': instance.livemode,
      'type': instance.type,
      'billing_details': instance.billingDetails.toJson(),
      'customer': ?instance.customer,
      'card': ?instance.card?.toJson(),
      'us_bank_account': ?instance.usBankAccount?.toJson(),
    };

PaymentMethodCard _$PaymentMethodCardFromJson(Map<String, dynamic> json) =>
    PaymentMethodCard(
      brand: json['brand'] as String,
      last4: json['last4'] as String,
      expMonth: (json['exp_month'] as num).toInt(),
      expYear: (json['exp_year'] as num).toInt(),
      wallet: json['wallet'] == null
          ? null
          : Wallet.fromJson(json['wallet'] as Map<String, dynamic>),
      displayBrand: json['display_brand'] as String?,
      fingerprint: json['fingerprint'] as String?,
    );

Map<String, dynamic> _$PaymentMethodCardToJson(PaymentMethodCard instance) =>
    <String, dynamic>{
      'brand': instance.brand,
      'last4': instance.last4,
      'exp_month': instance.expMonth,
      'exp_year': instance.expYear,
      'wallet': ?instance.wallet?.toJson(),
      'display_brand': ?instance.displayBrand,
      'fingerprint': ?instance.fingerprint,
    };

Wallet _$WalletFromJson(Map<String, dynamic> json) => Wallet(
  type: json['type'] as String,
  dynamicLast4: json['dynamic_last4'] as String?,
);

Map<String, dynamic> _$WalletToJson(Wallet instance) => <String, dynamic>{
  'type': instance.type,
  'dynamic_last4': ?instance.dynamicLast4,
};

PaymentMethodUsBankAccount _$PaymentMethodUsBankAccountFromJson(
  Map<String, dynamic> json,
) => PaymentMethodUsBankAccount(
  bankName: json['bank_name'] as String?,
  fingerprint: json['fingerprint'] as String?,
  last4: json['last4'] as String?,
  routingNumber: json['routing_number'] as String?,
);

Map<String, dynamic> _$PaymentMethodUsBankAccountToJson(
  PaymentMethodUsBankAccount instance,
) => <String, dynamic>{
  'bank_name': ?instance.bankName,
  'fingerprint': ?instance.fingerprint,
  'last4': ?instance.last4,
  'routing_number': ?instance.routingNumber,
};

PortalSession _$PortalSessionFromJson(Map<String, dynamic> json) =>
    PortalSession(
      object: json['object'] as String,
      id: json['id'] as String,
      customer: json['customer'] as String,
      livemode: json['livemode'] as bool,
      url: json['url'] as String,
    );

Map<String, dynamic> _$PortalSessionToJson(PortalSession instance) =>
    <String, dynamic>{
      'object': instance.object,
      'id': instance.id,
      'customer': instance.customer,
      'livemode': instance.livemode,
      'url': instance.url,
    };

Price _$PriceFromJson(Map<String, dynamic> json) => Price(
  object: $enumDecode(_$_PriceObjectEnumMap, json['object']),
  id: json['id'] as String,
  active: json['active'] as bool,
  currency: json['currency'] as String,
  product: json['product'] as String,
  type: $enumDecode(_$PriceTypeEnumMap, json['type']),
  recurring: json['recurring'] == null
      ? null
      : Recurring.fromJson(json['recurring'] as Map<String, dynamic>),
  unitAmount: (json['unit_amount'] as num).toInt(),
  lookupKey: json['lookup_key'] as String?,
  taxBehavior: $enumDecodeNullable(
    _$PriceTaxBehaviorEnumMap,
    json['tax_behavior'],
  ),
);

Map<String, dynamic> _$PriceToJson(Price instance) => <String, dynamic>{
  'object': _$_PriceObjectEnumMap[instance.object]!,
  'id': instance.id,
  'active': instance.active,
  'currency': instance.currency,
  'product': instance.product,
  'type': _$PriceTypeEnumMap[instance.type]!,
  'recurring': ?instance.recurring?.toJson(),
  'unit_amount': instance.unitAmount,
  'lookup_key': ?instance.lookupKey,
  'tax_behavior': ?_$PriceTaxBehaviorEnumMap[instance.taxBehavior],
};

const _$_PriceObjectEnumMap = {_PriceObject.price: 'price'};

const _$PriceTypeEnumMap = {
  PriceType.one_time: 'one_time',
  PriceType.recurring: 'recurring',
};

const _$PriceTaxBehaviorEnumMap = {
  PriceTaxBehavior.inclusive: 'inclusive',
  PriceTaxBehavior.exclusive: 'exclusive',
  PriceTaxBehavior.unspecified: 'unspecified',
};

Product _$ProductFromJson(Map<String, dynamic> json) => Product(
  object: $enumDecode(_$_ProductObjectEnumMap, json['object']),
  id: json['id'] as String,
  active: json['active'] as bool,
  description: json['description'] as String?,
  metadata: json['metadata'] as Map<String, dynamic>?,
  name: json['name'] as String,
  defaultPrice: json['default_price'] as String?,
);

Map<String, dynamic> _$ProductToJson(Product instance) => <String, dynamic>{
  'object': _$_ProductObjectEnumMap[instance.object]!,
  'id': instance.id,
  'active': instance.active,
  'description': ?instance.description,
  'metadata': ?instance.metadata,
  'name': instance.name,
  'default_price': ?instance.defaultPrice,
};

const _$_ProductObjectEnumMap = {_ProductObject.product: 'product'};

PromotionCode _$PromotionCodeFromJson(Map<String, dynamic> json) =>
    PromotionCode(
      object: $enumDecode(_$_PromotionCodeObjectEnumMap, json['object']),
      id: json['id'] as String,
      code: json['code'] as String,
      coupon: Coupon.fromJson(json['coupon'] as Map<String, dynamic>),
      active: json['active'] as bool,
      created: (json['created'] as num).toInt(),
      livemode: json['livemode'] as bool,
      restrictions: PromotionCodeRestrictions.fromJson(
        json['restrictions'] as Map<String, dynamic>,
      ),
      timesRedeemed: (json['times_redeemed'] as num).toInt(),
      metadata: json['metadata'] as Map<String, dynamic>?,
      customer: json['customer'] as String?,
      expiresAt: (json['expires_at'] as num?)?.toInt(),
      maxRedemptions: (json['max_redemptions'] as num?)?.toInt(),
    );

Map<String, dynamic> _$PromotionCodeToJson(PromotionCode instance) =>
    <String, dynamic>{
      'object': _$_PromotionCodeObjectEnumMap[instance.object]!,
      'id': instance.id,
      'code': instance.code,
      'coupon': instance.coupon.toJson(),
      'active': instance.active,
      'created': instance.created,
      'livemode': instance.livemode,
      'restrictions': instance.restrictions.toJson(),
      'times_redeemed': instance.timesRedeemed,
      'metadata': ?instance.metadata,
      'customer': ?instance.customer,
      'expires_at': ?instance.expiresAt,
      'max_redemptions': ?instance.maxRedemptions,
    };

const _$_PromotionCodeObjectEnumMap = {
  _PromotionCodeObject.promotionCode: 'promotion_code',
};

PromotionCodeRestrictions _$PromotionCodeRestrictionsFromJson(
  Map<String, dynamic> json,
) => PromotionCodeRestrictions(
  firstTimeTransaction: json['first_time_transaction'] as bool,
  currencyOptions: json['currency_options'] as Map<String, dynamic>?,
  minimumAmount: (json['minimum_amount'] as num?)?.toInt(),
  minimumAmountCurrency: json['minimum_amount_currency'] as String?,
);

Map<String, dynamic> _$PromotionCodeRestrictionsToJson(
  PromotionCodeRestrictions instance,
) => <String, dynamic>{
  'first_time_transaction': instance.firstTimeTransaction,
  'currency_options': ?instance.currencyOptions,
  'minimum_amount': ?instance.minimumAmount,
  'minimum_amount_currency': ?instance.minimumAmountCurrency,
};

Refund _$RefundFromJson(Map<String, dynamic> json) => Refund(
  object: $enumDecode(_$_RefundObjectEnumMap, json['object']),
  id: json['id'] as String,
);

Map<String, dynamic> _$RefundToJson(Refund instance) => <String, dynamic>{
  'object': _$_RefundObjectEnumMap[instance.object]!,
  'id': instance.id,
};

const _$_RefundObjectEnumMap = {_RefundObject.refund: 'refund'};

ConfirmPaymentIntentRequest _$ConfirmPaymentIntentRequestFromJson(
  Map<String, dynamic> json,
) => ConfirmPaymentIntentRequest(
  paymentMethod: json['payment_method'] as String?,
  receiptEmail: json['receipt_email'] as String?,
  setupFutureUsage: $enumDecodeNullable(
    _$SetupFutureUsageEnumMap,
    json['setup_future_usage'],
  ),
  confirmationToken: json['confirmation_token'] as String?,
  errorOnRequiresAction: json['error_on_requires_action'] as bool?,
  mandate: json['mandate'] as String?,
  offSession: json['off_session'] as bool?,
  returnUrl: json['return_url'] as String?,
  useStripeSdk: json['use_stripe_sdk'] as bool?,
);

Map<String, dynamic> _$ConfirmPaymentIntentRequestToJson(
  ConfirmPaymentIntentRequest instance,
) => <String, dynamic>{
  'payment_method': ?instance.paymentMethod,
  'receipt_email': ?instance.receiptEmail,
  'setup_future_usage': ?_$SetupFutureUsageEnumMap[instance.setupFutureUsage],
  'confirmation_token': ?instance.confirmationToken,
  'error_on_requires_action': ?instance.errorOnRequiresAction,
  'mandate': ?instance.mandate,
  'off_session': ?instance.offSession,
  'return_url': ?instance.returnUrl,
  'use_stripe_sdk': ?instance.useStripeSdk,
};

CreateCheckoutSessionRequest _$CreateCheckoutSessionRequestFromJson(
  Map<String, dynamic> json,
) => CreateCheckoutSessionRequest(
  cancelUrl: json['cancel_url'] as String?,
  paymentMethodTypes: (json['payment_method_types'] as List<dynamic>?)
      ?.map((e) => $enumDecode(_$PaymentMethodTypeEnumMap, e))
      .toList(),
  successUrl: json['success_url'] as String?,
  mode: $enumDecodeNullable(_$SessionModeEnumMap, json['mode']),
  uiMode: $enumDecodeNullable(_$CheckoutSessionUIModeEnumMap, json['ui_mode']),
  clientReferenceId: json['client_reference_id'] as String?,
  customerEmail: json['customer_email'] as String?,
  customer: json['customer'] as String?,
  lineItems: (json['line_items'] as List<dynamic>?)
      ?.map((e) => LineItem.fromJson(e as Map<String, dynamic>))
      .toList(),
  billingAddressCollection: $enumDecodeNullable(
    _$BillingAddressCollectionEnumMap,
    json['billing_address_collection'],
  ),
  automaticTax: json['automatic_tax'] == null
      ? null
      : AutomaticTax.fromJson(json['automatic_tax'] as Map<String, dynamic>),
  taxIdCollection: json['tax_id_collection'] == null
      ? null
      : TaxIdCollection.fromJson(
          json['tax_id_collection'] as Map<String, dynamic>,
        ),
  paymentIntentData: json['payment_intent_data'] == null
      ? null
      : PaymentIntentData.fromJson(
          json['payment_intent_data'] as Map<String, dynamic>,
        ),
  subscriptionData: json['subscription_data'] == null
      ? null
      : SubscriptionData.fromJson(
          json['subscription_data'] as Map<String, dynamic>,
        ),
);

Map<String, dynamic> _$CreateCheckoutSessionRequestToJson(
  CreateCheckoutSessionRequest instance,
) => <String, dynamic>{
  'success_url': ?instance.successUrl,
  'cancel_url': ?instance.cancelUrl,
  'mode': ?_$SessionModeEnumMap[instance.mode],
  'ui_mode': ?_$CheckoutSessionUIModeEnumMap[instance.uiMode],
  'payment_method_types': ?instance.paymentMethodTypes
      ?.map((e) => _$PaymentMethodTypeEnumMap[e]!)
      .toList(),
  'client_reference_id': ?instance.clientReferenceId,
  'customer_email': ?instance.customerEmail,
  'customer': ?instance.customer,
  'line_items': ?instance.lineItems?.map((e) => e.toJson()).toList(),
  'billing_address_collection':
      ?_$BillingAddressCollectionEnumMap[instance.billingAddressCollection],
  'automatic_tax': ?instance.automaticTax?.toJson(),
  'tax_id_collection': ?instance.taxIdCollection?.toJson(),
  'payment_intent_data': ?instance.paymentIntentData?.toJson(),
  'subscription_data': ?instance.subscriptionData?.toJson(),
};

const _$SessionModeEnumMap = {
  SessionMode.payment: 'payment',
  SessionMode.setup: 'setup',
  SessionMode.subscription: 'subscription',
};

const _$BillingAddressCollectionEnumMap = {
  BillingAddressCollection.auto: 'auto',
  BillingAddressCollection.required: 'required',
};

LineItem _$LineItemFromJson(Map<String, dynamic> json) => LineItem(
  images: (json['images'] as List<dynamic>?)?.map((e) => e as String).toList(),
  quantity: (json['quantity'] as num?)?.toInt(),
  description: json['description'] as String?,
  price: json['price'] as String?,
  priceData: json['price_data'] == null
      ? null
      : PriceData.fromJson(json['price_data'] as Map<String, dynamic>),
);

Map<String, dynamic> _$LineItemToJson(LineItem instance) => <String, dynamic>{
  'images': ?instance.images,
  'quantity': ?instance.quantity,
  'description': ?instance.description,
  'price_data': ?instance.priceData?.toJson(),
  'price': ?instance.price,
};

PriceData _$PriceDataFromJson(Map<String, dynamic> json) => PriceData(
  currency: json['currency'] as String,
  product: json['product'] as String?,
  unitAmount: (json['unit_amount'] as num?)?.toInt(),
  productData: json['product_data'] == null
      ? null
      : ProductData.fromJson(json['product_data'] as Map<String, dynamic>),
);

Map<String, dynamic> _$PriceDataToJson(PriceData instance) => <String, dynamic>{
  'currency': instance.currency,
  'product': ?instance.product,
  'unit_amount': ?instance.unitAmount,
  'product_data': ?instance.productData?.toJson(),
};

ProductData _$ProductDataFromJson(Map<String, dynamic> json) => ProductData(
  name: json['name'] as String,
  description: json['description'] as String?,
  images: (json['images'] as List<dynamic>?)?.map((e) => e as String).toList(),
);

Map<String, dynamic> _$ProductDataToJson(ProductData instance) =>
    <String, dynamic>{
      'name': instance.name,
      'description': ?instance.description,
      'images': ?instance.images,
    };

AutomaticTax _$AutomaticTaxFromJson(Map<String, dynamic> json) =>
    AutomaticTax(enabled: json['enabled'] as bool);

Map<String, dynamic> _$AutomaticTaxToJson(AutomaticTax instance) =>
    <String, dynamic>{'enabled': instance.enabled};

TaxIdCollection _$TaxIdCollectionFromJson(Map<String, dynamic> json) =>
    TaxIdCollection(enabled: json['enabled'] as bool);

Map<String, dynamic> _$TaxIdCollectionToJson(TaxIdCollection instance) =>
    <String, dynamic>{'enabled': instance.enabled};

PaymentIntentData _$PaymentIntentDataFromJson(Map<String, dynamic> json) =>
    PaymentIntentData(
      receiptEmail: json['receipt_email'] as String?,
      setupFutureUsage: $enumDecodeNullable(
        _$SetupFutureUsageEnumMap,
        json['setup_future_usage'],
      ),
    );

Map<String, dynamic> _$PaymentIntentDataToJson(
  PaymentIntentData instance,
) => <String, dynamic>{
  'receipt_email': ?instance.receiptEmail,
  'setup_future_usage': ?_$SetupFutureUsageEnumMap[instance.setupFutureUsage],
};

SubscriptionData _$SubscriptionDataFromJson(Map<String, dynamic> json) =>
    SubscriptionData(
      trialEnd: (json['trial_end'] as num?)?.toInt(),
      trialPeriodDays: (json['trial_period_days'] as num?)?.toInt(),
      metadata: json['metadata'] as Map<String, dynamic>?,
    );

Map<String, dynamic> _$SubscriptionDataToJson(SubscriptionData instance) =>
    <String, dynamic>{
      'trial_end': ?instance.trialEnd,
      'trial_period_days': ?instance.trialPeriodDays,
      'metadata': ?instance.metadata,
    };

CreateCustomerRequest _$CreateCustomerRequestFromJson(
  Map<String, dynamic> json,
) => CreateCustomerRequest(
  address: json['address'] == null
      ? null
      : Address.fromJson(json['address'] as Map<String, dynamic>),
  description: json['description'] as String?,
  email: json['email'] as String?,
  metadata: (json['metadata'] as Map<String, dynamic>?)?.map(
    (k, e) => MapEntry(k, e as String),
  ),
  name: json['name'] as String?,
  paymentMethod: json['payment_method'] as String?,
  phoneNumber: json['phone_number'] as String?,
  shipping: json['shipping'] == null
      ? null
      : ShippingRequest.fromJson(json['shipping'] as Map<String, dynamic>),
);

Map<String, dynamic> _$CreateCustomerRequestToJson(
  CreateCustomerRequest instance,
) => <String, dynamic>{
  'address': ?instance.address?.toJson(),
  'description': ?instance.description,
  'email': ?instance.email,
  'metadata': ?instance.metadata,
  'name': ?instance.name,
  'payment_method': ?instance.paymentMethod,
  'phone_number': ?instance.phoneNumber,
  'shipping': ?instance.shipping?.toJson(),
};

ShippingRequest _$ShippingRequestFromJson(Map<String, dynamic> json) =>
    ShippingRequest(
      address: Address.fromJson(json['address'] as Map<String, dynamic>),
      name: json['name'] as String,
      phone: json['phone'] as String?,
    );

Map<String, dynamic> _$ShippingRequestToJson(ShippingRequest instance) =>
    <String, dynamic>{
      'address': instance.address.toJson(),
      'name': instance.name,
      'phone': ?instance.phone,
    };

CreateCustomerBalanceTransactionRequest
_$CreateCustomerBalanceTransactionRequestFromJson(Map<String, dynamic> json) =>
    CreateCustomerBalanceTransactionRequest(
      amount: (json['amount'] as num).toInt(),
      currency: json['currency'] as String,
      description: json['description'] as String?,
      metadata: json['metadata'] as Map<String, dynamic>?,
    );

Map<String, dynamic> _$CreateCustomerBalanceTransactionRequestToJson(
  CreateCustomerBalanceTransactionRequest instance,
) => <String, dynamic>{
  'amount': instance.amount,
  'currency': instance.currency,
  'description': ?instance.description,
  'metadata': ?instance.metadata,
};

CreateDiscountRequest _$CreateDiscountRequestFromJson(
  Map<String, dynamic> json,
) => CreateDiscountRequest(
  coupon: json['coupon'] as String?,
  discount: json['discount'] as String?,
  promotionCode: json['promotion_code'] as String?,
);

Map<String, dynamic> _$CreateDiscountRequestToJson(
  CreateDiscountRequest instance,
) => <String, dynamic>{
  'coupon': ?instance.coupon,
  'discount': ?instance.discount,
  'promotion_code': ?instance.promotionCode,
};

CreateInvoiceRequest _$CreateInvoiceRequestFromJson(
  Map<String, dynamic> json,
) => CreateInvoiceRequest(
  autoAdvance: json['auto_advance'] as bool?,
  automaticTax: json['automatic_tax'] == null
      ? null
      : CreateInvoiceAutomaticTaxRequest.fromJson(
          json['automatic_tax'] as Map<String, dynamic>,
        ),
  collectionMethod: $enumDecodeNullable(
    _$InvoiceCollectionMethodEnumMap,
    json['collection_method'],
  ),
  customer: json['customer'] as String?,
  description: json['description'] as String?,
  metadata: (json['metadata'] as Map<String, dynamic>?)?.map(
    (k, e) => MapEntry(k, e as String),
  ),
  currency: json['currency'] as String?,
  defaultPaymentMethod: json['default_payment_method'] as String?,
  defaultSource: json['default_source'] as String?,
  discounts: (json['discounts'] as List<dynamic>?)
      ?.map((e) => CreateDiscountRequest.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$CreateInvoiceRequestToJson(
  CreateInvoiceRequest instance,
) => <String, dynamic>{
  'auto_advance': ?instance.autoAdvance,
  'automatic_tax': ?instance.automaticTax?.toJson(),
  'collection_method':
      ?_$InvoiceCollectionMethodEnumMap[instance.collectionMethod],
  'customer': ?instance.customer,
  'description': ?instance.description,
  'metadata': ?instance.metadata,
  'currency': ?instance.currency,
  'default_payment_method': ?instance.defaultPaymentMethod,
  'default_source': ?instance.defaultSource,
  'discounts': ?instance.discounts?.map((e) => e.toJson()).toList(),
};

const _$InvoiceCollectionMethodEnumMap = {
  InvoiceCollectionMethod.chargeAutomatically: 'charge_automatically',
  InvoiceCollectionMethod.sendInvoice: 'send_invoice',
};

CreateInvoiceAutomaticTaxRequest _$CreateInvoiceAutomaticTaxRequestFromJson(
  Map<String, dynamic> json,
) => CreateInvoiceAutomaticTaxRequest(enabled: json['enabled'] as bool);

Map<String, dynamic> _$CreateInvoiceAutomaticTaxRequestToJson(
  CreateInvoiceAutomaticTaxRequest instance,
) => <String, dynamic>{'enabled': instance.enabled};

CreateInvoiceItemRequest _$CreateInvoiceItemRequestFromJson(
  Map<String, dynamic> json,
) => CreateInvoiceItemRequest(
  customer: json['customer'] as String,
  description: json['description'] as String?,
  pricing: json['pricing'] == null
      ? null
      : CreateInvoiceItemPricingRequest.fromJson(
          json['pricing'] as Map<String, dynamic>,
        ),
  invoice: json['invoice'] as String?,
  metadata: json['metadata'] as Map<String, dynamic>?,
);

Map<String, dynamic> _$CreateInvoiceItemRequestToJson(
  CreateInvoiceItemRequest instance,
) => <String, dynamic>{
  'customer': instance.customer,
  'description': ?instance.description,
  'pricing': ?instance.pricing?.toJson(),
  'invoice': ?instance.invoice,
  'metadata': ?instance.metadata,
};

CreateInvoiceItemPricingRequest _$CreateInvoiceItemPricingRequestFromJson(
  Map<String, dynamic> json,
) => CreateInvoiceItemPricingRequest(price: json['price'] as String?);

Map<String, dynamic> _$CreateInvoiceItemPricingRequestToJson(
  CreateInvoiceItemPricingRequest instance,
) => <String, dynamic>{'price': ?instance.price};

CreatePreviewInvoiceRequest _$CreatePreviewInvoiceRequestFromJson(
  Map<String, dynamic> json,
) => CreatePreviewInvoiceRequest(
  automaticTax: json['automatic_tax'] == null
      ? null
      : CreateInvoiceAutomaticTaxRequest.fromJson(
          json['automatic_tax'] as Map<String, dynamic>,
        ),
  customer: json['customer'] as String?,
  customerDetails: json['customer_details'] == null
      ? null
      : CreatePreviewInvoiceCustomerDetailsRequest.fromJson(
          json['customer_details'] as Map<String, dynamic>,
        ),
  subscription: json['subscription'] as String?,
  discounts: (json['discounts'] as List<dynamic>?)
      ?.map((e) => CreateDiscountRequest.fromJson(e as Map<String, dynamic>))
      .toList(),
  invoiceItems: (json['invoice_items'] as List<dynamic>?)
      ?.map(
        (e) =>
            CreatePreviewInvoiceItemRequest.fromJson(e as Map<String, dynamic>),
      )
      .toList(),
  previewMode: $enumDecodeNullable(
    _$PreviewInvoiceModeEnumMap,
    json['preview_mode'],
  ),
  subscriptionDetails: json['subscription_details'] == null
      ? null
      : CreatePreviewInvoiceSubscriptionDetailsRequest.fromJson(
          json['subscription_details'] as Map<String, dynamic>,
        ),
);

Map<String, dynamic> _$CreatePreviewInvoiceRequestToJson(
  CreatePreviewInvoiceRequest instance,
) => <String, dynamic>{
  'automatic_tax': ?instance.automaticTax?.toJson(),
  'customer': ?instance.customer,
  'customer_details': ?instance.customerDetails?.toJson(),
  'subscription': ?instance.subscription,
  'discounts': ?instance.discounts?.map((e) => e.toJson()).toList(),
  'invoice_items': ?instance.invoiceItems?.map((e) => e.toJson()).toList(),
  'preview_mode': ?_$PreviewInvoiceModeEnumMap[instance.previewMode],
  'subscription_details': ?instance.subscriptionDetails?.toJson(),
};

const _$PreviewInvoiceModeEnumMap = {
  PreviewInvoiceMode.next: 'next',
  PreviewInvoiceMode.recurring: 'recurring',
};

CreatePreviewInvoiceCustomerDetailsRequest
_$CreatePreviewInvoiceCustomerDetailsRequestFromJson(
  Map<String, dynamic> json,
) => CreatePreviewInvoiceCustomerDetailsRequest(
  address: json['address'] == null
      ? null
      : Address.fromJson(json['address'] as Map<String, dynamic>),
);

Map<String, dynamic> _$CreatePreviewInvoiceCustomerDetailsRequestToJson(
  CreatePreviewInvoiceCustomerDetailsRequest instance,
) => <String, dynamic>{'address': ?instance.address?.toJson()};

CreatePreviewInvoiceSubscriptionDetailsRequest
_$CreatePreviewInvoiceSubscriptionDetailsRequestFromJson(
  Map<String, dynamic> json,
) => CreatePreviewInvoiceSubscriptionDetailsRequest(
  billingCycleAnchor: _$JsonConverterFromJson<int, DateTime>(
    json['billing_cycle_anchor'],
    const TimestampConverter().fromJson,
  ),
  cancelAt: _$JsonConverterFromJson<int, DateTime>(
    json['cancel_at'],
    const TimestampConverter().fromJson,
  ),
  cancelAtPeriodEnd: json['cancel_at_period_end'] as bool?,
  cancelNow: json['cancel_now'] as bool?,
  defaultTaxRates: (json['default_tax_rates'] as List<dynamic>?)
      ?.map((e) => e as String)
      .toList(),
  items: (json['items'] as List<dynamic>?)
      ?.map(
        (e) => CreatePreviewInvoiceSubscriptionItemDetailsRequest.fromJson(
          e as Map<String, dynamic>,
        ),
      )
      .toList(),
  prorationBehavior: $enumDecodeNullable(
    _$ProrationBehaviorEnumMap,
    json['proration_behavior'],
  ),
  prorationDate: _$JsonConverterFromJson<int, DateTime>(
    json['proration_date'],
    const TimestampConverter().fromJson,
  ),
  startDate: _$JsonConverterFromJson<int, DateTime>(
    json['start_date'],
    const TimestampConverter().fromJson,
  ),
  trialEnd: _$JsonConverterFromJson<int, DateTime>(
    json['trial_end'],
    const TimestampConverter().fromJson,
  ),
);

Map<String, dynamic> _$CreatePreviewInvoiceSubscriptionDetailsRequestToJson(
  CreatePreviewInvoiceSubscriptionDetailsRequest instance,
) => <String, dynamic>{
  'billing_cycle_anchor': ?_$JsonConverterToJson<int, DateTime>(
    instance.billingCycleAnchor,
    const TimestampConverter().toJson,
  ),
  'cancel_at': ?_$JsonConverterToJson<int, DateTime>(
    instance.cancelAt,
    const TimestampConverter().toJson,
  ),
  'cancel_at_period_end': ?instance.cancelAtPeriodEnd,
  'cancel_now': ?instance.cancelNow,
  'default_tax_rates': ?instance.defaultTaxRates,
  'items': ?instance.items?.map((e) => e.toJson()).toList(),
  'proration_behavior': ?_$ProrationBehaviorEnumMap[instance.prorationBehavior],
  'proration_date': ?_$JsonConverterToJson<int, DateTime>(
    instance.prorationDate,
    const TimestampConverter().toJson,
  ),
  'start_date': ?_$JsonConverterToJson<int, DateTime>(
    instance.startDate,
    const TimestampConverter().toJson,
  ),
  'trial_end': ?_$JsonConverterToJson<int, DateTime>(
    instance.trialEnd,
    const TimestampConverter().toJson,
  ),
};

const _$ProrationBehaviorEnumMap = {
  ProrationBehavior.always_invoice: 'always_invoice',
  ProrationBehavior.create_prorations: 'create_prorations',
  ProrationBehavior.none: 'none',
};

CreatePreviewInvoiceSubscriptionItemDetailsRequest
_$CreatePreviewInvoiceSubscriptionItemDetailsRequestFromJson(
  Map<String, dynamic> json,
) => CreatePreviewInvoiceSubscriptionItemDetailsRequest(
  clearUsage: json['clear_usage'] as bool?,
  deleted: json['deleted'] as bool?,
  discounts: (json['discounts'] as List<dynamic>?)
      ?.map((e) => CreateDiscountRequest.fromJson(e as Map<String, dynamic>))
      .toList(),
  id: json['id'] as String?,
  metadata: (json['metadata'] as Map<String, dynamic>?)?.map(
    (k, e) => MapEntry(k, e as String),
  ),
  price: json['price'] as String?,
  quantity: (json['quantity'] as num?)?.toInt(),
  taxRates: (json['tax_rates'] as List<dynamic>?)
      ?.map((e) => e as String)
      .toList(),
);

Map<String, dynamic> _$CreatePreviewInvoiceSubscriptionItemDetailsRequestToJson(
  CreatePreviewInvoiceSubscriptionItemDetailsRequest instance,
) => <String, dynamic>{
  'clear_usage': ?instance.clearUsage,
  'deleted': ?instance.deleted,
  'discounts': ?instance.discounts?.map((e) => e.toJson()).toList(),
  'id': ?instance.id,
  'metadata': ?instance.metadata,
  'price': ?instance.price,
  'quantity': ?instance.quantity,
  'tax_rates': ?instance.taxRates,
};

CreatePreviewInvoiceItemRequest _$CreatePreviewInvoiceItemRequestFromJson(
  Map<String, dynamic> json,
) => CreatePreviewInvoiceItemRequest(
  price: json['price'] as String?,
  quantity: (json['quantity'] as num?)?.toInt(),
);

Map<String, dynamic> _$CreatePreviewInvoiceItemRequestToJson(
  CreatePreviewInvoiceItemRequest instance,
) => <String, dynamic>{
  'price': ?instance.price,
  'quantity': ?instance.quantity,
};

CreatePaymentIntentRequest _$CreatePaymentIntentRequestFromJson(
  Map<String, dynamic> json,
) => CreatePaymentIntentRequest(
  amount: (json['amount'] as num).toInt(),
  currency: json['currency'] as String,
  automaticPaymentMethods: json['automatic_payment_methods'] == null
      ? null
      : AutomaticPaymentMethods.fromJson(
          json['automatic_payment_methods'] as Map<String, dynamic>,
        ),
  confirm: json['confirm'] as bool?,
  customer: json['customer'] as String?,
  description: json['description'] as String?,
  metadata: (json['metadata'] as Map<String, dynamic>?)?.map(
    (k, e) => MapEntry(k, e as String),
  ),
  offSession: json['off_session'] as bool?,
  paymentMethod: json['payment_method'] as String?,
  paymentMethodTypes: (json['payment_method_types'] as List<dynamic>?)
      ?.map((e) => $enumDecode(_$PaymentMethodTypeEnumMap, e))
      .toSet(),
  receiptEmail: json['receipt_email'] as String?,
  setupFutureUsage: $enumDecodeNullable(
    _$SetupFutureUsageEnumMap,
    json['setup_future_usage'],
  ),
  shipping: json['shipping'] == null
      ? null
      : ShippingSpecification.fromJson(
          json['shipping'] as Map<String, dynamic>,
        ),
  statementDescriptor: json['statement_descriptor'] as String?,
  statementDescriptorSuffix: json['statement_descriptor_suffix'] as String?,
);

Map<String, dynamic> _$CreatePaymentIntentRequestToJson(
  CreatePaymentIntentRequest instance,
) => <String, dynamic>{
  'amount': instance.amount,
  'automatic_payment_methods': ?instance.automaticPaymentMethods?.toJson(),
  'currency': instance.currency,
  'confirm': ?instance.confirm,
  'customer': ?instance.customer,
  'description': ?instance.description,
  'metadata': ?instance.metadata,
  'off_session': ?instance.offSession,
  'payment_method': ?instance.paymentMethod,
  'payment_method_types': ?instance.paymentMethodTypes
      ?.map((e) => _$PaymentMethodTypeEnumMap[e]!)
      .toList(),
  'receipt_email': ?instance.receiptEmail,
  'setup_future_usage': ?_$SetupFutureUsageEnumMap[instance.setupFutureUsage],
  'shipping': ?instance.shipping?.toJson(),
  'statement_descriptor': ?instance.statementDescriptor,
  'statement_descriptor_suffix': ?instance.statementDescriptorSuffix,
};

CreatePortalSessionRequest _$CreatePortalSessionRequestFromJson(
  Map<String, dynamic> json,
) => CreatePortalSessionRequest(
  customer: json['customer'] as String,
  returnUrl: json['return_url'] as String?,
);

Map<String, dynamic> _$CreatePortalSessionRequestToJson(
  CreatePortalSessionRequest instance,
) => <String, dynamic>{
  'customer': instance.customer,
  'return_url': ?instance.returnUrl,
};

CreatePriceRequest _$CreatePriceRequestFromJson(Map<String, dynamic> json) =>
    CreatePriceRequest(
      currency: json['currency'] as String,
      product: json['product'] as String?,
      unitAmount: (json['unit_amount'] as num?)?.toInt(),
      active: json['active'] as bool?,
      lookupKey: json['lookup_key'] as String?,
      metadata: json['metadata'] as Map<String, dynamic>?,
      nickname: json['nickname'] as String?,
      recurring: json['recurring'] == null
          ? null
          : Recurring.fromJson(json['recurring'] as Map<String, dynamic>),
      parameters: json['parameters'] == null
          ? null
          : PriceParameters.fromJson(
              json['parameters'] as Map<String, dynamic>,
            ),
    );

Map<String, dynamic> _$CreatePriceRequestToJson(CreatePriceRequest instance) =>
    <String, dynamic>{
      'currency': instance.currency,
      'product': ?instance.product,
      'unit_amount': ?instance.unitAmount,
      'active': ?instance.active,
      'lookup_key': ?instance.lookupKey,
      'metadata': ?instance.metadata,
      'nickname': ?instance.nickname,
      'recurring': ?instance.recurring?.toJson(),
      'parameters': ?instance.parameters?.toJson(),
    };

Recurring _$RecurringFromJson(Map<String, dynamic> json) => Recurring(
  interval: $enumDecode(_$RecurringIntervalEnumMap, json['interval']),
  aggregateUsage: $enumDecodeNullable(
    _$AggregateUsageEnumMap,
    json['aggregate_usage'],
  ),
  intervalCount: (json['interval_count'] as num?)?.toInt(),
  usageType: json['usage_type'] as String?,
);

Map<String, dynamic> _$RecurringToJson(Recurring instance) => <String, dynamic>{
  'interval': _$RecurringIntervalEnumMap[instance.interval]!,
  'aggregate_usage': ?_$AggregateUsageEnumMap[instance.aggregateUsage],
  'interval_count': ?instance.intervalCount,
  'usage_type': ?instance.usageType,
};

const _$RecurringIntervalEnumMap = {
  RecurringInterval.day: 'day',
  RecurringInterval.week: 'week',
  RecurringInterval.month: 'month',
  RecurringInterval.year: 'year',
};

const _$AggregateUsageEnumMap = {
  AggregateUsage.sum: 'sum',
  AggregateUsage.last_during_period: 'last_during_period',
  AggregateUsage.last_ever: 'last_ever',
  AggregateUsage.max: 'max',
};

PriceParameters _$PriceParametersFromJson(Map<String, dynamic> json) =>
    PriceParameters(
      customUnitAmount: (json['custom_unit_amount'] as num?)?.toInt(),
      productData: json['product_data'] == null
          ? null
          : ProductData.fromJson(json['product_data'] as Map<String, dynamic>),
      tiers: (json['tiers'] as List<dynamic>?)
          ?.map((e) => e as Map<String, dynamic>)
          .toList(),
      tiersMode: json['tiers_mode'] as String?,
      billingScheme: json['billing_scheme'] as String?,
      currencyOptions: json['currency_options'] as Map<String, dynamic>?,
      lookupKey: json['lookup_key'] as String?,
      taxBehavior: json['tax_behavior'] as String?,
      transferLookupKey: json['transfer_lookup_key'] as String?,
      transformQuantity: json['transform_quantity'] as Map<String, dynamic>?,
      unitAmountDecimal: (json['unit_amount_decimal'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$PriceParametersToJson(PriceParameters instance) =>
    <String, dynamic>{
      'custom_unit_amount': ?instance.customUnitAmount,
      'product_data': ?instance.productData?.toJson(),
      'tiers': ?instance.tiers,
      'tiers_mode': ?instance.tiersMode,
      'billing_scheme': ?instance.billingScheme,
      'currency_options': ?instance.currencyOptions,
      'lookup_key': ?instance.lookupKey,
      'tax_behavior': ?instance.taxBehavior,
      'transfer_lookup_key': ?instance.transferLookupKey,
      'transform_quantity': ?instance.transformQuantity,
      'unit_amount_decimal': ?instance.unitAmountDecimal,
    };

CreateProductRequest _$CreateProductRequestFromJson(
  Map<String, dynamic> json,
) => CreateProductRequest(
  id: json['id'] as String?,
  name: json['name'] as String,
  active: json['active'] as bool? ?? true,
  description: json['description'] as String?,
  metadata: json['metadata'] as Map<String, dynamic>?,
  defaultPriceData: json['default_price_data'] as Map<String, dynamic>?,
  features: (json['features'] as List<dynamic>?)
      ?.map((e) => e as Map<String, dynamic>)
      .toList(),
  images: (json['images'] as List<dynamic>?)?.map((e) => e as String).toList(),
  packageDimensions: json['package_dimensions'] as Map<String, dynamic>?,
  shippable: json['shippable'] as bool?,
  statementDescriptor: json['statement_descriptor'] as String?,
  taxCode: json['tax_code'] as String?,
  unitLabel: json['unit_label'] as String?,
  url: json['url'] as String?,
);

Map<String, dynamic> _$CreateProductRequestToJson(
  CreateProductRequest instance,
) => <String, dynamic>{
  'id': ?instance.id,
  'name': instance.name,
  'active': instance.active,
  'description': ?instance.description,
  'metadata': ?instance.metadata,
  'default_price_data': ?instance.defaultPriceData,
  'features': ?instance.features,
  'images': ?instance.images,
  'package_dimensions': ?instance.packageDimensions,
  'shippable': ?instance.shippable,
  'statement_descriptor': ?instance.statementDescriptor,
  'tax_code': ?instance.taxCode,
  'unit_label': ?instance.unitLabel,
  'url': ?instance.url,
};

CreateRefundRequest _$CreateRefundRequestFromJson(Map<String, dynamic> json) =>
    CreateRefundRequest(
      charge: json['charge'] as String?,
      amount: (json['amount'] as num?)?.toInt(),
      paymentIntent: json['payment_intent'] as String?,
      reason: json['reason'] as String?,
    );

Map<String, dynamic> _$CreateRefundRequestToJson(
  CreateRefundRequest instance,
) => <String, dynamic>{
  'charge': ?instance.charge,
  'amount': ?instance.amount,
  'payment_intent': ?instance.paymentIntent,
  'reason': ?instance.reason,
};

CreateSubscriptionRequest _$CreateSubscriptionRequestFromJson(
  Map<String, dynamic> json,
) => CreateSubscriptionRequest(
  customer: json['customer'] as String,
  items: (json['items'] as List<dynamic>)
      .map(
        (e) =>
            CreateSubscriptionItemRequest.fromJson(e as Map<String, dynamic>),
      )
      .toList(),
  cancelAtPeriodEnd: json['cancel_at_period_end'] as bool?,
  currency: json['currency'] as String?,
  defaultPaymentMethod: json['default_payment_method'] as String?,
  description: json['description'] as String?,
  metadata: (json['metadata'] as Map<String, dynamic>?)?.map(
    (k, e) => MapEntry(k, e as String),
  ),
  paymentBehavior: $enumDecodeNullable(
    _$PaymentBehaviorEnumMap,
    json['payment_behavior'],
  ),
  backdateStartDate: _$JsonConverterFromJson<int, DateTime>(
    json['backdate_start_date'],
    const TimestampConverter().fromJson,
  ),
  billingCycleAnchor: _$JsonConverterFromJson<int, DateTime>(
    json['billing_cycle_anchor'],
    const TimestampConverter().fromJson,
  ),
  billingCycleAnchorConfig: json['billing_cycle_anchor_config'] == null
      ? null
      : BillingCycleAnchorConfig.fromJson(
          json['billing_cycle_anchor_config'] as Map<String, dynamic>,
        ),
  cancelAt: _$JsonConverterFromJson<int, DateTime>(
    json['cancel_at'],
    const TimestampConverter().fromJson,
  ),
  defaultTaxRates: (json['default_tax_rates'] as List<dynamic>?)
      ?.map((e) => e as String)
      .toList(),
  discounts: (json['discounts'] as List<dynamic>?)
      ?.map((e) => CreateDiscountRequest.fromJson(e as Map<String, dynamic>))
      .toList(),
  offSession: json['off_session'] as bool?,
  paymentSettings: json['payment_settings'] == null
      ? null
      : SubscriptionPaymentSettingsRequest.fromJson(
          json['payment_settings'] as Map<String, dynamic>,
        ),
  prorationBehavior: $enumDecodeNullable(
    _$ProrationBehaviorEnumMap,
    json['proration_behavior'],
  ),
  trialEnd: _$JsonConverterFromJson<int, DateTime>(
    json['trial_end'],
    const TimestampConverter().fromJson,
  ),
  trialFromPlan: json['trial_from_plan'] as bool?,
  trialPeriodDays: (json['trial_period_days'] as num?)?.toInt(),
);

Map<String, dynamic> _$CreateSubscriptionRequestToJson(
  CreateSubscriptionRequest instance,
) => <String, dynamic>{
  'customer': instance.customer,
  'items': instance.items.map((e) => e.toJson()).toList(),
  'cancel_at_period_end': ?instance.cancelAtPeriodEnd,
  'currency': ?instance.currency,
  'default_payment_method': ?instance.defaultPaymentMethod,
  'description': ?instance.description,
  'metadata': ?instance.metadata,
  'payment_behavior': ?_$PaymentBehaviorEnumMap[instance.paymentBehavior],
  'backdate_start_date': ?_$JsonConverterToJson<int, DateTime>(
    instance.backdateStartDate,
    const TimestampConverter().toJson,
  ),
  'billing_cycle_anchor': ?_$JsonConverterToJson<int, DateTime>(
    instance.billingCycleAnchor,
    const TimestampConverter().toJson,
  ),
  'billing_cycle_anchor_config': ?instance.billingCycleAnchorConfig?.toJson(),
  'cancel_at': ?_$JsonConverterToJson<int, DateTime>(
    instance.cancelAt,
    const TimestampConverter().toJson,
  ),
  'default_tax_rates': ?instance.defaultTaxRates,
  'discounts': ?instance.discounts?.map((e) => e.toJson()).toList(),
  'off_session': ?instance.offSession,
  'payment_settings': ?instance.paymentSettings?.toJson(),
  'proration_behavior': ?_$ProrationBehaviorEnumMap[instance.prorationBehavior],
  'trial_end': ?_$JsonConverterToJson<int, DateTime>(
    instance.trialEnd,
    const TimestampConverter().toJson,
  ),
  'trial_from_plan': ?instance.trialFromPlan,
  'trial_period_days': ?instance.trialPeriodDays,
};

const _$PaymentBehaviorEnumMap = {
  PaymentBehavior.allow_incomplete: 'allow_incomplete',
  PaymentBehavior.default_incomplete: 'default_incomplete',
  PaymentBehavior.error_if_incomplete: 'error_if_incomplete',
  PaymentBehavior.pending_if_incomplete: 'pending_if_incomplete',
};

CreateSubscriptionItemRequest _$CreateSubscriptionItemRequestFromJson(
  Map<String, dynamic> json,
) => CreateSubscriptionItemRequest(
  price: json['price'] as String?,
  discounts: (json['discounts'] as List<dynamic>?)
      ?.map((e) => CreateDiscountRequest.fromJson(e as Map<String, dynamic>))
      .toList(),
  metadata: (json['metadata'] as Map<String, dynamic>?)?.map(
    (k, e) => MapEntry(k, e as String),
  ),
  quantity: (json['quantity'] as num?)?.toInt(),
  taxRates: (json['tax_rates'] as List<dynamic>?)
      ?.map((e) => e as String)
      .toList(),
);

Map<String, dynamic> _$CreateSubscriptionItemRequestToJson(
  CreateSubscriptionItemRequest instance,
) => <String, dynamic>{
  'price': ?instance.price,
  'discounts': ?instance.discounts?.map((e) => e.toJson()).toList(),
  'metadata': ?instance.metadata,
  'quantity': ?instance.quantity,
  'tax_rates': ?instance.taxRates,
};

CreateSubscriptionScheduleRequest _$CreateSubscriptionScheduleRequestFromJson(
  Map<String, dynamic> json,
) => CreateSubscriptionScheduleRequest(
  fromSubscription: json['from_subscription'] as String?,
);

Map<String, dynamic> _$CreateSubscriptionScheduleRequestToJson(
  CreateSubscriptionScheduleRequest instance,
) => <String, dynamic>{'from_subscription': ?instance.fromSubscription};

CreatedRequest _$CreatedRequestFromJson(Map<String, dynamic> json) =>
    CreatedRequest(
      gt: (json['gt'] as num?)?.toInt(),
      gte: (json['gte'] as num?)?.toInt(),
      lt: (json['lt'] as num?)?.toInt(),
      lte: (json['lte'] as num?)?.toInt(),
    );

Map<String, dynamic> _$CreatedRequestToJson(CreatedRequest instance) =>
    <String, dynamic>{
      'gt': ?instance.gt,
      'gte': ?instance.gte,
      'lt': ?instance.lt,
      'lte': ?instance.lte,
    };

ListCheckoutSessionsRequest _$ListCheckoutSessionsRequestFromJson(
  Map<String, dynamic> json,
) => ListCheckoutSessionsRequest(
  paymentIntent: json['payment_intent'] as String?,
  subscription: json['subscription'] as String?,
  created: json['created'] == null
      ? null
      : CreatedRequest.fromJson(json['created'] as Map<String, dynamic>),
  customer: json['customer'] as String?,
  endingBefore: json['ending_before'] as String?,
  limit: (json['limit'] as num?)?.toInt(),
  paymentLink: json['payment_link'] as String?,
  startingAfter: json['starting_after'] as String?,
  status: $enumDecodeNullable(_$CheckoutSessionStatusEnumMap, json['status']),
);

Map<String, dynamic> _$ListCheckoutSessionsRequestToJson(
  ListCheckoutSessionsRequest instance,
) => <String, dynamic>{
  'payment_intent': ?instance.paymentIntent,
  'subscription': ?instance.subscription,
  'created': ?instance.created?.toJson(),
  'customer': ?instance.customer,
  'ending_before': ?instance.endingBefore,
  'limit': ?instance.limit,
  'payment_link': ?instance.paymentLink,
  'starting_after': ?instance.startingAfter,
  'status': ?_$CheckoutSessionStatusEnumMap[instance.status],
};

ListCouponsRequest _$ListCouponsRequestFromJson(Map<String, dynamic> json) =>
    ListCouponsRequest(
      created: json['created'] == null
          ? null
          : CreatedRequest.fromJson(json['created'] as Map<String, dynamic>),
      endingBefore: json['ending_before'] as String?,
      limit: (json['limit'] as num?)?.toInt(),
      startingAfter: json['starting_after'] as String?,
    );

Map<String, dynamic> _$ListCouponsRequestToJson(ListCouponsRequest instance) =>
    <String, dynamic>{
      'created': ?instance.created?.toJson(),
      'ending_before': ?instance.endingBefore,
      'limit': ?instance.limit,
      'starting_after': ?instance.startingAfter,
    };

ListCustomerBalanceTransactionsRequest
_$ListCustomerBalanceTransactionsRequestFromJson(Map<String, dynamic> json) =>
    ListCustomerBalanceTransactionsRequest(
      created: json['created'] == null
          ? null
          : CreatedRequest.fromJson(json['created'] as Map<String, dynamic>),
      endingBefore: json['ending_before'] as String?,
      limit: (json['limit'] as num?)?.toInt(),
      startingAfter: json['starting_after'] as String?,
    );

Map<String, dynamic> _$ListCustomerBalanceTransactionsRequestToJson(
  ListCustomerBalanceTransactionsRequest instance,
) => <String, dynamic>{
  'created': ?instance.created?.toJson(),
  'ending_before': ?instance.endingBefore,
  'limit': ?instance.limit,
  'starting_after': ?instance.startingAfter,
};

ListInvoicesRequest _$ListInvoicesRequestFromJson(Map<String, dynamic> json) =>
    ListInvoicesRequest(
      customer: json['customer'] as String?,
      status: $enumDecodeNullable(_$InvoiceStatusEnumMap, json['status']),
      subscription: json['subscription'] as String?,
      collectionMethod: $enumDecodeNullable(
        _$InvoiceCollectionMethodEnumMap,
        json['collection_method'],
      ),
      created: json['created'] == null
          ? null
          : CreatedRequest.fromJson(json['created'] as Map<String, dynamic>),
      endingBefore: json['ending_before'] as String?,
      limit: (json['limit'] as num?)?.toInt(),
      startingAfter: json['starting_after'] as String?,
    );

Map<String, dynamic> _$ListInvoicesRequestToJson(
  ListInvoicesRequest instance,
) => <String, dynamic>{
  'customer': ?instance.customer,
  'status': ?_$InvoiceStatusEnumMap[instance.status],
  'subscription': ?instance.subscription,
  'collection_method':
      ?_$InvoiceCollectionMethodEnumMap[instance.collectionMethod],
  'created': ?instance.created?.toJson(),
  'ending_before': ?instance.endingBefore,
  'limit': ?instance.limit,
  'starting_after': ?instance.startingAfter,
};

ListPricesRequest _$ListPricesRequestFromJson(Map<String, dynamic> json) =>
    ListPricesRequest(
      active: json['active'] as bool?,
      currency: json['currency'] as String?,
      product: json['product'] as String?,
      endingBefore: json['ending_before'] as String?,
      limit: (json['limit'] as num?)?.toInt(),
      startingAfter: json['starting_after'] as String?,
    );

Map<String, dynamic> _$ListPricesRequestToJson(ListPricesRequest instance) =>
    <String, dynamic>{
      'active': ?instance.active,
      'currency': ?instance.currency,
      'product': ?instance.product,
      'ending_before': ?instance.endingBefore,
      'limit': ?instance.limit,
      'starting_after': ?instance.startingAfter,
    };

ListProductsRequest _$ListProductsRequestFromJson(Map<String, dynamic> json) =>
    ListProductsRequest(active: json['active'] as bool?);

Map<String, dynamic> _$ListProductsRequestToJson(
  ListProductsRequest instance,
) => <String, dynamic>{'active': ?instance.active};

ListPromotionCodesRequest _$ListPromotionCodesRequestFromJson(
  Map<String, dynamic> json,
) => ListPromotionCodesRequest(
  active: json['active'] as bool?,
  code: json['code'] as String?,
  coupon: json['coupon'] as String?,
  created: json['created'] == null
      ? null
      : CreatedRequest.fromJson(json['created'] as Map<String, dynamic>),
  customer: json['customer'] as String?,
  endingBefore: json['ending_before'] as String?,
  limit: (json['limit'] as num?)?.toInt(),
  startingAfter: json['starting_after'] as String?,
);

Map<String, dynamic> _$ListPromotionCodesRequestToJson(
  ListPromotionCodesRequest instance,
) => <String, dynamic>{
  'active': ?instance.active,
  'code': ?instance.code,
  'coupon': ?instance.coupon,
  'created': ?instance.created?.toJson(),
  'customer': ?instance.customer,
  'ending_before': ?instance.endingBefore,
  'limit': ?instance.limit,
  'starting_after': ?instance.startingAfter,
};

ListSubscriptionItemsRequest _$ListSubscriptionItemsRequestFromJson(
  Map<String, dynamic> json,
) => ListSubscriptionItemsRequest(
  subscription: json['subscription'] as String?,
  endingBefore: json['ending_before'] as String?,
  limit: (json['limit'] as num?)?.toInt(),
  startingAfter: json['starting_after'] as String?,
);

Map<String, dynamic> _$ListSubscriptionItemsRequestToJson(
  ListSubscriptionItemsRequest instance,
) => <String, dynamic>{
  'subscription': ?instance.subscription,
  'ending_before': ?instance.endingBefore,
  'limit': ?instance.limit,
  'starting_after': ?instance.startingAfter,
};

ListSubscriptionSchedulesRequest _$ListSubscriptionSchedulesRequestFromJson(
  Map<String, dynamic> json,
) => ListSubscriptionSchedulesRequest(
  customer: json['customer'] as String?,
  limit: (json['limit'] as num?)?.toInt(),
);

Map<String, dynamic> _$ListSubscriptionSchedulesRequestToJson(
  ListSubscriptionSchedulesRequest instance,
) => <String, dynamic>{
  'customer': ?instance.customer,
  'limit': ?instance.limit,
};

ListSubscriptionsRequest _$ListSubscriptionsRequestFromJson(
  Map<String, dynamic> json,
) => ListSubscriptionsRequest(
  customer: json['customer'] as String?,
  price: json['price'] as String?,
  status: $enumDecodeNullable(_$SubscriptionStatusEnumMap, json['status']),
  endingBefore: json['ending_before'] as String?,
  limit: (json['limit'] as num?)?.toInt(),
  startingAfter: json['starting_after'] as String?,
);

Map<String, dynamic> _$ListSubscriptionsRequestToJson(
  ListSubscriptionsRequest instance,
) => <String, dynamic>{
  'customer': ?instance.customer,
  'price': ?instance.price,
  'status': ?_$SubscriptionStatusEnumMap[instance.status],
  'ending_before': ?instance.endingBefore,
  'limit': ?instance.limit,
  'starting_after': ?instance.startingAfter,
};

const _$SubscriptionStatusEnumMap = {
  SubscriptionStatus.incomplete: 'incomplete',
  SubscriptionStatus.incomplete_expired: 'incomplete_expired',
  SubscriptionStatus.trialing: 'trialing',
  SubscriptionStatus.active: 'active',
  SubscriptionStatus.past_due: 'past_due',
  SubscriptionStatus.canceled: 'canceled',
  SubscriptionStatus.unpaid: 'unpaid',
  SubscriptionStatus.all: 'all',
  SubscriptionStatus.ended: 'ended',
};

SubscriptionPaymentSettingsRequest _$SubscriptionPaymentSettingsRequestFromJson(
  Map<String, dynamic> json,
) => SubscriptionPaymentSettingsRequest(
  paymentMethodTypes: (json['payment_method_types'] as List<dynamic>?)
      ?.map((e) => e as String)
      .toList(),
);

Map<String, dynamic> _$SubscriptionPaymentSettingsRequestToJson(
  SubscriptionPaymentSettingsRequest instance,
) => <String, dynamic>{'payment_method_types': ?instance.paymentMethodTypes};

UpdateCustomerRequest _$UpdateCustomerRequestFromJson(
  Map<String, dynamic> json,
) => UpdateCustomerRequest(
  id: json['id'] as String,
  address: json['address'] == null
      ? null
      : Address.fromJson(json['address'] as Map<String, dynamic>),
  description: json['description'] as String?,
  email: json['email'] as String?,
  metadata: (json['metadata'] as Map<String, dynamic>?)?.map(
    (k, e) => MapEntry(k, e as String),
  ),
  name: json['name'] as String?,
  paymentMethod: json['payment_method'] as String?,
  phoneNumber: json['phone_number'] as String?,
  invoiceSettings: json['invoice_settings'] == null
      ? null
      : InvoiceSettings.fromJson(
          json['invoice_settings'] as Map<String, dynamic>,
        ),
  shipping: json['shipping'] == null
      ? null
      : ShippingRequest.fromJson(json['shipping'] as Map<String, dynamic>),
);

Map<String, dynamic> _$UpdateCustomerRequestToJson(
  UpdateCustomerRequest instance,
) => <String, dynamic>{
  'address': ?instance.address?.toJson(),
  'description': ?instance.description,
  'email': ?instance.email,
  'metadata': ?instance.metadata,
  'name': ?instance.name,
  'payment_method': ?instance.paymentMethod,
  'phone_number': ?instance.phoneNumber,
  'invoice_settings': ?instance.invoiceSettings?.toJson(),
  'shipping': ?instance.shipping?.toJson(),
  'id': instance.id,
};

UpdateCustomerBalanceTransactionRequest
_$UpdateCustomerBalanceTransactionRequestFromJson(Map<String, dynamic> json) =>
    UpdateCustomerBalanceTransactionRequest(
      description: json['description'] as String?,
      metadata: json['metadata'] as Map<String, dynamic>?,
    );

Map<String, dynamic> _$UpdateCustomerBalanceTransactionRequestToJson(
  UpdateCustomerBalanceTransactionRequest instance,
) => <String, dynamic>{
  'description': ?instance.description,
  'metadata': ?instance.metadata,
};

UpdatePaymentIntentRequest _$UpdatePaymentIntentRequestFromJson(
  Map<String, dynamic> json,
) => UpdatePaymentIntentRequest(
  amount: (json['amount'] as num?)?.toInt(),
  currency: json['currency'] as String?,
  customer: json['customer'] as String?,
  description: json['description'] as String?,
  metadata: json['metadata'] as Map<String, dynamic>?,
  paymentMethod: json['payment_method'] as String?,
  receiptEmail: json['receipt_email'] as String?,
  setupFutureUsage: $enumDecodeNullable(
    _$SetupFutureUsageEnumMap,
    json['setup_future_usage'],
  ),
  statementDescriptor: json['statement_descriptor'] as String?,
  statementDescriptorSuffix: json['statement_descriptor_suffix'] as String?,
  paymentMethodConfiguration: json['payment_method_configuration'] as String?,
);

Map<String, dynamic> _$UpdatePaymentIntentRequestToJson(
  UpdatePaymentIntentRequest instance,
) => <String, dynamic>{
  'amount': ?instance.amount,
  'currency': ?instance.currency,
  'customer': ?instance.customer,
  'description': ?instance.description,
  'metadata': ?instance.metadata,
  'payment_method': ?instance.paymentMethod,
  'receipt_email': ?instance.receiptEmail,
  'setup_future_usage': ?_$SetupFutureUsageEnumMap[instance.setupFutureUsage],
  'statement_descriptor': ?instance.statementDescriptor,
  'statement_descriptor_suffix': ?instance.statementDescriptorSuffix,
  'payment_method_configuration': ?instance.paymentMethodConfiguration,
};

SubscriptionUpdate _$SubscriptionUpdateFromJson(Map<String, dynamic> json) =>
    SubscriptionUpdate(
      cancelAtPeriodEnd: json['cancel_at_period_end'] as bool?,
    );

Map<String, dynamic> _$SubscriptionUpdateToJson(SubscriptionUpdate instance) =>
    <String, dynamic>{'cancel_at_period_end': ?instance.cancelAtPeriodEnd};

SubscriptionItemUpdate _$SubscriptionItemUpdateFromJson(
  Map<String, dynamic> json,
) => SubscriptionItemUpdate(
  paymentBehavior: $enumDecodeNullable(
    _$PaymentBehaviorEnumMap,
    json['payment_behavior'],
  ),
  metadata: (json['metadata'] as Map<String, dynamic>?)?.map(
    (k, e) => MapEntry(k, e as String),
  ),
  price: json['price'] as String?,
  prorationBehavior: $enumDecodeNullable(
    _$ProrationBehaviorEnumMap,
    json['proration_behavior'],
  ),
  quantity: (json['quantity'] as num?)?.toInt(),
  billingThresholds: json['billing_thresholds'] as Map<String, dynamic>?,
  offSession: json['off_session'] as bool?,
  priceData: json['price_data'] as Map<String, dynamic>?,
  prorationDate: json['proration_date'] == null
      ? null
      : DateTime.parse(json['proration_date'] as String),
  taxRates: (json['tax_rates'] as List<dynamic>?)
      ?.map((e) => e as String)
      .toList(),
);

Map<String, dynamic> _$SubscriptionItemUpdateToJson(
  SubscriptionItemUpdate instance,
) => <String, dynamic>{
  'metadata': ?instance.metadata,
  'payment_behavior': ?_$PaymentBehaviorEnumMap[instance.paymentBehavior],
  'price': ?instance.price,
  'proration_behavior': ?_$ProrationBehaviorEnumMap[instance.prorationBehavior],
  'quantity': ?instance.quantity,
  'billing_thresholds': ?instance.billingThresholds,
  'off_session': ?instance.offSession,
  'price_data': ?instance.priceData,
  'proration_date': ?instance.prorationDate?.toIso8601String(),
  'tax_rates': ?instance.taxRates,
};

UpdateSubscriptionScheduleRequest _$UpdateSubscriptionScheduleRequestFromJson(
  Map<String, dynamic> json,
) => UpdateSubscriptionScheduleRequest(
  phases: (json['phases'] as List<dynamic>)
      .map(
        (e) =>
            UpdateSubscriptionSchedulePhase.fromJson(e as Map<String, dynamic>),
      )
      .toList(),
  endBehavior: $enumDecodeNullable(
    _$SubscriptionScheduleEndBehaviorEnumMap,
    json['end_behavior'],
  ),
);

Map<String, dynamic> _$UpdateSubscriptionScheduleRequestToJson(
  UpdateSubscriptionScheduleRequest instance,
) => <String, dynamic>{
  'phases': instance.phases.map((e) => e.toJson()).toList(),
  'end_behavior':
      ?_$SubscriptionScheduleEndBehaviorEnumMap[instance.endBehavior],
};

const _$SubscriptionScheduleEndBehaviorEnumMap = {
  SubscriptionScheduleEndBehavior.release: 'release',
  SubscriptionScheduleEndBehavior.cancel: 'cancel',
};

UpdateSubscriptionSchedulePhase _$UpdateSubscriptionSchedulePhaseFromJson(
  Map<String, dynamic> json,
) => UpdateSubscriptionSchedulePhase(
  startDate: _$JsonConverterFromJson<int, DateTime>(
    json['start_date'],
    const TimestampConverter().fromJson,
  ),
  endDate: _$JsonConverterFromJson<int, DateTime>(
    json['end_date'],
    const TimestampConverter().fromJson,
  ),
  items: (json['items'] as List<dynamic>)
      .map(
        (e) => UpdateSubscriptionSchedulePhaseItem.fromJson(
          e as Map<String, dynamic>,
        ),
      )
      .toList(),
);

Map<String, dynamic> _$UpdateSubscriptionSchedulePhaseToJson(
  UpdateSubscriptionSchedulePhase instance,
) => <String, dynamic>{
  'start_date': ?_$JsonConverterToJson<int, DateTime>(
    instance.startDate,
    const TimestampConverter().toJson,
  ),
  'end_date': ?_$JsonConverterToJson<int, DateTime>(
    instance.endDate,
    const TimestampConverter().toJson,
  ),
  'items': instance.items.map((e) => e.toJson()).toList(),
};

UpdateSubscriptionSchedulePhaseItem
_$UpdateSubscriptionSchedulePhaseItemFromJson(Map<String, dynamic> json) =>
    UpdateSubscriptionSchedulePhaseItem(
      price: json['price'] as String,
      quantity: (json['quantity'] as num).toInt(),
    );

Map<String, dynamic> _$UpdateSubscriptionSchedulePhaseItemToJson(
  UpdateSubscriptionSchedulePhaseItem instance,
) => <String, dynamic>{'price': instance.price, 'quantity': instance.quantity};

ShippingSpecification _$ShippingSpecificationFromJson(
  Map<String, dynamic> json,
) => ShippingSpecification(
  address: Address.fromJson(json['address'] as Map<String, dynamic>),
  name: json['name'] as String,
  carrier: json['carrier'] as String?,
  phone: json['phone'] as String?,
  trackingNumber: json['tracking_number'] as String?,
);

Map<String, dynamic> _$ShippingSpecificationToJson(
  ShippingSpecification instance,
) => <String, dynamic>{
  'address': instance.address.toJson(),
  'name': instance.name,
  'carrier': ?instance.carrier,
  'phone': ?instance.phone,
  'tracking_number': ?instance.trackingNumber,
};

Source _$SourceFromJson(Map<String, dynamic> json) => Source(
  id: json['id'] as String,
  object: json['object'] as String,
  amount: (json['amount'] as num?)?.toInt(),
  created: const TimestampConverter().fromJson(
    (json['created'] as num).toInt(),
  ),
  currency: json['currency'] as String?,
  customer: json['customer'] as String?,
  flow: json['flow'] as String?,
  livemode: json['livemode'] as bool,
  statementDescriptor: json['statement_descriptor'] as String?,
  status: json['status'] as String,
  type: $enumDecode(_$SourceTypeEnumMap, json['type']),
  usage: json['usage'] as String,
);

Map<String, dynamic> _$SourceToJson(Source instance) => <String, dynamic>{
  'id': instance.id,
  'object': instance.object,
  'amount': ?instance.amount,
  'created': const TimestampConverter().toJson(instance.created),
  'currency': ?instance.currency,
  'customer': ?instance.customer,
  'flow': ?instance.flow,
  'livemode': instance.livemode,
  'statement_descriptor': ?instance.statementDescriptor,
  'status': instance.status,
  'type': _$SourceTypeEnumMap[instance.type]!,
  'usage': instance.usage,
};

const _$SourceTypeEnumMap = {
  SourceType.achCreditTransfer: 'ach_credit_transfer',
  SourceType.achDebit: 'ach_debit',
  SourceType.alipay: 'alipay',
  SourceType.bancontact: 'bancontact',
  SourceType.card: 'card',
  SourceType.cardPresent: 'card_present',
  SourceType.eps: 'eps',
  SourceType.giropay: 'giropay',
  SourceType.ideal: 'ideal',
  SourceType.multibanco: 'multibanco',
  SourceType.klarna: 'klarna',
  SourceType.p24: 'p24',
  SourceType.sepaDebit: 'sepa_debit',
  SourceType.sofort: 'sofort',
  SourceType.threeDSecure: 'three_d_secure',
  SourceType.wechat: 'wechat',
};

StripeApiError _$StripeApiErrorFromJson(Map<String, dynamic> json) =>
    StripeApiError(
      type: $enumDecode(_$StripeApiErrorTypeEnumMap, json['type']),
      code: json['code'] as String?,
      declineCode: json['decline_code'] as String?,
      message: json['message'] as String?,
      param: json['param'] as String?,
      paymentIntent: json['payment_intent'] == null
          ? null
          : PaymentIntent.fromJson(
              json['payment_intent'] as Map<String, dynamic>,
            ),
    );

Map<String, dynamic> _$StripeApiErrorToJson(StripeApiError instance) =>
    <String, dynamic>{
      'type': _$StripeApiErrorTypeEnumMap[instance.type]!,
      'code': ?instance.code,
      'decline_code': ?instance.declineCode,
      'message': ?instance.message,
      'param': ?instance.param,
      'payment_intent': ?instance.paymentIntent?.toJson(),
    };

const _$StripeApiErrorTypeEnumMap = {
  StripeApiErrorType.apiError: 'api_error',
  StripeApiErrorType.cardError: 'card_error',
  StripeApiErrorType.idempotencyError: 'idempotency_error',
  StripeApiErrorType.invalidRequestError: 'invalid_request_error',
};

Subscription _$SubscriptionFromJson(Map<String, dynamic> json) => Subscription(
  object: $enumDecode(_$_SubscriptionObjectEnumMap, json['object']),
  id: json['id'] as String,
  created: (json['created'] as num).toInt(),
  customer: json['customer'] as String,
  status: $enumDecode(_$SubscriptionStatusEnumMap, json['status']),
  items: DataList<SubscriptionItem>.fromJson(
    json['items'] as Map<String, dynamic>,
    (value) => SubscriptionItem.fromJson(value as Map<String, dynamic>),
  ),
  currentPeriodStart: const TimestampConverter().fromJson(
    (json['current_period_start'] as num).toInt(),
  ),
  currentPeriodEnd: const TimestampConverter().fromJson(
    (json['current_period_end'] as num).toInt(),
  ),
  startDate: const TimestampConverter().fromJson(
    (json['start_date'] as num).toInt(),
  ),
  billingCycleAnchor: const TimestampConverter().fromJson(
    (json['billing_cycle_anchor'] as num).toInt(),
  ),
  cancelAt: _$JsonConverterFromJson<int, DateTime>(
    json['cancel_at'],
    const TimestampConverter().fromJson,
  ),
  cancelAtPeriodEnd: json['cancel_at_period_end'] as bool? ?? false,
  endedAt: _$JsonConverterFromJson<int, DateTime>(
    json['ended_at'],
    const TimestampConverter().fromJson,
  ),
  metadata: json['metadata'] as Map<String, dynamic>?,
  latestInvoice: json['latest_invoice'] as String?,
  discounts: (json['discounts'] as List<dynamic>?)
      ?.map((e) => e as String)
      .toList(),
  pauseCollection: json['pause_collection'] == null
      ? null
      : PauseCollection.fromJson(
          json['pause_collection'] as Map<String, dynamic>,
        ),
  defaultPaymentMethod: json['default_payment_method'] as String?,
  defaultSource: json['default_source'] as String?,
);

Map<String, dynamic> _$SubscriptionToJson(Subscription instance) =>
    <String, dynamic>{
      'object': _$_SubscriptionObjectEnumMap[instance.object]!,
      'id': instance.id,
      'created': instance.created,
      'customer': instance.customer,
      'current_period_start': const TimestampConverter().toJson(
        instance.currentPeriodStart,
      ),
      'current_period_end': const TimestampConverter().toJson(
        instance.currentPeriodEnd,
      ),
      'start_date': const TimestampConverter().toJson(instance.startDate),
      'billing_cycle_anchor': const TimestampConverter().toJson(
        instance.billingCycleAnchor,
      ),
      'cancel_at': ?_$JsonConverterToJson<int, DateTime>(
        instance.cancelAt,
        const TimestampConverter().toJson,
      ),
      'cancel_at_period_end': instance.cancelAtPeriodEnd,
      'ended_at': ?_$JsonConverterToJson<int, DateTime>(
        instance.endedAt,
        const TimestampConverter().toJson,
      ),
      'status': _$SubscriptionStatusEnumMap[instance.status]!,
      'items': instance.items.toJson((value) => value.toJson()),
      'metadata': ?instance.metadata,
      'latest_invoice': ?instance.latestInvoice,
      'discounts': ?instance.discounts,
      'pause_collection': ?instance.pauseCollection?.toJson(),
      'default_payment_method': ?instance.defaultPaymentMethod,
      'default_source': ?instance.defaultSource,
    };

const _$_SubscriptionObjectEnumMap = {
  _SubscriptionObject.subscription: 'subscription',
};

SubscriptionItem _$SubscriptionItemFromJson(Map<String, dynamic> json) =>
    SubscriptionItem(
      object: $enumDecode(_$_SubscriptionItemObjectEnumMap, json['object']),
      id: json['id'] as String,
      price: Price.fromJson(json['price'] as Map<String, dynamic>),
      subscription: json['subscription'] as String,
      quantity: (json['quantity'] as num).toInt(),
    );

Map<String, dynamic> _$SubscriptionItemToJson(SubscriptionItem instance) =>
    <String, dynamic>{
      'object': _$_SubscriptionItemObjectEnumMap[instance.object]!,
      'id': instance.id,
      'price': instance.price.toJson(),
      'subscription': instance.subscription,
      'quantity': instance.quantity,
    };

const _$_SubscriptionItemObjectEnumMap = {
  _SubscriptionItemObject.subscription_item: 'subscription_item',
};

SubscriptionSchedule _$SubscriptionScheduleFromJson(
  Map<String, dynamic> json,
) => SubscriptionSchedule(
  object: $enumDecode(_$_SubscriptionScheduleObjectEnumMap, json['object']),
  id: json['id'] as String,
  customer: json['customer'] as String?,
  metadata: json['metadata'] as Map<String, dynamic>?,
  phases: (json['phases'] as List<dynamic>)
      .map((e) => SubscriptionSchedulePhase.fromJson(e as Map<String, dynamic>))
      .toList(),
  status: $enumDecode(_$SubscriptionScheduleStatusEnumMap, json['status']),
  subscription: json['subscription'] as String?,
);

Map<String, dynamic> _$SubscriptionScheduleToJson(
  SubscriptionSchedule instance,
) => <String, dynamic>{
  'object': _$_SubscriptionScheduleObjectEnumMap[instance.object]!,
  'id': instance.id,
  'customer': ?instance.customer,
  'metadata': ?instance.metadata,
  'phases': instance.phases.map((e) => e.toJson()).toList(),
  'status': _$SubscriptionScheduleStatusEnumMap[instance.status]!,
  'subscription': ?instance.subscription,
};

const _$_SubscriptionScheduleObjectEnumMap = {
  _SubscriptionScheduleObject.subscriptionSchedule: 'subscription_schedule',
};

const _$SubscriptionScheduleStatusEnumMap = {
  SubscriptionScheduleStatus.notStarted: 'not_started',
  SubscriptionScheduleStatus.active: 'active',
  SubscriptionScheduleStatus.completed: 'completed',
  SubscriptionScheduleStatus.released: 'released',
  SubscriptionScheduleStatus.canceled: 'canceled',
};

SubscriptionSchedulePhase _$SubscriptionSchedulePhaseFromJson(
  Map<String, dynamic> json,
) => SubscriptionSchedulePhase(
  startDate: _$JsonConverterFromJson<int, DateTime>(
    json['start_date'],
    const TimestampConverter().fromJson,
  ),
  endDate: _$JsonConverterFromJson<int, DateTime>(
    json['end_date'],
    const TimestampConverter().fromJson,
  ),
  items: (json['items'] as List<dynamic>)
      .map(
        (e) =>
            SubscriptionSchedulePhaseItem.fromJson(e as Map<String, dynamic>),
      )
      .toList(),
);

Map<String, dynamic> _$SubscriptionSchedulePhaseToJson(
  SubscriptionSchedulePhase instance,
) => <String, dynamic>{
  'start_date': ?_$JsonConverterToJson<int, DateTime>(
    instance.startDate,
    const TimestampConverter().toJson,
  ),
  'end_date': ?_$JsonConverterToJson<int, DateTime>(
    instance.endDate,
    const TimestampConverter().toJson,
  ),
  'items': instance.items.map((e) => e.toJson()).toList(),
};

SubscriptionSchedulePhaseItem _$SubscriptionSchedulePhaseItemFromJson(
  Map<String, dynamic> json,
) => SubscriptionSchedulePhaseItem(
  price: json['price'] as String,
  quantity: (json['quantity'] as num).toInt(),
);

Map<String, dynamic> _$SubscriptionSchedulePhaseItemToJson(
  SubscriptionSchedulePhaseItem instance,
) => <String, dynamic>{'price': instance.price, 'quantity': instance.quantity};
