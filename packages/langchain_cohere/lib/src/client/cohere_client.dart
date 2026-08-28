import 'dart:convert';

import 'package:http/http.dart' as http;

import 'types.dart';

/// {@template cohere_client}
/// Minimal client for the [Cohere v2 API](https://docs.cohere.com/reference/chat).
///
/// This is an intentionally minimal, hand-written client that only covers the
/// endpoints needed by this integration:
/// - `POST /v2/chat` (non-streaming and streaming)
/// - `POST /v2/embed`
///
/// If more endpoints or parameters are needed in the future, consider
/// generating a full-blown `cohere_dart` client from the official
/// [Cohere OpenAPI spec](https://github.com/cohere-ai/cohere-developer-experience/blob/main/cohere-openapi.yaml)
/// instead of extending this one.
/// {@endtemplate}
class CohereClient {
  /// {@macro cohere_client}
  CohereClient({
    final String? apiKey,
    this.baseUrl = 'https://api.cohere.com',
    final Map<String, String>? headers,
    final Map<String, dynamic>? queryParams,
    final http.Client? client,
  }) : _apiKey = apiKey ?? '',
       _headers = headers ?? const {},
       _queryParams =
           queryParams?.map((final k, final v) => MapEntry(k, v.toString())) ??
           const {},
       _httpClient = client ?? http.Client();

  /// The base URL of the Cohere API.
  final String baseUrl;

  final String _apiKey;
  final Map<String, String> _headers;
  final Map<String, String> _queryParams;
  final http.Client _httpClient;

  /// Calls the Cohere v2 Chat API (`POST /v2/chat`).
  Future<CohereChatResponse> chat({
    required final CohereChatRequest request,
  }) async {
    final response = await _httpClient.post(
      _buildUri('/v2/chat'),
      headers: _buildHeaders(),
      body: json.encode(request.toJson()),
    );
    _checkResponse(response.statusCode, response.body);
    return CohereChatResponse.fromJson(
      json.decode(utf8.decode(response.bodyBytes)) as Map<String, dynamic>,
    );
  }

  /// Calls the Cohere v2 Chat API (`POST /v2/chat`) in streaming mode.
  ///
  /// The returned stream emits one [CohereChatStreamEvent] per server-sent
  /// event.
  Stream<CohereChatStreamEvent> chatStream({
    required final CohereChatRequest request,
  }) async* {
    final httpRequest = http.Request('POST', _buildUri('/v2/chat'))
      ..headers.addAll(_buildHeaders())
      ..body = json.encode(request.toJson());
    final response = await _httpClient.send(httpRequest);
    if (response.statusCode < 200 || response.statusCode >= 300) {
      final body = await response.stream.bytesToString();
      _checkResponse(response.statusCode, body);
    }
    final lines = response.stream
        .transform(utf8.decoder)
        .transform(const LineSplitter());
    await for (final line in lines) {
      final data = parseSseDataLine(line);
      if (data == null) {
        continue;
      }
      yield CohereChatStreamEvent.fromJson(
        json.decode(data) as Map<String, dynamic>,
      );
    }
  }

  /// Calls the Cohere v2 Embed API (`POST /v2/embed`).
  Future<CohereEmbedResponse> embed({
    required final CohereEmbedRequest request,
  }) async {
    final response = await _httpClient.post(
      _buildUri('/v2/embed'),
      headers: _buildHeaders(),
      body: json.encode(request.toJson()),
    );
    _checkResponse(response.statusCode, response.body);
    final result = CohereEmbedResponse.fromJson(
      json.decode(utf8.decode(response.bodyBytes)) as Map<String, dynamic>,
    );
    // Guard against a short/misaligned response: the embeddings must line up
    // one-to-one (and in order) with the input texts, otherwise callers would
    // silently associate an embedding with the wrong document.
    if (result.embeddings.length != request.texts.length) {
      throw CohereClientException(
        message:
            'Cohere returned ${result.embeddings.length} embeddings for '
            '${request.texts.length} input text(s)',
        statusCode: response.statusCode,
        body: response.body,
      );
    }
    return result;
  }

  /// Closes the client and cleans up any resources associated with it.
  void close() {
    _httpClient.close();
  }

  /// Extracts the JSON payload from a server-sent events line.
  ///
  /// Returns `null` for lines that carry no payload (empty lines, comments,
  /// `event:` lines, end-of-stream markers, ...).
  static String? parseSseDataLine(final String line) {
    final trimmed = line.trim();
    if (trimmed.isEmpty) {
      return null;
    }
    if (trimmed.startsWith('data:')) {
      final data = trimmed.substring('data:'.length).trim();
      if (data.isEmpty || data == '[DONE]') {
        return null;
      }
      return data;
    }
    // Tolerate raw JSON lines (some proxies strip the `data:` prefix).
    if (trimmed.startsWith('{')) {
      return trimmed;
    }
    return null;
  }

  Uri _buildUri(final String path) {
    final base = Uri.parse(baseUrl);
    return base.replace(
      path: '${base.path}$path',
      queryParameters: _queryParams.isEmpty ? null : _queryParams,
    );
  }

  Map<String, String> _buildHeaders() => {
    'Content-Type': 'application/json',
    'Accept': 'application/json',
    if (_apiKey.isNotEmpty) 'Authorization': 'Bearer $_apiKey',
    ..._headers,
  };

  void _checkResponse(final int statusCode, final String body) {
    if (statusCode < 200 || statusCode >= 300) {
      String? message;
      try {
        final decoded = json.decode(body);
        if (decoded is Map<String, dynamic>) {
          message = decoded['message'] as String?;
        }
      } catch (_) {
        // Not a JSON body, use the raw body as the message.
      }
      throw CohereClientException(
        message: message ?? body,
        statusCode: statusCode,
        body: body,
      );
    }
  }
}

/// {@template cohere_client_exception}
/// Exception thrown when the Cohere API returns an error response.
/// {@endtemplate}
class CohereClientException implements Exception {
  /// {@macro cohere_client_exception}
  const CohereClientException({
    required this.message,
    required this.statusCode,
    this.body,
  });

  /// The error message returned by the API.
  final String message;

  /// The HTTP status code of the response.
  final int statusCode;

  /// The raw body of the response.
  final String? body;

  @override
  String toString() =>
      'CohereClientException(statusCode: $statusCode, message: $message)';
}
