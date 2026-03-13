import 'package:openai_dart/openai_dart.dart';

/// A mutable [AuthProvider] that allows changing the API key at runtime.
///
/// This is the intended extensibility pattern for the API client architecture:
/// [AuthProvider.getHeaders] is called per-request, so changing [apiKey]
/// takes effect on the next request.
class MutableApiKeyProvider implements AuthProvider {
  /// Creates a [MutableApiKeyProvider] with the given initial API key.
  MutableApiKeyProvider(this.apiKey);

  /// The current API key.
  String apiKey;

  @override
  Map<String, String> getHeaders() =>
      apiKey.isNotEmpty ? {'Authorization': 'Bearer $apiKey'} : {};
}

/// Builds a base URL that includes query parameters.
///
/// The [RequestBuilder.buildUrl] in openai_dart automatically extracts and
/// merges query params from the base URL. This helper encodes [queryParams]
/// into [baseUrl] so they are sent with every request.
///
/// This is used for Azure OpenAI API's `api-version` query parameter, etc.
String? buildBaseUrl(String? baseUrl, Map<String, dynamic>? queryParams) {
  if (baseUrl == null || queryParams == null || queryParams.isEmpty) {
    return baseUrl;
  }
  final uri = Uri.parse(baseUrl);
  final filtered = {
    ...uri.queryParameters,
    for (final e in queryParams.entries)
      if (e.value != null) e.key: e.value.toString(),
  };
  return uri.replace(queryParameters: filtered).toString();
}
