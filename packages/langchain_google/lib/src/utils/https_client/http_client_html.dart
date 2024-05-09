import 'package:fetch_client/fetch_client.dart' as fetch;
import 'package:http/http.dart' as http;
import 'package:http/retry.dart';

import 'http_client.dart';

/// Creates an IOClient.
CustomHttpClient createDefaultHttpClient({
  http.Client? baseHttpClient,
  required String baseUrl,
  required Map<String, String> headers,
  required Map<String, dynamic> queryParams,
}) {
  return CustomHttpClient(
    baseHttpClient: baseHttpClient ??
        RetryClient(fetch.FetchClient(mode: fetch.RequestMode.cors)),
    baseUrl: Uri.parse(baseUrl),
    headers: headers,
    queryParams: queryParams,
  );
}
