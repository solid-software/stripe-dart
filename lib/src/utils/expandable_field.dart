abstract class ExpandableField<T> {
  String get field;

  Iterable<String> get innerNestedFields => [];

  Iterable<String> get nestedFields {
    if (innerNestedFields.isEmpty) return [field];

    return innerNestedFields.map((nestedField) => '$field.$nestedField');
  }

  const ExpandableField();

  T extract(Map<String, dynamic> json);
}
