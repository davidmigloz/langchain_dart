import 'dart:async';

import 'package:http/http.dart' as http;
import 'package:langchain_core/tools.dart';
import 'package:tavily_dart/tavily_dart.dart';

import 'mappers.dart';
import 'tavily_search_results.dart';
import 'types.dart';

/// Tool that queries the [Tavily  Search API](https://tavily.com) and
/// gets an answer to the search query.
///
/// The Tavily API uses API keys for authentication. Visit the
/// [Tavily console](https://app.tavily.com/) to retrieve the API key you'll
/// use in your requests.
///
/// If you want to get a list of search results instead, use the
/// [TavilySearchResultsTool] instead.
///
/// Example:
/// ```dart
/// final tool = TavilyAnswerTool(
///   apiKey: Platform.environment['TAVILY_API_KEY']!,
/// );
/// final res = await tool.invoke('What is the weather like in New York?');
/// print(res);
/// // The current weather in New York is clear with a temperature of 22.8°C (73.0°F)...
/// ```
final class TavilyAnswerTool extends StringTool<TavilyAnswerToolOptions> {
  /// Creates a [TavilyAnswerTool] instance.
  ///
  /// Main configuration options:
  /// - `apiKey`: your Tavily API key. You can find your API key in the
  ///   [Tavily console](https://app.tavily.com/).
  ///
  /// Advance configuration options:
  /// - `baseUrl`: the base URL to use. Defaults to Tavily's API URL. You can
  ///   override this to use a different API URL, or to use a proxy.
  /// - `headers`: global headers to send with every request. You can use
  ///   this to set custom headers, or to override the default headers.
  /// - `queryParams`: global query parameters to send with every request. You
  ///   can use this to set custom query parameters (e.g. Azure OpenAI API
  ///   required to attach a `version` query parameter to every request).
  /// - `client`: the HTTP client to use. You can set your own HTTP client if
  ///   you need further customization (e.g. to use a Socks5 proxy).
  TavilyAnswerTool({
    this.apiKey,
    final String? baseUrl,
    final Map<String, String> headers = const {},
    final Map<String, dynamic> queryParams = const {},
    final http.Client? client,
    super.defaultOptions = const TavilyAnswerToolOptions(),
  })  : _client = TavilyClient(
          baseUrl: baseUrl,
          headers: headers,
          queryParams: queryParams,
          client: client,
        ),
        super(
          name: 'tavily_answer',
          description:
              'A search engine optimized for comprehensive, accurate, and trusted answers. '
              'Useful for when you need to answer questions about current events. '
              'The tool returns an answer to the search query - not the search results.',
          inputDescription: 'The search query to get an answer to. '
              'Eg: "What is the weather like in New York?"',
        );

  /// A client for interacting with Tavily API.
  final TavilyClient _client;

  /// Your Tavily API key.
  String? apiKey;

  @override
  Future<String> invokeInternal(
    final String toolInput, {
    final TavilyAnswerToolOptions? options,
  }) async {
    final res = await _client.search(
      request: SearchRequest(
        apiKey: apiKey,
        query: toolInput,
        includeAnswer: true,
        searchDepth: (options?.searchDepth ?? defaultOptions.searchDepth)
            .toSearchRequestSearchDepth(),
        maxResults: options?.maxResults ?? defaultOptions.maxResults,
        includeDomains:
            options?.includeDomains ?? defaultOptions.includeDomains,
        excludeDomains:
            options?.excludeDomains ?? defaultOptions.excludeDomains,
      ),
    );
    return res.answer ?? '';
  }

  @override
  void close() {
    _client.endSession();
  }
}
