import 'package:stripe/src/expanded.dart';
import 'package:stripe/src/utils/expandable_fields/discounts_expandable_field.dart';
import 'package:stripe/src/utils/expandable_fields/payment_intent_expandable_field.dart';
import 'package:stripe/src/utils/expandable_object_field.dart';

class InvoiceExpandableField extends ExpandableObjectField<InvoiceExpanded> {
  final PaymentIntentExpandableField? paymentIntentExpansion;
  final DiscountsExpandableField? discountsExpansion;

  @override
  String get field => 'invoice';

  @override
  Iterable<String> get nestedFields => [
        ...?paymentIntentExpansion?.nestedFieldPaths,
        ...?discountsExpansion?.nestedFieldPaths,
      ].nonNulls;

  const InvoiceExpandableField({
    this.paymentIntentExpansion,
    this.discountsExpansion,
  });

  @override
  InvoiceExpanded parse(Map<String, dynamic> object) {
    return InvoiceExpanded.fromJson(
      object,
      expand: this,
    );
  }

  @override
  String replacement(InvoiceExpanded parsedValue) {
    return parsedValue.invoice.id;
  }
}
