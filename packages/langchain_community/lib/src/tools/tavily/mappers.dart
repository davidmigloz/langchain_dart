// ignore_for_file: public_member_api_docs
import 'package:tavily_dart/tavily_dart.dart';

import 'types.dart';

extension TavilySearchDepthX on TavilySearchDepth {
  SearchRequestSearchDepth toSearchRequestSearchDepth() => switch (this) {
    TavilySearchDepth.basic => SearchRequestSearchDepth.basic,
    TavilySearchDepth.advanced => SearchRequestSearchDepth.advanced,
  };
}

extension TavilySearchResultX on SearchResult {
  TavilySearchResult toTavilySearchResult() => TavilySearchResult(
    title: title,
    url: url,
    content: content,
    rawContent: rawContent,
    score: score,
  );
}
