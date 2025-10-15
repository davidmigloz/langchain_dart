import 'package:googleai_dart/src/auth/auth_provider.dart';
import 'package:googleai_dart/src/client/config.dart';
import 'package:logging/logging.dart';
import 'package:test/test.dart';

void main() {
  group('GoogleAIConfig', () {
    test('creates with defaults', () {
      const config = GoogleAIConfig();

      expect(config.baseUrl, 'https://generativelanguage.googleapis.com');
      expect(config.authProvider, isNull);
      expect(config.timeout, const Duration(minutes: 2));
      expect(config.logLevel, Level.INFO);
    });

    test('creates with custom values', () {
      const config = GoogleAIConfig(
        authProvider: ApiKeyProvider(
          'test-key',
          placement: AuthPlacement.header,
        ),
        timeout: Duration(seconds: 30),
      );

      expect(config.authProvider, isA<ApiKeyProvider>());
      expect(config.timeout, const Duration(seconds: 30));
    });

    test('copyWith overrides values', () {
      const original = GoogleAIConfig(
        authProvider: ApiKeyProvider('key1'),
      );
      const updated = GoogleAIConfig(
        authProvider: ApiKeyProvider('key2'),
      );

      expect(original.authProvider, isA<ApiKeyProvider>());
      expect(updated.authProvider, isA<ApiKeyProvider>());
      expect(updated.baseUrl, original.baseUrl);
    });

    test('copyWith preserves unmodified values', () {
      const original = GoogleAIConfig(
        authProvider: ApiKeyProvider('key1'),
        timeout: Duration(seconds: 45),
      );
      final updated = original.copyWith(
        authProvider: const ApiKeyProvider('key2'),
      );

      expect(updated.timeout, const Duration(seconds: 45));
    });
  });

  group('RetryPolicy', () {
    test('has sensible defaults', () {
      const policy = RetryPolicy.defaultPolicy;

      expect(policy.maxRetries, 3);
      expect(policy.initialDelay, const Duration(seconds: 1));
      expect(policy.maxDelay, const Duration(seconds: 60));
      expect(policy.jitter, 0.1);
    });
  });
}
