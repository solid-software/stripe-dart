import 'package:stripe/messages.dart';
import 'package:stripe/src/client.dart';
import 'package:stripe/src/resources/_api_config.dart';
import 'package:stripe/src/resources/_resource.dart';

class SigmaQueryRunResource extends Resource<SigmaQueryRun> {
  static const _resourceName = 'sigma/query_runs';

  SigmaQueryRunResource(Client client, ApiConfig config)
      : super(client, config);

  Future<SigmaQueryRun> create(
    CreateSigmaQueryRunRequest request, {
    String? idempotencyKey,
  }) async {
    final map = await client.post(
      makeUrl(_resourceName),
      data: request.toJson(),
      idempotencyKey: idempotencyKey,
    );

    return SigmaQueryRun.fromJson(map);
  }

  Future<SigmaQueryRun> retrieve(String sigmaQueryRunId) async {
    final map = await client.get(
      makeUrl('$_resourceName/$sigmaQueryRunId'),
    );

    return SigmaQueryRun.fromJson(map);
  }
}
