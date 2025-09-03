import 'dart:typed_data';

import 'package:stripe/src/client.dart';

import '../../messages.dart';
import '_resource.dart';

class FileResource extends Resource<File> {
  static const _resourceName = 'files';

  FileResource(Client client) : super(client);

  Future<Uint8List> downloadContentBytes(String fileId) async {
    final bytes = await getBytes('$_resourceName/$fileId');

    return bytes;
  }
}
