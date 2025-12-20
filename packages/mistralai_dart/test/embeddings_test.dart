// ignore_for_file: avoid_redundant_argument_values
import 'package:mistralai_dart/mistralai_dart.dart';
import 'package:test/test.dart';

void main() {
  group('EmbeddingRequest tests', () {
    test('serializes with all optional fields', () {
      const request = EmbeddingRequest(
        model: EmbeddingModel.model(EmbeddingModels.mistralEmbed),
        input: ['Hello', 'World'],
        outputDimension: 256,
        outputDtype: EmbeddingOutputDtype.float,
        encodingFormat: EmbeddingEncodingFormat.float,
      );

      final json = request.toJson();

      expect(json['model'], 'mistral-embed');
      expect(json['input'], ['Hello', 'World']);
      expect(json['output_dimension'], 256);
      expect(json['output_dtype'], 'float');
      expect(json['encoding_format'], 'float');
    });

    test('serializes with only required fields', () {
      const request = EmbeddingRequest(
        model: EmbeddingModel.modelId('codestral-embed-2505'),
        input: ['Test'],
      );

      final json = request.toJson();

      expect(json['model'], 'codestral-embed-2505');
      expect(json['input'], ['Test']);
      expect(json.containsKey('output_dimension'), isFalse);
      expect(json.containsKey('output_dtype'), isFalse);
      expect(json.containsKey('encoding_format'), isFalse);
    });

    test('serializes with base64 encoding format', () {
      const request = EmbeddingRequest(
        model: EmbeddingModel.model(EmbeddingModels.codestralEmbed2505),
        input: ['Test'],
        encodingFormat: EmbeddingEncodingFormat.base64,
      );

      final json = request.toJson();

      expect(json['model'], 'codestral-embed-2505');
      expect(json['encoding_format'], 'base64');
    });

    test('deserializes with all fields', () {
      final json = {
        'model': 'mistral-embed',
        'input': ['Hello'],
        'output_dimension': 512,
        'output_dtype': 'int8',
        'encoding_format': 'base64',
      };

      final request = EmbeddingRequest.fromJson(json);

      expect(request.outputDimension, 512);
      expect(request.outputDtype, EmbeddingOutputDtype.int8);
      expect(request.encodingFormat, EmbeddingEncodingFormat.base64);
    });

    test('deserializes with only required fields', () {
      final json = {
        'model': 'mistral-embed',
        'input': ['Hello'],
      };

      final request = EmbeddingRequest.fromJson(json);

      expect(request.outputDimension, isNull);
      expect(request.outputDtype, isNull);
      expect(request.encodingFormat, isNull);
    });
  });

  group('EmbeddingOutputDtype enum tests', () {
    test('has all expected values', () {
      expect(EmbeddingOutputDtype.values, hasLength(5));
      expect(
        EmbeddingOutputDtype.values,
        containsAll([
          EmbeddingOutputDtype.float,
          EmbeddingOutputDtype.int8,
          EmbeddingOutputDtype.uint8,
          EmbeddingOutputDtype.binary,
          EmbeddingOutputDtype.ubinary,
        ]),
      );
    });
  });

  group('EmbeddingEncodingFormat enum tests', () {
    test('has all expected values', () {
      expect(EmbeddingEncodingFormat.values, hasLength(2));
      expect(
        EmbeddingEncodingFormat.values,
        containsAll([
          EmbeddingEncodingFormat.float,
          EmbeddingEncodingFormat.base64,
        ]),
      );
    });
  });

  group('EmbeddingModels enum tests', () {
    test('has all expected values', () {
      expect(EmbeddingModels.values, hasLength(2));
      expect(
        EmbeddingModels.values,
        containsAll([
          EmbeddingModels.mistralEmbed,
          EmbeddingModels.codestralEmbed2505,
        ]),
      );
    });
  });

  group('EmbeddingResponse tests', () {
    test('deserializes with created field', () {
      final json = {
        'id': 'embd-123',
        'object': 'list',
        'data': [
          {
            'object': 'embedding',
            'embedding': [0.1, 0.2],
            'index': 0,
          },
        ],
        'model': 'mistral-embed',
        'created': 1702256327,
        'usage': {
          'prompt_tokens': 5,
          'completion_tokens': 0,
          'total_tokens': 5,
        },
      };

      final response = EmbeddingResponse.fromJson(json);

      expect(response.id, 'embd-123');
      expect(response.created, 1702256327);
      expect(response.usage.promptTokens, 5);
      expect(response.usage.completionTokens, 0);
    });

    test('deserializes without created field', () {
      final json = {
        'id': 'embd-123',
        'object': 'list',
        'data': <Map<String, dynamic>>[],
        'model': 'mistral-embed',
        'usage': {
          'prompt_tokens': 5,
          'completion_tokens': 0,
          'total_tokens': 5,
        },
      };

      final response = EmbeddingResponse.fromJson(json);

      expect(response.created, isNull);
    });
  });

  group('EmbeddingUsage tests', () {
    test('deserializes with all fields', () {
      final json = {
        'prompt_tokens': 10,
        'completion_tokens': 0,
        'total_tokens': 10,
        'prompt_audio_seconds': 30,
      };

      final usage = EmbeddingUsage.fromJson(json);

      expect(usage.promptTokens, 10);
      expect(usage.completionTokens, 0);
      expect(usage.totalTokens, 10);
      expect(usage.promptAudioSeconds, 30);
    });

    test('deserializes without prompt_audio_seconds', () {
      final json = {
        'prompt_tokens': 10,
        'completion_tokens': 0,
        'total_tokens': 10,
      };

      final usage = EmbeddingUsage.fromJson(json);

      expect(usage.promptAudioSeconds, isNull);
    });

    test('serializes with all fields', () {
      const usage = EmbeddingUsage(
        promptTokens: 10,
        completionTokens: 0,
        totalTokens: 10,
        promptAudioSeconds: 30,
      );

      final json = usage.toJson();

      expect(json['prompt_tokens'], 10);
      expect(json['completion_tokens'], 0);
      expect(json['total_tokens'], 10);
      expect(json['prompt_audio_seconds'], 30);
    });

    test('serializes without prompt_audio_seconds when null', () {
      const usage = EmbeddingUsage(
        promptTokens: 10,
        completionTokens: 0,
        totalTokens: 10,
      );

      final json = usage.toJson();

      expect(json.containsKey('prompt_audio_seconds'), isFalse);
    });
  });
}
