import 'dart:async';

import 'package:stripe/messages.dart';
import 'package:stripe/src/expanded.dart';
import 'package:stripe/src/utils/expandable_field.dart';
import 'package:stripe/src/utils/expandable_fields/discounts_expandable_field.dart';
import 'package:stripe/src/utils/expandable_fields/payment_intent_expandable_field.dart';

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
    required Set<InvoiceExpandableField> expand,
  }) async {
    final expandableFields = _expandableFields(expand);
    final response = await post(
      '$_resourceName/create_preview',
      data: {
        ...request.toJson(),
        'expand': expandableFields.map((e) => e.field).toList(),
      },
    );

    return InvoiceExpanded.fromJson(response, expand);
  }

  Iterable<ExpandableField> _expandableFields(
    Set<InvoiceExpandableField> fields,
  ) {
    return fields.map(
      (field) => _expandableField(field),
    );
  }

  ExpandableField _expandableField(
    InvoiceExpandableField field,
  ) {
    switch (field) {
      case InvoiceExpandableField.paymentIntent:
        return PaymentIntentExpandableField();
      case InvoiceExpandableField.discounts:
        return DiscountsExpandableField();
    }
  }
}
