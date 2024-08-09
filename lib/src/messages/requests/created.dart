part of '../../../messages.dart';

@JsonSerializable()
class CreatedRequest {
  /// Minimum value to filter by (exclusive).
  final int? gt;

  /// Minimum value to filter by (inclusive).
  final int? gte;

  /// Maximum value to filter by (exclusive).
  final int? lt;

  /// Maximum value to filter by (inclusive).
  final int? lte;

  CreatedRequest({
    this.gt,
    this.gte,
    this.lt,
    this.lte,
  });

  factory CreatedRequest.fromJson(Map<String, dynamic> json) =>
      _$CreatedRequestFromJson(json);

  Map<String, dynamic> toJson() => _$CreatedRequestToJson(this);
}
