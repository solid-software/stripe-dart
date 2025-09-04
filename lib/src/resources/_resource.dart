import 'package:meta/meta.dart';
import 'package:stripe/src/resources/_api_config.dart';

import '../../messages.dart';
import '../client.dart';

abstract class Resource<T extends Message> {
  @protected
  final Client client;
  @protected
  final ApiConfig config;

  Resource(this.client, this.config);

  @protected
  @visibleForOverriding
  String makeUrl(String path) {
    return Uri.parse(config.baseApiUrl).resolve(path).toString();
  }
}
