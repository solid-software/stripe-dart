import 'package:stripe/messages.dart';
import 'package:stripe/src/utils/expandable_object_field.dart';

class InvoiceConfirmationSecretExpandableField
    extends ExpandableObjectField<InvoiceConfirmationSecret, void> {
  @override
  String get field => 'confirmation_secret';

  const InvoiceConfirmationSecretExpandableField();

  @override
  InvoiceConfirmationSecret parse(Map<String, dynamic> object) {
    return InvoiceConfirmationSecret.fromJson(object);
  }

  @override
  void replacement(InvoiceConfirmationSecret parsedValue) {}
}
