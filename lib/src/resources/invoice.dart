import 'dart:async';

import 'package:stripe/messages.dart';
import 'package:stripe/src/expanded.dart';
import 'package:stripe/src/utils/expandable_fields/invoice_expandable_field.dart';

import '../client.dart';
import '_resource.dart';

class InvoiceResource extends Resource<Invoice> {
  static const _resourceName = 'invoices';

  InvoiceResource(Client client) : super(client);

  Future<Invoice> createPreview(CreatePreviewInvoiceRequest request) async {
    final response =
        await post('$_resourceName/create_preview', data: request.toJson());

    return Invoice.fromJson(response);
  }

  Future<InvoiceExpanded> createPreviewExpanded(
    CreatePreviewInvoiceRequest request, {
    required InvoiceExpandableField expand,
  }) async {
    final response = await post(
      '$_resourceName/create_preview',
      data: {
        ...request.toJson(),
        'expand': expand.nestedFields.toList(),
      },
    );

    return InvoiceExpanded.fromJson(response, expand: expand);
  }
}
