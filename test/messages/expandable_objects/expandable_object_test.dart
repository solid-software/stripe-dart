import 'package:stripe/src/messages/expandable_objects/discount_expandable_object.dart';
import 'package:stripe/src/messages/expandable_objects/invoice_expandable_object.dart';
import 'package:stripe/src/messages/expandable_objects/payment_intent_expandable_object.dart';
import 'package:stripe/src/messages/expandable_objects/subscription_expandable_object.dart';
import 'package:test/test.dart';

void main() {
  group('ExpandableObject.expandQuery', () {
    test('returns null if there are no expanded fields', () {
      final object = SubscriptionExpandableObject();
      expect(object.expandQuery(), isNull);
    });

    test('returns 1 level of nested expanded fields', () {
      final object = SubscriptionExpandableObject(
        latestInvoice: InvoiceExpandableObject(),
      );
      expect(object.expandQuery(), ['latest_invoice']);
    });

    test('returns multiple levels of nested expanded fields', () {
      final object = SubscriptionExpandableObject(
        latestInvoice: InvoiceExpandableObject(
          paymentIntent: PaymentIntentExpandableObject(),
          discounts: DiscountExpandableObject(),
        ),
      );
      expect(
        object.expandQuery(),
        [
          'latest_invoice.payment_intent',
          'latest_invoice.discounts',
        ],
      );
    });
  });
}
