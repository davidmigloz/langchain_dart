import 'package:fetch_client/fetch_client.dart' as fetch;
import 'package:http/http.dart' as http;
import 'package:http/retry.dart';

/// Creates an IOClient with a retry policy.
http.Client createDefaultHttpClient() {
  return RetryClient(fetch.FetchClient(mode: fetch.RequestMode.cors));
}
