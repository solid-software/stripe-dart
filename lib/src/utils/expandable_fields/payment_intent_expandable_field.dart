import 'package:stripe/messages.dart';
import 'package:stripe/src/utils/expandable_object_field.dart';

class PaymentIntentExpandableField
    extends ExpandableObjectField<PaymentIntent> {
  @override
  String get field => 'payment_intent';

  const PaymentIntentExpandableField();

  @override
  PaymentIntent parse(Map<String, dynamic> object) {
    return PaymentIntent.fromJson(object);
  }

  @override
  String replacement(PaymentIntent parsedValue) {
    return parsedValue.id;
  }
}
