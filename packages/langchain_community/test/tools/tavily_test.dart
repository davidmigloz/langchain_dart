import 'dart:convert';
import 'dart:io';

import 'package:langchain_community/langchain_community.dart';
import 'package:test/test.dart';

void main() {
  group('TavilySearchResultsTool tests', () {
    test('Calculate expressions', () async {
      final tool = TavilySearchResultsTool(
        apiKey: Platform.environment['TAVILY_API_KEY'],
      );
      final res = await tool.invoke('What is the weather like in New York?');
      expect(res.results, isNotEmpty);
      final jsonString = res.toString();
      expect(() => json.decode(jsonString), returnsNormally);
      tool.close();
    });
  });

  group('TavilyAnswerTool tests', () {
    test('Invoke TavilyAnswerTool', () async {
      final tool = TavilyAnswerTool(
        apiKey: Platform.environment['TAVILY_API_KEY'],
      );
      final res = await tool.invoke('What is the weather like in New York?');
      expect(res, isNotEmpty);
      tool.close();
    });
  });
}
