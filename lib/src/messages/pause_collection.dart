part of '../../messages.dart';

@JsonSerializable()
class PauseCollection extends Message {
  final PauseCollectionBehavior behavior;
  final DateTime? resumesAt;

  PauseCollection({
    required this.behavior,
    required this.resumesAt,
  });

  factory PauseCollection.fromJson(Map<String, dynamic> json) =>
      _$PauseCollectionFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$PauseCollectionToJson(this);
}
