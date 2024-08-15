import 'dart:async';

import 'package:stripe/messages.dart';

import '../client.dart';
import '_resource.dart';

class InvoiceResource extends Resource<Invoice> {
  static const _resourceName = 'invoices';

  InvoiceResource(Client client) : super(client);

  Future<Invoice> createPreview(CreatePreviewInvoiceRequest request) async {
    final response =
        await post('$_resourceName/preview', data: request.toJson());

    return Invoice.fromJson(response);
  }
}
