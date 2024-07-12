import 'dart:io';

import 'package:ollama_dart/ollama_dart.dart';
import 'package:test/test.dart';

void main() {
  group('Ollama Version API tests',
      skip: Platform.environment.containsKey('CI'), () {
    late OllamaClient client;

    setUp(() async {
      client = OllamaClient();
    });

    tearDown(() {
      client.endSession();
    });

    test('Test get version', () async {
      final res = await client.getVersion();
      expect(res.version, isNotEmpty);
    });
  });
}
