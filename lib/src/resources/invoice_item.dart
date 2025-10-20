import 'package:stripe/src/resources/_resource.dart';

import '../../stripe.dart';

/// https://docs.stripe.com/api/invoiceitems
class InvoiceItemResource extends Resource<InvoiceItem> {
  static const _resourceName = 'invoiceitems';

  InvoiceItemResource(Client client) : super(client);

  /// Creates an item to be added to a draft invoice (up to 250 items per
  /// invoice). If no invoice is specified, the item will be on the next invoice
  /// created for the customer specified.
  Future<InvoiceItem> create(CreateInvoiceItemRequest request) async {
    final response = await post(
      _resourceName,
      data: request.toJson(),
    );

    return InvoiceItem.fromJson(response);
  }
}
