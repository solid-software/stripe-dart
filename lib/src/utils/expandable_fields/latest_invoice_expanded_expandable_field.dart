import 'package:stripe/src/expanded.dart';
import 'package:stripe/src/messages/enums/expandable_fields/invoice_expandable_field.dart';
import 'package:stripe/src/utils/expandable_object_field.dart';

class LatestInvoiceExpandedExpandableField
    extends ExpandableObjectField<InvoiceExpanded> {
  final Set<InvoiceExpandableField> expand;

  @override
  String get field => 'latest_invoice';

  const LatestInvoiceExpandedExpandableField({
    required this.expand,
  });

  @override
  InvoiceExpanded parse(Map<String, dynamic> object) {
    return InvoiceExpanded.fromJson(object, expand);
  }

  @override
  String replacement(InvoiceExpanded parsedValue) {
    return parsedValue.invoice.id;
  }
}
