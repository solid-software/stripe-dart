import 'package:json_annotation/json_annotation.dart';
import 'package:stripe/src/messages/converters.dart';
import 'package:stripe/src/utils/expandable.dart';
import 'package:test/test.dart';

part 'expandable_test.g.dart';

@JsonSerializable()
class _ObjectWithExpandableFields {
  @_ExpandableNestedObjectJsonConverter()
  final Expandable<_NestedObject> nestedObject;

  @_ExpandableNestedObjectJsonConverter()
  final Expandable<_NestedObject>? nestedObjectNullable;

  @_ExpandableNestedObjectListJsonConverter()
  final ExpandableList<_NestedObject> nestedObjectsList;

  @_ExpandableNestedObjectListJsonConverter()
  final ExpandableList<_NestedObject>? nestedObjectsListNullable;

  _ObjectWithExpandableFields({
    required this.nestedObject,
    required this.nestedObjectsList,
    this.nestedObjectNullable,
    this.nestedObjectsListNullable,
  });

  factory _ObjectWithExpandableFields.fromJson(Map<String, dynamic> json) =>
      _$ObjectWithExpandableFieldsFromJson(json);

  Map<String, dynamic> toJson() => _$ObjectWithExpandableFieldsToJson(this);
}

@JsonSerializable()
class _NestedObject {
  final String id;
  final String data;

  _NestedObject(this.id, this.data);

  factory _NestedObject.fromJson(Map<String, dynamic> json) =>
      _$NestedObjectFromJson(json);

  Map<String, dynamic> toJson() => _$NestedObjectToJson(this);
}

class _ExpandableNestedObjectJsonConverter
    extends ExpandableJsonConverter<_NestedObject> {
  const _ExpandableNestedObjectJsonConverter() : super(_NestedObject.fromJson);
}

class _ExpandableNestedObjectListJsonConverter
    extends ExpandableListJsonConverter<_NestedObject> {
  const _ExpandableNestedObjectListJsonConverter()
      : super(_NestedObject.fromJson);
}

void main() {
  group('Expandable objects:', () {
    test(
      'Object with non-expanded fields is converted toJson and fromJson correctly',
      () {
        final sourceJson = {
          'nested_object': '1',
          'nested_object_nullable': '1',
          'nested_objects_list': ['2', '3'],
          'nested_objects_list_nullable': ['2', '3'],
        };
        final parsed = _ObjectWithExpandableFields.fromJson(sourceJson);
        final convertedJson = parsed.toJson();
        expect(parsed.nestedObject.id, '1');
        expect(parsed.nestedObject.expanded, isNull);
        expect(parsed.nestedObjectsList.ids, ['2', '3']);
        expect(parsed.nestedObjectsList.expanded, isNull);
        expect(convertedJson.toString(), equals(sourceJson.toString()));
      },
    );

    test(
      'Object with empty expandable lists is converted toJson and fromJson correctly',
      () {
        final sourceJson = {
          'nested_object': '1',
          'nested_object_nullable': '1',
          'nested_objects_list': [],
          'nested_objects_list_nullable': [],
        };
        final parsed = _ObjectWithExpandableFields.fromJson(sourceJson);
        final convertedJson = parsed.toJson();
        expect(parsed.nestedObjectsList.ids, []);
        expect(parsed.nestedObjectsList.expanded, []);
        expect(convertedJson.toString(), equals(sourceJson.toString()));
      },
    );

    test(
      'Object with fields equal to null is converted toJson and fromJson correctly',
      () {
        final sourceJson = {
          'nested_object': '1',
          'nested_objects_list': ['2', '3'],
        };
        final parsed = _ObjectWithExpandableFields.fromJson(sourceJson);
        final convertedJson = parsed.toJson();
        expect(parsed.nestedObjectNullable?.id, isNull);
        expect(parsed.nestedObjectNullable?.expanded, isNull);
        expect(parsed.nestedObjectsListNullable?.ids, isNull);
        expect(parsed.nestedObjectsListNullable?.expanded, isNull);
        expect(convertedJson.toString(), equals(sourceJson.toString()));
      },
    );

    test(
      'Object with expanded fields is converted toJson and fromJson correctly',
      () {
        final sourceJson = {
          'nested_object': {'id': '1', 'data': 'data1'},
          'nested_objects_list': [
            {
              'id': '2',
              'data': 'data2',
            },
            {
              'id': '3',
              'data': 'data3',
            },
          ],
        };
        final parsed = _ObjectWithExpandableFields.fromJson(sourceJson);
        final convertedJson = parsed.toJson();
        final expectedJson = {
          'nested_object': '1',
          'nested_objects_list': ['2', '3'],
        };
        expect(parsed.nestedObject.id, '1');
        expect(parsed.nestedObject.expanded, isNotNull);
        expect(parsed.nestedObjectsList.ids, ['2', '3']);
        expect(parsed.nestedObjectsList.expanded, isNotNull);
        expect(parsed.nestedObjectsList.expanded, hasLength(2));
        expect(convertedJson.toString(), equals(expectedJson.toString()));
      },
    );
  });
}
