import 'package:json_annotation/json_annotation.dart';
import 'package:stripe/src/utils/expandable.dart';

/// Converts a [DateTime] to a timestamp int and vice versa.
class TimestampConverter implements JsonConverter<DateTime, int> {
  const TimestampConverter();

  @override
  DateTime fromJson(int value) =>
      DateTime.fromMillisecondsSinceEpoch(value * 1000);

  @override
  int toJson(DateTime type) => type.millisecondsSinceEpoch ~/ 1000;
}

class ExpandableJsonConverter<T>
    implements JsonConverter<Expandable<T>, Object> {
  final T Function(Map<String, dynamic> json) expandedFromJson;

  const ExpandableJsonConverter(this.expandedFromJson);

  @override
  Expandable<T> fromJson(Object json) {
    if (json is String) {
      return Expandable(id: json);
    }

    if (json is Map<String, dynamic>) {
      return Expandable(
        id: json['id'] as String,
        expanded: expandedFromJson(json),
      );
    }

    throw ArgumentError('expected an String or a Map<String, dynamic>');
  }

  @override
  Object toJson(Expandable<T> object) {
    return object.id;
  }
}

class ExpandableListJsonConverter<T>
    implements JsonConverter<ExpandableList<T>, List<dynamic>> {
  final T Function(Map<String, dynamic> json) expandedFromJson;

  const ExpandableListJsonConverter(this.expandedFromJson);

  @override
  ExpandableList<T> fromJson(List<dynamic> json) {
    if (json.isEmpty) {
      return ExpandableList(ids: [], expanded: []);
    }

    if (json.first is String) {
      return ExpandableList(ids: json.cast<String>());
    }

    // Assuming that json is List<Map<String, dynamic>>.
    final jsonList = json.cast<Map<String, dynamic>>();
    final idsList = jsonList.map((element) => element['id'] as String).toList();
    final parsedList = jsonList.map(expandedFromJson).toList();

    return ExpandableList(ids: idsList, expanded: parsedList);
  }

  @override
  List<dynamic> toJson(ExpandableList<T> object) {
    return object.ids;
  }
}
