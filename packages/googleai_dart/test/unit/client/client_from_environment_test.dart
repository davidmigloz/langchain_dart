@TestOn('vm')
library;

import 'dart:io';

import 'package:googleai_dart/googleai_dart.dart';
import 'package:test/test.dart';

void main() {
  group('GoogleAIClient.fromEnvironment', () {
    // Note: These tests don't actually test the real environment variable
    // behavior since Platform.environment is read-only. Instead, they test
    // the error cases and basic functionality.

    test('throws StateError when environment variable is not set', () {
      // Use a unique env var name that definitely won't exist
      expect(
        () => GoogleAIClient.fromEnvironment(
          envVarName: 'DEFINITELY_NOT_SET_12345',
        ),
        throwsA(
          isA<StateError>().having(
            (e) => e.message,
            'message',
            contains('DEFINITELY_NOT_SET_12345 is not set'),
          ),
        ),
      );
    });

    test('error message mentions the environment variable name', () {
      const customEnvVar = 'MY_CUSTOM_API_KEY_12345';
      expect(
        () => GoogleAIClient.fromEnvironment(envVarName: customEnvVar),
        throwsA(
          isA<StateError>().having(
            (e) => e.message,
            'message',
            allOf(contains(customEnvVar), contains('not set')),
          ),
        ),
      );
    });

    test('uses default env var name GOOGLE_GENAI_API_KEY', () {
      // This test verifies the error message uses the default env var
      // when none is specified
      try {
        GoogleAIClient.fromEnvironment();
        fail('Expected StateError');
      } on StateError catch (e) {
        expect(e.message, contains('GOOGLE_GENAI_API_KEY'));
      }
    });

    // If the real environment variable is set, test that it works
    test('creates client when environment variable is set', () {
      final apiKey = Platform.environment['GOOGLE_GENAI_API_KEY'];
      if (apiKey == null || apiKey.isEmpty) {
        markTestSkipped('GOOGLE_GENAI_API_KEY not set');
        return;
      }

      final client = GoogleAIClient.fromEnvironment();
      expect(client, isNotNull);
      client.close();
    });

    test('respects custom apiVersion parameter', () {
      final apiKey = Platform.environment['GOOGLE_GENAI_API_KEY'];
      if (apiKey == null || apiKey.isEmpty) {
        markTestSkipped('GOOGLE_GENAI_API_KEY not set');
        return;
      }

      final client = GoogleAIClient.fromEnvironment(apiVersion: ApiVersion.v1);
      expect(client.config.apiVersion, ApiVersion.v1);
      client.close();
    });

    test('respects custom timeout parameter', () {
      final apiKey = Platform.environment['GOOGLE_GENAI_API_KEY'];
      if (apiKey == null || apiKey.isEmpty) {
        markTestSkipped('GOOGLE_GENAI_API_KEY not set');
        return;
      }

      final client = GoogleAIClient.fromEnvironment(
        timeout: const Duration(seconds: 30),
      );
      expect(client.config.timeout, const Duration(seconds: 30));
      client.close();
    });
  });
}
