part of '../../messages.dart';

enum _SigmaQueryRunObject {
  @JsonValue('sigma.sigma_query_run')
  sigmaSigmaQueryRun
}

enum SigmaQueryRunStatus {
  succeeded,
  pending,
  running,
  failed,
}

@JsonSerializable()
class SigmaQueryRun extends Message {
  final _SigmaQueryRunObject object;

  final String id;

  @TimestampConverter()
  final DateTime created;

  @TimestampConverter()
  final DateTime? finalizedAt;

  final bool livemode;

  final String sql;

  final SigmaQueryRunStatus status;

  const SigmaQueryRun({
    required this.object,
    required this.id,
    required this.created,
    required this.livemode,
    required this.sql,
    required this.status,
    this.finalizedAt,
  });

  factory SigmaQueryRun.fromJson(Map<String, dynamic> json) =>
      _$SigmaQueryRunFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$SigmaQueryRunToJson(this);
}
