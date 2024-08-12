import 'package:stripe/messages.dart';
import 'package:stripe/src/utils/expandable_list_field.dart';

class DiscountsExpandableField extends ExpandableListField<Discount> {
  @override
  String get field => 'discounts';

  const DiscountsExpandableField();

  @override
  String elementReplacement(Discount element) => element.id;

  @override
  Discount parseElement(Map<String, dynamic> element) =>
      Discount.fromJson(element);
}
