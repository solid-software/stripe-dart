part of '../../messages.dart';

enum _FileLinkObject {
  @JsonValue('file_link')
  fileLink,
}

@JsonSerializable()
class FileLink extends Message {
  final _FileLinkObject object;
  final String id;
  @TimestampConverter()
  final DateTime? expiresAt;
  final String file;
  final Map<String, String>? metadata;
  final String? url;
  @TimestampConverter()
  final DateTime created;
  final bool expired;
  final bool livemode;

  const FileLink({
    required this.object,
    required this.id,
    required this.file,
    required this.created,
    required this.expired,
    required this.livemode,
    this.expiresAt,
    this.metadata,
    this.url,
  });

  factory FileLink.fromJson(Map<String, dynamic> json) =>
      _$FileLinkFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$FileLinkToJson(this);
}
