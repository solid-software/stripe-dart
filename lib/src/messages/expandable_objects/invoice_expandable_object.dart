import 'package:stripe/messages.dart';
import 'package:stripe/src/messages/expandable_objects/discount_expandable_object.dart';
import 'package:stripe/src/messages/expandable_objects/expandable_object.dart';
import 'package:stripe/src/messages/expandable_objects/payment_intent_expandable_object.dart';

class InvoiceExpandableObject extends ExpandableObject<Invoice> {
  final PaymentIntentExpandableObject? paymentIntent;
  final DiscountExpandableObject? discounts;

  @override
  Map<String, ExpandableObject?> get expandableFields => {
        'payment_intent': paymentIntent,
        'discounts': discounts,
      };

  const InvoiceExpandableObject({
    this.paymentIntent,
    this.discounts,
  });
}
