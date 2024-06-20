import 'dart:convert';

import 'package:langchain_core/tools.dart';
import 'package:meta/meta.dart';

import 'tavily_answer.dart';
import 'tavily_search_results.dart';

/// The depth of the search.
enum TavilySearchDepth {
  /// Basic search depth.
  basic,

  /// Advanced search depth.
  advanced,
}

/// {@template tavily_search_results}
/// A search results from the Tavily search engine.
/// {@endtemplate}
@immutable
class TavilySearchResults {
  /// {@macro tavily_search_results}
  const TavilySearchResults({
    required this.results,
  });

  /// The search results.
  final List<TavilySearchResult> results;

  @override
  String toString() {
    return json.encode(
      results
          .map(
            (result) => {
              'title': result.title,
              'url': result.url,
              'content': result.content,
              'rawContent': result.rawContent,
              'score': result.score,
            },
          )
          .toList(growable: false),
    );
  }
}

/// {@template tavily_search_result}
/// A search result from the Tavily search engine.
/// {@endtemplate}
@immutable
class TavilySearchResult {
  /// {@macro tavily_search_result}
  const TavilySearchResult({
    required this.title,
    required this.url,
    required this.content,
    this.rawContent,
    required this.score,
  });

  /// The title of the search result url.
  final String title;

  /// The url of the search result.
  final String url;

  /// The most query related content from the scraped url.
  final String content;

  /// The parsed and cleaned HTML of the site. For now includes parsed text only.
  final String? rawContent;

  /// The relevance score of the search result.
  final double score;
}

/// {@template tavily_search_results_tool_options}
/// Generation options to pass into the [TavilySearchResultsTool].
/// {@endtemplate}
class TavilySearchResultsToolOptions extends ToolOptions {
  /// {@macro tavily_search_results_tool_options}
  const TavilySearchResultsToolOptions({
    this.maxResults = 5,
    this.searchDepth = TavilySearchDepth.basic,
    this.includeRawContent = false,
    this.includeDomains,
    this.excludeDomains,
  });

  /// The number of maximum search results to return.
  final int maxResults;

  /// The depth of the search.
  final TavilySearchDepth searchDepth;

  /// Include raw content in the search results.
  final bool includeRawContent;

  /// A list of domains to specifically include in the search results.
  final List<String>? includeDomains;

  /// A list of domains to specifically exclude from the search results.
  final List<String>? excludeDomains;
}

/// {@template tavily_answer_tool_options}
/// Generation options to pass into the [TavilyAnswerTool].
/// {@endtemplate}
class TavilyAnswerToolOptions extends ToolOptions {
  /// {@macro tavily_answer_tool_options}
  const TavilyAnswerToolOptions({
    this.maxResults = 5,
    this.searchDepth = TavilySearchDepth.basic,
    this.includeDomains,
    this.excludeDomains,
  });

  /// The number of maximum search results to return.
  final int maxResults;

  /// The depth of the search.
  final TavilySearchDepth searchDepth;

  /// A list of domains to specifically include in the search results.
  final List<String>? includeDomains;

  /// A list of domains to specifically exclude from the search results.
  final List<String>? excludeDomains;
}
