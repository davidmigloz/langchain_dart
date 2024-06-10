import 'package:http/http.dart' as http;

export 'http_client_stub.dart'
    if (dart.library.io) 'http_client_io.dart'
    if (dart.library.js_interop) 'http_client_html.dart';

/// {@template custom_http_client}
/// Custom HTTP client that wraps the base HTTP client and allows to override
/// the base URL, headers, and query parameters.
/// {@endtemplate}
class CustomHttpClient extends http.BaseClient {
  /// {@macro custom_http_client}
  CustomHttpClient({
    required this.baseHttpClient,
    required this.baseUrl,
    required this.headers,
    required this.queryParams,
  });

  /// Base HTTP client to use.
  final http.Client baseHttpClient;

  /// Base URL to use.
  final Uri baseUrl;

  /// Headers to send with every request.
  final Map<String, String> headers;

  /// Query parameters to send with every request.
  final Map<String, dynamic> queryParams;

  @override
  Future<http.StreamedResponse> send(http.BaseRequest request) {
    final newUrl = baseUrl.resolveUri(request.url).replace(
      queryParameters: {
        ...request.url.queryParameters,
        ...queryParams,
      },
    );

    http.BaseRequest newRequest;
    if (request is http.Request) {
      newRequest = http.Request(request.method, newUrl)
        ..headers.addAll({
          ...request.headers,
          ...headers,
        })
        ..persistentConnection = request.persistentConnection
        ..followRedirects = request.followRedirects
        ..maxRedirects = request.maxRedirects
        ..bodyBytes = request.bodyBytes;
    } else {
      throw UnsupportedError(
        'Request type not supported (${request.runtimeType})',
      );
    }

    return baseHttpClient.send(newRequest);
  }
}
