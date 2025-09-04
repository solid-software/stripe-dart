import 'dart:typed_data';

import 'package:stripe/src/client.dart';
import 'package:stripe/src/resources/_api_config.dart';

import '../../messages.dart';
import '_resource.dart';

class FileResource extends Resource<File> {
  static const _resourceName = 'files';

  FileResource(Client client, ApiConfig config) : super(client, config);

  Future<String> downloadContentPlain(String fileId) async {
    final content = await client.getPlain(
      _makeFilesUrl(
        _buildContentsPath(fileId),
      ),
    );

    return content;
  }

  String _buildContentsPath(String fileId) {
    return [
      _resourceName,
      fileId,
      'contents',
    ].join('/');
  }

  Future<Uint8List> downloadContentBytes(String fileId) async {
    final bytes = await client.getBytes(
      _makeFilesUrl(_buildContentsPath(fileId)),
    );

    return bytes;
  }

  String _makeFilesUrl(String path) {
    return Uri.parse(config.baseFilesUrl).resolve(path).toString();
  }
}
