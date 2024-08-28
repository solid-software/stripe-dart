import 'package:json_annotation/json_annotation.dart';

@Deprecated('''Stripe doesn't recommend using the deprecated Sources API.
We recommend that you adopt the PaymentMethods API.
This newer API provides access to our latest features and payment method types.
''')
enum SourceType {
  @JsonValue('ach_credit_transfer')
  achCreditTransfer,
  @JsonValue('ach_debit')
  achDebit,
  @JsonValue('alipay')
  alipay,
  @JsonValue('bancontact')
  bancontact,
  @JsonValue('card')
  card,
  @JsonValue('card_present')
  cardPresent,
  @JsonValue('eps')
  eps,
  @JsonValue('giropay')
  giropay,
  @JsonValue('ideal')
  ideal,
  @JsonValue('multibanco')
  multibanco,
  @JsonValue('klarna')
  klarna,
  @JsonValue('p24')
  p24,
  @JsonValue('sepa_debit')
  sepaDebit,
  @JsonValue('sofort')
  sofort,
  @JsonValue('three_d_secure')
  threeDSecure,
  @JsonValue('wechat')
  wechat,
}
