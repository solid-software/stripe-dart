abstract class ExpandableField<T> {
  String get field;

  const ExpandableField();

  T extract(Map<String, dynamic> json);
}
