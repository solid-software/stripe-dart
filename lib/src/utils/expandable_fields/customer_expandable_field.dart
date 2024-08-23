import 'package:stripe/messages.dart';
import 'package:stripe/src/expanded/customer_expanded.dart';
import 'package:stripe/src/utils/expandable_object_field.dart';

class CustomerExpandableField extends ExpandableObjectField<CustomerExpanded> {
  @override
  String get field => 'customer';

  const CustomerExpandableField();

  @override
  CustomerExpanded parse(Map<String, dynamic> object) =>
      CustomerExpanded(customer: Customer.fromJson(object));

  @override
  String replacement(CustomerExpanded parsedValue) => parsedValue.customer.id;
}
