@TestOn('vm')
library; // Uses dart:io

import 'dart:io';

import 'package:tavily_dart/tavily_dart.dart';
import 'package:test/test.dart';

void main() {
  group('Tavily API tests', () {
    late TavilyClient client;

    setUp(() {
      client = TavilyClient();
    });

    tearDown(() {
      client.endSession();
    });

    test('Test call search API', () async {
      final res = await client.search(
        request: SearchRequest(
          apiKey: Platform.environment['TAVILY_API_KEY'],
          query: 'Should I invest in Apple right now?',
          includeAnswer: true,
          includeImages: true,
          includeRawContent: true,
          maxResults: 3,
        ),
      );
      expect(res.answer, isNotEmpty);
      expect(res.query, 'Should I invest in Apple right now?');
      expect(res.responseTime, greaterThan(0));
      expect(res.images, isNotEmpty);
      expect(res.results, hasLength(3));
      final result = res.results.first;
      expect(result.title, isNotEmpty);
      expect(result.url, isNotEmpty);
      expect(result.content, isNotEmpty);
      expect(result.rawContent, isNotEmpty);
      expect(result.score, greaterThan(0));
    });
  });
}
