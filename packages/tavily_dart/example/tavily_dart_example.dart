// ignore_for_file: avoid_print
import 'dart:io';

import 'package:tavily_dart/tavily_dart.dart';

void main() async {
  final apiKey = Platform.environment['TAVILY_API_KEY']!;
  final client = TavilyClient();

  // Basic search
  final res1 = await client.search(
    request: SearchRequest(
      apiKey: apiKey,
      query: 'Should I invest in Apple right now?',
    ),
  );
  print(res1);

  // Advanced search
  final res2 = await client.search(
    request: SearchRequest(
      apiKey: apiKey,
      query: 'Should I invest in Apple right now?',
      searchDepth: SearchRequestSearchDepth.advanced,
    ),
  );
  print(res2);
}
