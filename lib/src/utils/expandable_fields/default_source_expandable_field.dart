import 'package:stripe/messages.dart';
import 'package:stripe/src/utils/expandable_object_field.dart';

class DefaultSourceExpandableField extends ExpandableObjectField<Source> {
  @override
  String get field => 'default_source';

  const DefaultSourceExpandableField();

  @override
  Source parse(Map<String, dynamic> object) {
    return Source.fromJson(object);
  }

  @override
  String replacement(Source parsedValue) {
    return parsedValue.id;
  }
}
