import 'dart:convert';
import 'dart:io';

import 'package:gcloud/storage.dart';
import 'package:googleapis_auth/auth_io.dart';
import 'package:langchain_google/langchain_google.dart';

HttpClientAuthProvider getAuthProvider() {
  return HttpClientAuthProvider(
    credentials: ServiceAccountCredentials.fromJson(
      json.decode(Platform.environment['VERTEX_AI_SERVICE_ACCOUNT']!),
    ),
    scopes: [
      'https://www.googleapis.com/auth/cloud-platform',
      ...Storage.SCOPES,
    ],
  );
}
