import 'package:langchain/langchain.dart';
import 'package:test/test.dart';

void main() {
  group('A group of tests', () {
    final awesome = LangChain();

    test('First Test', () {
      expect(awesome.isAwesome, isTrue);
    });
  });
}
