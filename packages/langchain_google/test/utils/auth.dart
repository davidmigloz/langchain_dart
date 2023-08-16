import 'dart:convert';
import 'dart:io';

import 'package:gcloud/storage.dart';
import 'package:googleapis_auth/auth_io.dart';
import 'package:langchain_google/langchain_google.dart';

Future<AuthClient> getAuthHttpClient() async {
  final serviceAccountCredentials = ServiceAccountCredentials.fromJson(
    json.decode(Platform.environment['VERTEX_AI_SERVICE_ACCOUNT']!),
  );
  return clientViaServiceAccount(
    serviceAccountCredentials,
    [VertexAI.cloudPlatformScope, ...Storage.SCOPES],
  );
}
