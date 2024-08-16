import 'package:stripe/src/utils/expandable_field.dart';

abstract class ExpandableObjectField<T> extends ExpandableField<T?> {
  const ExpandableObjectField();

  T parse(Map<String, dynamic> object);

  String replacement(T parsedValue);

  @override
  T? extract(Map<String, dynamic> json) {
    final expandedFieldJson = json[field] as Map<String, dynamic>?;
    if (expandedFieldJson == null) return null;

    final expandedFieldParsed = parse(expandedFieldJson);
    // Replace the initial field value to allow parsing the JSON using the
    // regular non-expanded model.
    json[field] = replacement(expandedFieldParsed);

    return expandedFieldParsed;
  }
}
