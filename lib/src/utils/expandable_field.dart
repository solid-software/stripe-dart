abstract class ExpandableField<T> {
  String get field;

  Iterable<String> get nestedFields => [];

  Iterable<String> get nestedFieldPaths =>
      nestedFields.map((nestedField) => '$field.$nestedField');

  const ExpandableField();

  T extract(Map<String, dynamic> json);
}
