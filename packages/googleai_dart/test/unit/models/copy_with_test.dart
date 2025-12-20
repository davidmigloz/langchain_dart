// Copyright 2025 The GoogleAI Dart Authors. All rights reserved.
// Use of this source code is governed by an Apache-style license that can be
// found in the LICENSE file.

import 'package:googleai_dart/src/models/batch/generate_content_batch.dart';
import 'package:googleai_dart/src/models/batch/input_config.dart';
import 'package:googleai_dart/src/models/content/blob.dart';
import 'package:googleai_dart/src/models/content/content.dart';
import 'package:googleai_dart/src/models/content/file_data.dart';
import 'package:googleai_dart/src/models/content/part.dart';
import 'package:googleai_dart/src/models/embeddings/embed_content_request.dart';
import 'package:googleai_dart/src/models/generation/generation_config.dart';
import 'package:googleai_dart/src/models/generation/thinking_config.dart';
import 'package:googleai_dart/src/models/generation/thinking_level.dart';
import 'package:googleai_dart/src/models/safety/harm_category.dart';
import 'package:googleai_dart/src/models/safety/safety_setting.dart';
import 'package:googleai_dart/src/models/tools/function_declaration.dart';
import 'package:test/test.dart';

void main() {
  group('copyWith - Regular Classes', () {
    group('Content', () {
      test('copyWith with no parameters returns instance with same values', () {
        const original = Content(parts: [TextPart('hello')], role: 'user');
        final copied = original.copyWith();

        expect(copied.role, original.role);
        expect(copied.parts, original.parts);
      });

      test('copyWith updates specified fields only', () {
        const original = Content(parts: [TextPart('hello')], role: 'user');
        final updated = original.copyWith(role: 'model');

        expect(updated.role, 'model');
        expect(updated.parts, original.parts);
      });

      test('copyWith updates all fields', () {
        const original = Content(parts: [TextPart('hello')], role: 'user');
        final newParts = [const TextPart('goodbye')];
        final updated = original.copyWith(role: 'model', parts: newParts);

        expect(updated.role, 'model');
        expect(updated.parts, newParts);
      });

      test(
        'copyWith supports explicit null assignment for nullable fields',
        () {
          const original = Content(parts: [TextPart('hello')], role: 'user');
          final updated = original.copyWith(role: null);

          expect(updated.role, isNull);
          expect(updated.parts, original.parts);
        },
      );
    });

    group('GenerationConfig', () {
      test('copyWith with no parameters returns instance with same values', () {
        const original = GenerationConfig(
          temperature: 0.7,
          topP: 0.9,
          maxOutputTokens: 1000,
        );
        final copied = original.copyWith();

        expect(copied.temperature, original.temperature);
        expect(copied.topP, original.topP);
        expect(copied.maxOutputTokens, original.maxOutputTokens);
      });

      test('copyWith updates specific numeric fields', () {
        const original = GenerationConfig(
          temperature: 0.7,
          topP: 0.9,
          maxOutputTokens: 1000,
        );
        final updated = original.copyWith(temperature: 0.5);

        expect(updated.temperature, 0.5);
        expect(updated.topP, original.topP);
        expect(updated.maxOutputTokens, original.maxOutputTokens);
      });

      test('copyWith supports explicit null assignment', () {
        const original = GenerationConfig(temperature: 0.7, topP: 0.9);
        final updated = original.copyWith(temperature: null);

        expect(updated.temperature, isNull);
        expect(updated.topP, original.topP);
      });

      test('copyWith handles list fields', () {
        const original = GenerationConfig(
          stopSequences: ['stop1', 'stop2'],
          temperature: 0.7,
        );
        final newStopSequences = ['stop3'];
        final updated = original.copyWith(stopSequences: newStopSequences);

        expect(updated.stopSequences, newStopSequences);
        expect(updated.temperature, original.temperature);
      });

      test('copyWith handles map fields', () {
        const original = GenerationConfig(
          responseSchema: {'type': 'object'},
          temperature: 0.7,
        );
        final newSchema = {'type': 'string'};
        final updated = original.copyWith(responseSchema: newSchema);

        expect(updated.responseSchema, newSchema);
        expect(updated.temperature, original.temperature);
      });

      test('copyWith handles thinkingConfig field', () {
        const original = GenerationConfig(
          temperature: 0.7,
          thinkingConfig: ThinkingConfig(thinkingLevel: ThinkingLevel.high),
        );
        const newConfig = ThinkingConfig(thinkingLevel: ThinkingLevel.low);
        final updated = original.copyWith(thinkingConfig: newConfig);

        expect(updated.temperature, original.temperature);
        expect(updated.thinkingConfig?.thinkingLevel, ThinkingLevel.low);
      });
    });

    group('ThinkingConfig', () {
      test('copyWith with no parameters returns instance with same values', () {
        const original = ThinkingConfig(
          includeThoughts: true,
          thinkingBudget: 1000,
          thinkingLevel: ThinkingLevel.high,
        );
        final copied = original.copyWith();

        expect(copied.includeThoughts, original.includeThoughts);
        expect(copied.thinkingBudget, original.thinkingBudget);
        expect(copied.thinkingLevel, original.thinkingLevel);
      });

      test('copyWith updates specific fields', () {
        const original = ThinkingConfig(
          includeThoughts: true,
          thinkingLevel: ThinkingLevel.high,
        );
        final updated = original.copyWith(thinkingLevel: ThinkingLevel.low);

        expect(updated.includeThoughts, original.includeThoughts);
        expect(updated.thinkingLevel, ThinkingLevel.low);
      });

      test('copyWith supports explicit null assignment', () {
        const original = ThinkingConfig(
          includeThoughts: true,
          thinkingBudget: 1000,
        );
        final updated = original.copyWith(thinkingBudget: null);

        expect(updated.includeThoughts, original.includeThoughts);
        expect(updated.thinkingBudget, isNull);
      });
    });

    group('SafetySetting', () {
      test('copyWith with no parameters returns instance with same values', () {
        const original = SafetySetting(
          category: HarmCategory.hateSpeech,
          threshold: HarmBlockThreshold.blockMediumAndAbove,
        );
        final copied = original.copyWith();

        expect(copied.category, original.category);
        expect(copied.threshold, original.threshold);
      });

      test('copyWith updates enum fields', () {
        const original = SafetySetting(
          category: HarmCategory.hateSpeech,
          threshold: HarmBlockThreshold.blockMediumAndAbove,
        );
        final updated = original.copyWith(
          threshold: HarmBlockThreshold.blockOnlyHigh,
        );

        expect(updated.category, original.category);
        expect(updated.threshold, HarmBlockThreshold.blockOnlyHigh);
      });
    });

    group('FunctionDeclaration', () {
      test('copyWith with no parameters returns instance with same values', () {
        const original = FunctionDeclaration(
          name: 'myFunc',
          description: 'My function',
        );
        final copied = original.copyWith();

        expect(copied.name, original.name);
        expect(copied.description, original.description);
      });

      test('copyWith updates required fields', () {
        const original = FunctionDeclaration(
          name: 'oldFunc',
          description: 'Old description',
        );
        final updated = original.copyWith(name: 'newFunc');

        expect(updated.name, 'newFunc');
        expect(updated.description, original.description);
      });
    });

    group('Blob', () {
      test('copyWith with no parameters returns instance with same values', () {
        const original = Blob(mimeType: 'image/png', data: 'base64data');
        final copied = original.copyWith();

        expect(copied.mimeType, original.mimeType);
        expect(copied.data, original.data);
      });

      test('copyWith updates all required fields', () {
        const original = Blob(mimeType: 'image/png', data: 'oldData');
        final updated = original.copyWith(
          mimeType: 'image/jpeg',
          data: 'newData',
        );

        expect(updated.mimeType, 'image/jpeg');
        expect(updated.data, 'newData');
      });
    });

    group('GenerateContentBatch', () {
      test('copyWith handles DateTime fields', () {
        final createTime = DateTime(2024, 1, 1);
        final original = GenerateContentBatch(
          displayName: 'Test Batch',
          model: 'gemini-pro',
          inputConfig: const InputConfig(fileName: 'file.jsonl'),
          createTime: createTime,
        );
        final newTime = DateTime(2024, 2, 1);
        final updated = original.copyWith(createTime: newTime);

        expect(updated.createTime, newTime);
        expect(updated.displayName, original.displayName);
      });

      test('copyWith handles nested object fields', () {
        const original = GenerateContentBatch(
          displayName: 'Test Batch',
          model: 'gemini-pro',
          inputConfig: InputConfig(fileName: 'file.jsonl'),
        );
        const newConfig = InputConfig(fileName: 'newfile.jsonl');
        final updated = original.copyWith(inputConfig: newConfig);

        expect(updated.inputConfig, newConfig);
        expect(updated.displayName, original.displayName);
      });

      test('copyWith handles optional int fields', () {
        const original = GenerateContentBatch(
          displayName: 'Test Batch',
          model: 'gemini-pro',
          inputConfig: InputConfig(fileName: 'file.jsonl'),
          priority: 5,
        );
        final updated = original.copyWith(priority: 10);

        expect(updated.priority, 10);
        expect(updated.displayName, original.displayName);
      });
    });
  });

  group('copyWith - Sealed Class Subclasses', () {
    group('TextPart', () {
      test('copyWith with no parameters returns instance with same values', () {
        const original = TextPart('hello');
        final copied = original.copyWith();

        expect(copied.text, original.text);
      });

      test('copyWith updates text field', () {
        const original = TextPart('hello');
        final updated = original.copyWith(text: 'goodbye');

        expect(updated.text, 'goodbye');
      });

      test('copyWith returns same type', () {
        const original = TextPart('hello');
        final updated = original.copyWith(text: 'goodbye');

        expect(updated, isA<TextPart>());
      });
    });

    group('InlineDataPart', () {
      test('copyWith with no parameters returns instance with same values', () {
        const blob = Blob(mimeType: 'image/png', data: 'data');
        const original = InlineDataPart(blob);
        final copied = original.copyWith();

        expect(copied.inlineData, original.inlineData);
      });

      test('copyWith updates inlineData field', () {
        const blob1 = Blob(mimeType: 'image/png', data: 'data1');
        const blob2 = Blob(mimeType: 'image/jpeg', data: 'data2');
        const original = InlineDataPart(blob1);
        final updated = original.copyWith(inlineData: blob2);

        expect(updated.inlineData, blob2);
      });
    });

    group('FileDataPart', () {
      test('copyWith with no parameters returns instance with same values', () {
        const fileData = FileData(fileUri: 'gs://bucket/file');
        const original = FileDataPart(fileData);
        final copied = original.copyWith();

        expect(copied.fileData, original.fileData);
      });

      test('copyWith updates fileData field', () {
        const fileData1 = FileData(fileUri: 'gs://bucket/file1');
        const fileData2 = FileData(fileUri: 'gs://bucket/file2');
        const original = FileDataPart(fileData1);
        final updated = original.copyWith(fileData: fileData2);

        expect(updated.fileData, fileData2);
      });
    });

    group('ThoughtPart', () {
      test('copyWith with no parameters returns instance with same values', () {
        const original = ThoughtPart(thought: true);
        final copied = original.copyWith();

        expect(copied.thought, original.thought);
      });

      test('copyWith updates boolean field', () {
        const original = ThoughtPart(thought: true);
        final updated = original.copyWith(thought: false);

        expect(updated.thought, false);
      });
    });
  });

  group('copyWith - Complex Scenarios', () {
    test('copyWith chains work correctly', () {
      const original = Content(parts: [TextPart('hello')], role: 'user');
      final updated = original
          .copyWith(role: 'model')
          .copyWith(parts: [const TextPart('goodbye')]);

      expect(updated.role, 'model');
      expect((updated.parts[0] as TextPart).text, 'goodbye');
    });

    test('copyWith maintains object equality for unchanged fields', () {
      final parts = [const TextPart('hello')];
      final original = Content(parts: parts, role: 'user');
      final updated = original.copyWith(role: 'model');

      expect(identical(updated.parts, original.parts), true);
    });

    test('copyWith with nested objects', () {
      const original = EmbedContentRequest(
        content: Content(parts: [TextPart('test')]),
      );
      const newContent = Content(parts: [TextPart('new test')]);
      final updated = original.copyWith(content: newContent);

      expect(updated.content, newContent);
      expect((updated.content.parts[0] as TextPart).text, 'new test');
    });
  });
}
