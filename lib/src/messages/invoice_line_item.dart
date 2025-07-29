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

  final int? quantity;

  const InvoiceLineItem({
    required this.object,
    required this.id,
    required this.amount,
    required this.currency,
    this.description,
    this.invoice,
    this.metadata,
    this.quantity,
  });

  factory InvoiceLineItem.fromJson(Map<String, dynamic> json) =>
      _$InvoiceLineItemFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$InvoiceLineItemToJson(this);
}
