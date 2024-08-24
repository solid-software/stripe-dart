import 'package:stripe/messages.dart';
import 'package:stripe/src/expanded/discount_expanded.dart';
import 'package:stripe/src/utils/expandable_list_field.dart';

class DiscountsExpandableField extends ExpandableListField<DiscountExpanded> {
  @override
  String get field => 'discounts';

  const DiscountsExpandableField();

  @override
  String elementReplacement(DiscountExpanded element) => element.discount.id;

  @override
  DiscountExpanded parseElement(Map<String, dynamic> element) =>
      DiscountExpanded(
        discount: Discount.fromJson(element),
      );
}
