import 'package:stripe/messages.dart';
import 'package:stripe/src/utils/expandable_object_field.dart';

class DefaultPaymentMethodExpandableField
    extends ExpandableObjectField<PaymentMethod> {
  @override
  String get field => 'default_payment_method';

  const DefaultPaymentMethodExpandableField();

  @override
  PaymentMethod parse(Map<String, dynamic> object) {
    return PaymentMethod.fromJson(object);
  }

  @override
  String replacement(PaymentMethod parsedValue) {
    return parsedValue.id;
  }
}
