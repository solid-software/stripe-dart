part of '../../../messages.dart';

@JsonSerializable()
class CreateSigmaQueryRunRequest {
  final String? fromSavedQuery;
  final String? sql;

  const CreateSigmaQueryRunRequest({
    this.fromSavedQuery,
    this.sql,
  });

  factory CreateSigmaQueryRunRequest.fromJson(Map<String, dynamic> json) =>
      _$CreateSigmaQueryRunRequestFromJson(json);

  Map<String, dynamic> toJson() => _$CreateSigmaQueryRunRequestToJson(this);
}
