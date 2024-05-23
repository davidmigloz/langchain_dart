import 'package:http/http.dart' as http;
import 'package:http/retry.dart';

/// Creates an IOClient with a retry policy.
http.Client createDefaultHttpClient() {
  return RetryClient(http.Client());
}

/// Middleware for HTTP requests.
Future<http.BaseRequest> onRequestHandler(final http.BaseRequest request) {
  return Future.value(request);
}
