import 'package:stripe/src/resources/_resource.dart';

import '../../stripe.dart';

class InvoiceItemResource extends Resource<InvoiceItem> {
  static const _resourceName = 'invoice_items';

  InvoiceItemResource(Client client) : super(client);

  Future<InvoiceItem> create(CreateInvoiceItemRequest request) async {
    final response = await post(
      _resourceName,
      data: request.toJson(),
    );

    return InvoiceItem.fromJson(response);
  }
}
