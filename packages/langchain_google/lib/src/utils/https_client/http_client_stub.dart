import 'package:http/http.dart' as http;

import 'http_client.dart';

/// Creates a default HTTP client for the current platform.
CustomHttpClient createDefaultHttpClient({
  http.Client? baseHttpClient,
  required String baseUrl,
  required Map<String, String> headers,
  required Map<String, dynamic> queryParams,
}) =>
    throw UnsupportedError(
      'Cannot create a client without dart:html or dart:io.',
    );
