import 'package:stripe/messages.dart';
import 'package:stripe/src/messages/expandable_objects/expandable_object.dart';
import 'package:stripe/src/messages/expandable_objects/invoice_expandable_object.dart';

class SubscriptionExpandableObject extends ExpandableObject<Subscription> {
  final InvoiceExpandableObject? latestInvoice;

  @override
  Map<String, ExpandableObject?> get expandableFields => {
        'latest_invoice': latestInvoice,
      };

  const SubscriptionExpandableObject({
    this.latestInvoice,
  });
}
