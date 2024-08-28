part of '../../messages.dart';

/// Source objects allow you to accept a variety of payment methods.
/// They represent a customer’s payment instrument,
/// and can be used with the Stripe API just like a Card object:
/// once chargeable, they can be charged, or can be attached to customers.
@Deprecated('''Stripe doesn't recommend using the deprecated Sources API.
We recommend that you adopt the PaymentMethods API. 
This newer API provides access to our latest features and payment method types.
''')
@JsonSerializable()
class Source extends Message {
  final String id;
  final String object;
  final int? amount;

  @TimestampConverter()
  final DateTime created;
  final String? currency;
  final String? customer;
  final String? flow;
  final bool livemode;
  final String? statementDescriptor;
  final String status;
  final SourceType type;
  final String usage;

  const Source({
    required this.id,
    required this.object,
    required this.amount,
    required this.created,
    required this.currency,
    required this.customer,
    required this.flow,
    required this.livemode,
    required this.statementDescriptor,
    required this.status,
    required this.type,
    required this.usage,
  });

  factory Source.fromJson(Map<String, dynamic> json) => _$SourceFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$SourceToJson(this);
}
