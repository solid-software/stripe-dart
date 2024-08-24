import 'package:stripe/src/utils/expandable_fields/discounts_expandable_field.dart';
import 'package:stripe/src/utils/expandable_fields/invoice_expandable_field.dart';
import 'package:stripe/src/utils/expandable_fields/payment_intent_expandable_field.dart';

class LatestInvoiceExpandableField extends InvoiceExpandableField {
  @override
  String get field => 'latest_invoice';

  const LatestInvoiceExpandableField({
    PaymentIntentExpandableField? paymentIntentExpansion,
    DiscountsExpandableField? discountsExpansion,
  }) : super(
          paymentIntentExpansion: paymentIntentExpansion,
          discountsExpansion: discountsExpansion,
        );
}
