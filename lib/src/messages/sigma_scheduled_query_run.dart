part of '../../messages.dart';

enum _SigmaScheduledQueryRunObject {
  scheduledQueryRun,
}

enum SigmaScheduledQueryRunStatus {
  completed,
  canceled,
  failed,
  @JsonValue('timed_out')
  timedOut,
}

@JsonSerializable()
class SigmaScheduledQueryRun extends Message {
  final _SigmaScheduledQueryRunObject object;

  @TimestampConverter()
  final DateTime? dataLoadTime;
  final File? file;
  final String sql;
  final SigmaScheduledQueryRunStatus status;
  final String? name;

  @TimestampConverter()
  final DateTime created;

  final SigmaScheduledQueryRunError? error;
  final bool livemode;

  @TimestampConverter()
  final DateTime? resultAvailableUntil;

  const SigmaScheduledQueryRun({
    required this.object,
    required this.sql,
    required this.status,
    required this.created,
    required this.livemode,
    this.dataLoadTime,
    this.file,
    this.name,
    this.error,
    this.resultAvailableUntil,
  });

  factory SigmaScheduledQueryRun.fromJson(Map<String, dynamic> json) =>
      _$SigmaScheduledQueryRunFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$SigmaScheduledQueryRunToJson(this);
}

@JsonSerializable()
class SigmaScheduledQueryRunError extends Message {
  final String message;

  const SigmaScheduledQueryRunError({
    required this.message,
  });

  factory SigmaScheduledQueryRunError.fromJson(Map<String, dynamic> json) =>
      _$SigmaScheduledQueryRunErrorFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$SigmaScheduledQueryRunErrorToJson(this);
}
