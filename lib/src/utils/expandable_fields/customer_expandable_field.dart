import 'package:stripe/messages.dart';
import 'package:stripe/src/utils/expandable_object_field.dart';

class CustomerExpandableField extends ExpandableObjectField<Customer> {
  @override
  String get field => 'customer';

  const CustomerExpandableField();

  @override
  Customer parse(Map<String, dynamic> object) => Customer.fromJson(object);

  @override
  String replacement(Customer parsedValue) => parsedValue.id;
}
