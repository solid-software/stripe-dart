import 'package:stripe/src/utils/expandable_field.dart';

abstract class ExpandableListField<T> extends ExpandableField<List<T>?> {
  const ExpandableListField();

  T parseElement(Map<String, dynamic> element);

  String elementReplacement(T element);

  @override
  List<T>? extract(Map<String, dynamic> json) {
    final expandedFieldJsonList =
        (json[field] as List<dynamic>?)?.cast<Map<String, dynamic>>();
    final expandedFieldParsed =
        expandedFieldJsonList?.map(parseElement).toList();
    final expandedFieldReplacement =
        expandedFieldParsed?.map(elementReplacement).toList();
    // Replace the initial field value to allow parsing the JSON using the
    // regular non-expanded model.
    json[field] = expandedFieldReplacement;

    return expandedFieldParsed;
  }
}
