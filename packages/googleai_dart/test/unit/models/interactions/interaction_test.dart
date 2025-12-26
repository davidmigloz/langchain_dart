import 'package:googleai_dart/googleai_dart.dart';
import 'package:test/test.dart';

void main() {
  group('Interaction', () {
    group('fromJson', () {
      test('creates Interaction with all fields', () {
        final json = {
          'id': 'abc-123',
          'model': 'gemini-3-flash-preview',
          'status': 'completed',
          'created': '2024-01-15T10:30:00Z',
          'updated': '2024-01-15T10:31:00Z',
          'usage': {
            'total_input_tokens': 100,
            'total_output_tokens': 50,
            'total_tokens': 150,
          },
          'outputs': [
            {
              'role': 'model',
              'content': [
                {'type': 'text', 'text': 'Hello!'},
              ],
            },
          ],
        };

        final interaction = Interaction.fromJson(json);

        expect(interaction.id, 'abc-123');
        expect(interaction.model, 'gemini-3-flash-preview');
        expect(interaction.status, InteractionStatus.completed);
        expect(interaction.created, DateTime.parse('2024-01-15T10:30:00Z'));
        expect(interaction.updated, DateTime.parse('2024-01-15T10:31:00Z'));
        expect(interaction.usage, isNotNull);
        expect(interaction.usage!.totalInputTokens, 100);
        expect(interaction.outputs, isNotNull);
        expect(interaction.outputs!.length, 1);
      });

      test('creates Interaction with minimal required fields', () {
        final json = {'id': 'minimal-123', 'status': 'in_progress'};

        final interaction = Interaction.fromJson(json);

        expect(interaction.id, 'minimal-123');
        expect(interaction.status, InteractionStatus.inProgress);
        expect(interaction.model, isNull);
        expect(interaction.usage, isNull);
        expect(interaction.outputs, isNull);
      });

      test('parses all status values', () {
        final statuses = {
          'in_progress': InteractionStatus.inProgress,
          'requires_action': InteractionStatus.requiresAction,
          'completed': InteractionStatus.completed,
          'failed': InteractionStatus.failed,
          'cancelled': InteractionStatus.cancelled,
        };

        for (final entry in statuses.entries) {
          final json = {'id': 'test-123', 'status': entry.key};
          final interaction = Interaction.fromJson(json);
          expect(interaction.status, entry.value);
        }
      });
    });

    group('toJson', () {
      test('converts Interaction with all fields to JSON', () {
        final interaction = Interaction(
          id: 'test-456',
          status: InteractionStatus.completed,
          model: 'gemini-2.5-pro',
          created: DateTime.parse('2024-02-20T08:15:00Z'),
          updated: DateTime.parse('2024-02-20T08:16:00Z'),
          usage: const InteractionUsage(
            totalInputTokens: 200,
            totalOutputTokens: 100,
          ),
        );

        final json = interaction.toJson();

        expect(json['id'], 'test-456');
        expect(json['model'], 'gemini-2.5-pro');
        expect(json['status'], 'completed');
        expect(json['created'], contains('2024-02-20'));
        expect(json['updated'], contains('2024-02-20'));
        expect(json['usage'], isNotNull);
      });

      test('omits null fields from JSON', () {
        const interaction = Interaction(
          id: 'minimal-456',
          status: InteractionStatus.inProgress,
        );

        final json = interaction.toJson();

        expect(json['id'], 'minimal-456');
        expect(json['status'], 'in_progress');
        expect(json.containsKey('model'), false);
        expect(json.containsKey('usage'), false);
        expect(json.containsKey('outputs'), false);
      });
    });

    test('round-trip conversion preserves data', () {
      final original = Interaction(
        id: 'roundtrip-789',
        status: InteractionStatus.inProgress,
        model: 'gemini-3-flash-preview',
        created: DateTime.parse('2024-03-10T12:00:00Z'),
        usage: const InteractionUsage(
          totalInputTokens: 50,
          totalOutputTokens: 25,
          totalTokens: 75,
        ),
      );

      final json = original.toJson();
      final restored = Interaction.fromJson(json);

      expect(restored.id, original.id);
      expect(restored.model, original.model);
      expect(restored.status, original.status);
      expect(restored.created, original.created);
      expect(
        restored.usage!.totalInputTokens,
        original.usage!.totalInputTokens,
      );
    });
  });

  group('InteractionStatus', () {
    test('fromString parses all values', () {
      expect(
        InteractionStatus.fromString('in_progress'),
        InteractionStatus.inProgress,
      );
      expect(
        InteractionStatus.fromString('requires_action'),
        InteractionStatus.requiresAction,
      );
      expect(
        InteractionStatus.fromString('completed'),
        InteractionStatus.completed,
      );
      expect(InteractionStatus.fromString('failed'), InteractionStatus.failed);
      expect(
        InteractionStatus.fromString('cancelled'),
        InteractionStatus.cancelled,
      );
    });

    test('fromString returns default for unknown value', () {
      expect(
        InteractionStatus.fromString('unknown'),
        InteractionStatus.inProgress,
      );
      expect(InteractionStatus.fromString(null), InteractionStatus.inProgress);
    });

    test('toJson returns correct string', () {
      expect(InteractionStatus.inProgress.toJson(), 'in_progress');
      expect(InteractionStatus.requiresAction.toJson(), 'requires_action');
      expect(InteractionStatus.completed.toJson(), 'completed');
      expect(InteractionStatus.failed.toJson(), 'failed');
      expect(InteractionStatus.cancelled.toJson(), 'cancelled');
    });
  });

  group('InteractionUsage', () {
    test('fromJson with all fields', () {
      final json = {
        'total_input_tokens': 100,
        'total_output_tokens': 50,
        'total_tokens': 150,
        'total_reasoning_tokens': 20,
        'total_tool_use_tokens': 10,
        'total_cached_tokens': 5,
        'input_tokens_by_modality': [
          {'modality': 'TEXT', 'tokens': 80},
          {'modality': 'IMAGE', 'tokens': 20},
        ],
      };

      final usage = InteractionUsage.fromJson(json);

      expect(usage.totalInputTokens, 100);
      expect(usage.totalOutputTokens, 50);
      expect(usage.totalTokens, 150);
      expect(usage.totalReasoningTokens, 20);
      expect(usage.totalToolUseTokens, 10);
      expect(usage.totalCachedTokens, 5);
      expect(usage.inputTokensByModality, isNotNull);
      expect(usage.inputTokensByModality!.length, 2);
    });

    test('toJson omits null fields', () {
      const usage = InteractionUsage(totalInputTokens: 100);

      final json = usage.toJson();

      expect(json['total_input_tokens'], 100);
      expect(json.containsKey('total_output_tokens'), false);
      expect(json.containsKey('total_tokens'), false);
    });
  });

  group('Turn', () {
    test('fromJson with content list', () {
      final json = {
        'role': 'user',
        'content': [
          {'type': 'text', 'text': 'Hello'},
        ],
      };

      final turn = Turn.fromJson(json);

      expect(turn.role, 'user');
      expect(turn.content, isNotNull);
      expect(turn.content, isA<List<dynamic>>());
      expect((turn.content! as List<dynamic>).length, 1);
    });

    test('fromJson with text string', () {
      final json = {'role': 'user', 'content': 'Hello'};

      final turn = Turn.fromJson(json);

      expect(turn.role, 'user');
      expect(turn.content, 'Hello');
    });

    test('toJson with content list', () {
      const turn = Turn(
        role: 'model',
        content: [TextContent(text: 'Response')],
      );

      final json = turn.toJson();

      expect(json['role'], 'model');
      expect(json['content'], isA<List<dynamic>>());
      expect((json['content'] as List<dynamic>).length, 1);
    });

    test('Turn.text factory', () {
      const turn = Turn.text(role: 'user', text: 'Hello');

      expect(turn.role, 'user');
      expect(turn.content, 'Hello');
    });
  });
}
