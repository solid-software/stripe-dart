import 'dart:typed_data';

import 'package:stripe/src/client.dart';

import '../../messages.dart';
import '_resource.dart';

class FileResource extends Resource<File> {
  static const _resourceName = 'files';

  FileResource(Client client) : super(client);

  Future<String> downloadContentPlain(String fileId) async {
    final content = await getPlain('$_resourceName/$fileId');

    return content;
  }

  Future<Uint8List> downloadContentBytes(String fileId) async {
    final bytes = await getBytes('$_resourceName/$fileId');

    return bytes;
  }
}
