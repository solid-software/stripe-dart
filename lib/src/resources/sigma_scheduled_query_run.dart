import 'package:stripe/messages.dart';
import 'package:stripe/src/api_config.dart';
import 'package:stripe/src/client.dart';
import 'package:stripe/src/resources/_resource.dart';

class SigmaScheduledQueryRunResource extends Resource<SigmaScheduledQueryRun> {
  static const _resourceName = 'sigma/scheduled_query_runs';

  SigmaScheduledQueryRunResource(Client client, ApiConfig config)
      : super(client, config);

  // Added as an experiment since POST /v1/sigma/query_runs doesn't work
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

  Future<SigmaScheduledQueryRun> retrieve(String sigmaQueryRunId) async {
    final map = await client.get(
      makeUrl('$_resourceName/$sigmaQueryRunId'),
    );

    return SigmaScheduledQueryRun.fromJson(map);
  }

  Future<DataList<SigmaScheduledQueryRun>> list() async {
    final map = await client.get(
      makeUrl(_resourceName),
    );

    return DataList<SigmaScheduledQueryRun>.fromJson(
      map,
      (value) => SigmaScheduledQueryRun.fromJson(value as Map<String, dynamic>),
    );
  }
}
