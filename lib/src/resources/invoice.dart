import 'dart:async';

import 'package:stripe/messages.dart';
import 'package:stripe/src/messages/expandable_objects/invoice_expandable_object.dart';

import '../client.dart';
import '_resource.dart';

class InvoiceResource extends Resource<Invoice> {
  static const _resourceName = 'invoices';

  InvoiceResource(Client client) : super(client);

  Future<Invoice> createPreview(
    CreatePreviewInvoiceRequest request, {
    InvoiceExpandableObject? expand,
  }) async {
    final response = await post(
      '$_resourceName/create_preview',
      data: {
        ...request.toJson(),
        if (expand != null) 'expand': expand.expandQuery(),
      },
    );

    return Invoice.fromJson(response);
  }
}
