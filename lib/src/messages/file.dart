part of '../../messages.dart';

enum _FileObject {
  file,
}

@JsonSerializable()
class File extends Message {
  final _FileObject object;
  final String id;
  final String purpose;
  final String? type;
  @TimestampConverter()
  final DateTime created;
  @TimestampConverter()
  final DateTime? expiresAt;
  final String? filename;
  final String? title;
  final DataList<FileLink>? links;
  final int size;
  final String? url;

  const File({
    required this.object,
    required this.id,
    required this.purpose,
    required this.created,
    required this.size,
    this.type,
    this.expiresAt,
    this.filename,
    this.links,
    this.title,
    this.url,
  });

  factory File.fromJson(Map<String, dynamic> json) => _$FileFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$FileToJson(this);
}
