// ignore_for_file: avoid_print
import 'dart:convert';
import 'dart:io';

import 'package:googleapis_auth/auth_io.dart';
import 'package:vertex_ai/vertex_ai.dart';

void main() async {
  final vertexAi = VertexAIGenAIClient(
    httpClient: await _getAuthHttpClient(),
    project: _getProjectId(),
  );

  final res = await vertexAi.text.predict(
    prompt: 'List the numbers from 1 to 9 in order '
        'without any spaces or commas.',
  );
  print(res);
}

Future<AuthClient> _getAuthHttpClient() async {
  final serviceAccountCredentials = ServiceAccountCredentials.fromJson(
    json.decode(Platform.environment['VERTEX_AI_SERVICE_ACCOUNT']!),
  );
  return clientViaServiceAccount(
    serviceAccountCredentials,
    [VertexAIGenAIClient.cloudPlatformScope],
  );
}

String _getProjectId() {
  return Platform.environment['VERTEX_AI_PROJECT_ID']!;
}
