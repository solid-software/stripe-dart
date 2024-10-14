// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'expandable_test.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ObjectWithExpandableFields _$ObjectWithExpandableFieldsFromJson(
        Map<String, dynamic> json) =>
    _ObjectWithExpandableFields(
      nestedObject: const _ExpandableNestedObjectJsonConverter()
          .fromJson(json['nested_object'] as Object),
      nestedObjectsList: const _ExpandableNestedObjectListJsonConverter()
          .fromJson(json['nested_objects_list'] as List),
      nestedObjectNullable:
          _$JsonConverterFromJson<Object, Expandable<_NestedObject>>(
              json['nested_object_nullable'],
              const _ExpandableNestedObjectJsonConverter().fromJson),
      nestedObjectsListNullable:
          _$JsonConverterFromJson<List<dynamic>, ExpandableList<_NestedObject>>(
              json['nested_objects_list_nullable'],
              const _ExpandableNestedObjectListJsonConverter().fromJson),
    );

Map<String, dynamic> _$ObjectWithExpandableFieldsToJson(
    _ObjectWithExpandableFields instance) {
  final val = <String, dynamic>{
    'nested_object': const _ExpandableNestedObjectJsonConverter()
        .toJson(instance.nestedObject),
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull(
      'nested_object_nullable',
      _$JsonConverterToJson<Object, Expandable<_NestedObject>>(
          instance.nestedObjectNullable,
          const _ExpandableNestedObjectJsonConverter().toJson));
  val['nested_objects_list'] = const _ExpandableNestedObjectListJsonConverter()
      .toJson(instance.nestedObjectsList);
  writeNotNull(
      'nested_objects_list_nullable',
      _$JsonConverterToJson<List<dynamic>, ExpandableList<_NestedObject>>(
          instance.nestedObjectsListNullable,
          const _ExpandableNestedObjectListJsonConverter().toJson));
  return val;
}

Value? _$JsonConverterFromJson<Json, Value>(
  Object? json,
  Value? Function(Json json) fromJson,
) =>
    json == null ? null : fromJson(json as Json);

Json? _$JsonConverterToJson<Json, Value>(
  Value? value,
  Json? Function(Value value) toJson,
) =>
    value == null ? null : toJson(value);

_NestedObject _$NestedObjectFromJson(Map<String, dynamic> json) =>
    _NestedObject(
      json['id'] as String,
      json['data'] as String,
    );

Map<String, dynamic> _$NestedObjectToJson(_NestedObject instance) =>
    <String, dynamic>{
      'id': instance.id,
      'data': instance.data,
    };
