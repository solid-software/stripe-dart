import 'dart:typed_data';

import 'package:stripe/src/client.dart';

import '../../messages.dart';
import '_resource.dart';

class FileResource extends Resource<File> {
  static const _resourceName = 'files';

  FileResource(Client client) : super(client);

  Future<String> downloadContentPlain(String fileId) async {
    final content = await getPlain(_buildContentsPath(fileId));

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
    final bytes = await getBytes(_buildContentsPath(fileId));

    return bytes;
  }
}
