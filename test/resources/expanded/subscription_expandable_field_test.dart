import 'package:stripe/src/utils/expandable_fields/customer_expandable_field.dart';
import 'package:stripe/src/utils/expandable_fields/discounts_expandable_field.dart';
import 'package:stripe/src/utils/expandable_fields/latest_invoice_expandable_field.dart';
import 'package:stripe/src/utils/expandable_fields/payment_intent_expandable_field.dart';
import 'package:stripe/src/utils/expandable_fields/subscription_expandable_field.dart';
import 'package:test/test.dart';

void main() {
  group('SubscriptionExpandableField', () {
    const expansionSpec = SubscriptionExpandableField(
      customerExpansion: CustomerExpandableField(),
      discountsExpansion: DiscountsExpandableField(),
      latestInvoiceExpansion: LatestInvoiceExpandableField(
        discountsExpansion: DiscountsExpandableField(),
        paymentIntentExpansion: PaymentIntentExpandableField(),
      ),
    );
    test('Provides own expansion parameters correctly', () async {
      expect(
          expansionSpec.nestedFields.toSet(),
          containsAll({
            'subscription.latest_invoice.payment_intent',
            'subscription.latest_invoice.discounts',
            'subscription.customer',
            'subscription.discounts',
          }));
    });
    test('Provides nested expansion parameters correctly', () async {
      expect(
          expansionSpec.innerNestedFields.toSet(),
          containsAll({
            'latest_invoice.payment_intent',
            'latest_invoice.discounts',
            'customer',
            'discounts',
          }));
    });
  });
}
