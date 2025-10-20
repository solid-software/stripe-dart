part of '../../messages.dart';

enum _InvoiceItemObject {
  @JsonValue('invoiceitem')
  invoiceItem,
}

/// https://docs.stripe.com/api/invoiceitems/object
@JsonSerializable()
class InvoiceItem extends Message {
  final _InvoiceItemObject object;

  /// Unique identifier for the object.
  final String id;

  const InvoiceItem({
    required this.object,
    required this.id,
  });

  factory InvoiceItem.fromJson(Map<String, dynamic> json) =>
      _$InvoiceItemFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$InvoiceItemToJson(this);
}
