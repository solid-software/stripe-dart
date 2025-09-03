import 'package:stripe/messages.dart';
import 'package:stripe/src/client.dart';
import 'package:stripe/src/resources/_resource.dart';

class SigmaQueryRunResource extends Resource<SigmaQueryRun> {
  static const _resourceName = 'sigma/query_runs';

  SigmaQueryRunResource(Client client) : super(client);

  Future<SigmaQueryRun> create(
    CreateSigmaQueryRunRequest request, {
    String? idempotencyKey,
  }) async {
    final map = await post(
      _resourceName,
      data: request.toJson(),
      idempotencyKey: idempotencyKey,
    );

    return SigmaQueryRun.fromJson(map);
  }

  Future<SigmaQueryRun> retrieve(String sigmaQueryRunId) async {
    final map = await get('$_resourceName/$sigmaQueryRunId');

    return SigmaQueryRun.fromJson(map);
  }
}
