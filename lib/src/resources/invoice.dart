import 'dart:async';

import 'package:stripe/messages.dart';
import 'package:stripe/src/expanded.dart';
import 'package:stripe/src/utils/expandable_field.dart';
import 'package:stripe/src/utils/expandable_fields/discounts_expandable_field.dart';
import 'package:stripe/src/utils/expandable_fields/invoice_confirmation_secret_expandable_field.dart';
import 'package:stripe/src/utils/expandable_fields/payment_intent_expandable_field.dart';

import '../client.dart';
import '_resource.dart';

class InvoiceResource extends Resource<Invoice> {
  static const _resourceName = 'invoices';

  InvoiceResource(Client client) : super(client);

  Future<Invoice> create(CreateInvoiceRequest request) async {
    final response = await post(
      _resourceName,
      data: request.toJson(),
    );

    return Invoice.fromJson(response);
  }

  Future<InvoiceExpanded> createExpanded(
    CreateInvoiceRequest request, {
    required Set<InvoiceExpandableField> expand,
  }) async {
    final expandableFields = _expandableFields(expand);
    final response = await post(
      _resourceName,
      data: {
        ...request.toJson(),
        'expand': expandableFields.map((e) => e.field).toList(),
      },
    );

    return InvoiceExpanded.fromJson(response, expand);
  }

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

  Future<InvoiceExpanded> retrieveExpanded(
    String id, {
    required Set<InvoiceExpandableField> expand,
  }) async {
    final expandableFields = _expandableFields(expand);
    final response = await get(
      '$_resourceName/$id',
      queryParameters: {
        'expand': expandableFields.map((e) => e.field).toList(),
      },
    );

    return InvoiceExpanded.fromJson(response, expand);
  }

  /// You can list all invoices, or list the invoices for a specific customer.
  /// The invoices are returned sorted by creation date, with the most recently
  /// created invoices appearing first.
  Future<DataList<Invoice>> list([
    ListInvoicesRequest? request,
  ]) async {
    final map = await get(
      _resourceName,
      queryParameters: request?.toJson(),
    );

    return DataList<Invoice>.fromJson(
      map,
      (value) => Invoice.fromJson(value as Map<String, dynamic>),
    );
  }

  /// You can list all invoices, or list the invoices for a specific customer.
  /// The invoices are returned sorted by creation date, with the most recently
  /// created invoices appearing first.
  Future<DataList<InvoiceExpanded>> listExpanded({
    required Set<InvoiceExpandableField> expand,
    ListInvoicesRequest? request,
  }) async {
    final map = await get(
      _resourceName,
      queryParameters: {
        ...?request?.toJson(),
        'expand': _expandableFields(expand).map((e) => 'data.$e').toList(),
      },
    );

    return DataList<InvoiceExpanded>.fromJson(
      map,
      (value) =>
          InvoiceExpanded.fromJson(value as Map<String, dynamic>, expand),
    );
  }

  Future<Invoice> voidInvoice(String invoiceId) async {
    final response = await post('$_resourceName/$invoiceId/void');

    return Invoice.fromJson(response);
  }

  Future<Invoice> finalizeInvoice(String invoiceId) async {
    final response = await post('$_resourceName/$invoiceId/finalize');

    return Invoice.fromJson(response);
  }

  Future<InvoiceExpanded> finalizeInvoiceExpanded(
    String invoiceId, {
    required Set<InvoiceExpandableField> expand,
  }) async {
    final expandableFields = _expandableFields(expand);
    final response = await post(
      '$_resourceName/$invoiceId/finalize',
      data: {
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
      case InvoiceExpandableField.confirmationSecret:
        return InvoiceConfirmationSecretExpandableField();
    }
  }
}
