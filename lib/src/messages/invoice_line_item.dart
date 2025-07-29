part of '../../messages.dart';

enum _InvoiceLineItemObject {
  @JsonValue('line_item')
  lineItem,
}

@JsonSerializable()
class InvoiceLineItem extends Message {
  final _InvoiceLineItemObject object;

  final String id;

  final int amount;

  final String currency;

  final String? description;

  final String? invoice;

  final Map<String, dynamic>? metadata;

  final InvoiceLineItemPeriod? period;

  final Price? price;

  final int? quantity;

  const InvoiceLineItem({
    required this.object,
    required this.id,
    required this.amount,
    required this.currency,
    this.description,
    this.invoice,
    this.metadata,
    this.period,
    this.price,
    this.quantity,
  });

  factory InvoiceLineItem.fromJson(Map<String, dynamic> json) =>
      _$InvoiceLineItemFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$InvoiceLineItemToJson(this);
}

@JsonSerializable()
class InvoiceLineItemPeriod extends Message {
  @TimestampConverter()
  final DateTime start;

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
