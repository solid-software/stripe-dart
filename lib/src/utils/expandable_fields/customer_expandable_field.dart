import 'package:stripe/messages.dart';
import 'package:stripe/src/utils/expandable_field.dart';

class CustomerExpandableField extends ExpandableField<Customer> {
  @override
  String get field => 'customer';

  const CustomerExpandableField();

  @override
  Customer extract(Map<String, dynamic> json) => Customer.fromJson(json[field]);
}
