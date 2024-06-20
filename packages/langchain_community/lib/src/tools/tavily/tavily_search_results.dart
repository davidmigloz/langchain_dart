import 'dart:async';

import 'package:http/http.dart' as http;
import 'package:langchain_core/tools.dart';
import 'package:tavily_dart/tavily_dart.dart';

import 'mappers.dart';
import 'tavily_answer.dart';
import 'types.dart';

/// Tool that queries the [Tavily  Search API](https://tavily.com) and
/// gets back a list of search results.
///
/// The Tavily API uses API keys for authentication. Visit the
/// [Tavily console](https://app.tavily.com/) to retrieve the API key you'll
/// use in your requests.
///
/// If you want to get directly an answer to a search query, use the
/// [TavilyAnswerTool] instead.
///
/// Example:
/// ```dart
/// final tool = TavilySearchResultsTool(
///   apiKey: Platform.environment['TAVILY_API_KEY']!,
/// );
/// final res = await tool.invoke('What is the weather like in New York?');
/// print(res);
/// // [
/// //   {
/// //     "title": "Weather in New York",
/// //     "url": "https://www.weatherapi.com/",
/// //     "content": "{'location': {'lat': 40.71, 'lon': -74.01}, 'current': {'last_updated': '2024-06-20 17:00', 'temp_c': 31.1, 'condition': {'text': 'Sunny', 'icon': '//cdn.weatherapi.com/weather/64x64/day/113.png'}, 'wind_mph': 2.2, 'wind_kph': 3.6, 'wind_degree': 161, 'wind_dir': 'SSE', 'pressure_mb': 1025.0, 'pressure_in': 30.26, 'precip_mm': 0.0, 'precip_in': 0.0, 'humidity': 48, 'cloud': 0, 'feelslike_c': 33.1, 'feelslike_f': 91.6, 'windchill_c': 29.5, 'windchill_f': 85.0, 'heatindex_c': 30.6, 'heatindex_f': 87.0, 'dewpoint_c': 17.7, 'dewpoint_f': 63.8, 'vis_km': 16.0, 'vis_miles': 9.0, 'uv': 7.0, 'gust_mph': 16.4, 'gust_kph': 26.4}}",
/// //     "score": 0.98855
/// //   },
/// //   ...
/// // ]
/// ```
final class TavilySearchResultsTool
    extends Tool<String, TavilySearchResultsToolOptions, TavilySearchResults> {
  /// Creates a [TavilySearchResultsTool] instance.
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
  TavilySearchResultsTool({
    required this.apiKey,
    final String? baseUrl,
    final Map<String, String> headers = const {},
    final Map<String, dynamic> queryParams = const {},
    final http.Client? client,
    super.defaultOptions = const TavilySearchResultsToolOptions(),
  })  : _client = TavilyClient(
          baseUrl: baseUrl,
          headers: headers,
          queryParams: queryParams,
          client: client,
        ),
        super(
          name: 'tavily_search_results',
          description:
              'A search engine optimized for comprehensive, accurate, and trusted results. '
              'Useful for when you need to answer questions about current events. '
              'The tool returns a JSON object with search results.',
          inputJsonSchema: {
            'type': 'object',
            'properties': {
              'query': {
                'type': 'string',
                'description': 'The search query to look up. '
                    'Eg: "What is the weather like in New York?"',
              },
            },
            'required': ['query'],
          },
        );

  /// A client for interacting with Tavily API.
  final TavilyClient _client;

  /// Your Tavily API key.
  String apiKey;

  @override
  Future<TavilySearchResults> invokeInternal(
    final String input, {
    final TavilySearchResultsToolOptions? options,
  }) async {
    final res = await _client.search(
      request: SearchRequest(
        apiKey: apiKey,
        query: input,
        searchDepth: (options?.searchDepth ?? defaultOptions.searchDepth)
            .toSearchRequestSearchDepth(),
        maxResults: options?.maxResults ?? defaultOptions.maxResults,
        includeRawContent:
            options?.includeRawContent ?? defaultOptions.includeRawContent,
        includeDomains:
            options?.includeDomains ?? defaultOptions.includeDomains,
        excludeDomains:
            options?.excludeDomains ?? defaultOptions.excludeDomains,
      ),
    );
    return TavilySearchResults(
      results: res.results
          .map((r) => r.toTavilySearchResult())
          .toList(growable: false),
    );
  }

  @override
  String getInputFromJson(final Map<String, dynamic> json) {
    return json['query'] as String;
  }

  @override
  void close() {
    _client.endSession();
  }
}
