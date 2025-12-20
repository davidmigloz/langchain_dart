// ignore_for_file: avoid_dynamic_calls

import 'dart:convert';

import 'package:googleai_dart/googleai_dart.dart';
import 'package:test/test.dart';

void main() {
  group('Part Sealed Class', () {
    group('TextPart', () {
      test('creates from text', () {
        const part = TextPart('Hello world');
        expect(part.text, equals('Hello world'));
      });

      test('serializes to JSON', () {
        const part = TextPart('Hello world');
        final json = part.toJson();
        expect(json, equals({'text': 'Hello world'}));
      });

      test('deserializes from JSON', () {
        final json = {'text': 'Hello world'};
        final part = Part.fromJson(json);
        expect(part, isA<TextPart>());
        expect((part as TextPart).text, equals('Hello world'));
      });

      test('roundtrip serialization', () {
        const original = TextPart('Test message');
        final json = original.toJson();
        final deserialized = Part.fromJson(json);
        expect(deserialized, isA<TextPart>());
        expect((deserialized as TextPart).text, equals(original.text));
      });
    });

    group('InlineDataPart', () {
      test('creates with Blob', () {
        final blob = Blob(
          mimeType: 'image/png',
          data: base64.encode([1, 2, 3]),
        );
        final part = InlineDataPart(blob);
        expect(part.inlineData, equals(blob));
      });

      test('serializes to JSON', () {
        final blob = Blob(
          mimeType: 'image/png',
          data: base64.encode([1, 2, 3]),
        );
        final part = InlineDataPart(blob);
        final json = part.toJson();
        expect(json.containsKey('inlineData'), isTrue);
        expect(json['inlineData']['mimeType'], equals('image/png'));
      });

      test('deserializes from JSON', () {
        final json = {
          'inlineData': {
            'mimeType': 'image/jpeg',
            'data': base64.encode([4, 5, 6]),
          },
        };
        final part = Part.fromJson(json);
        expect(part, isA<InlineDataPart>());
        expect(
          (part as InlineDataPart).inlineData.mimeType,
          equals('image/jpeg'),
        );
      });

      test('roundtrip serialization', () {
        final original = InlineDataPart(
          Blob(mimeType: 'audio/mp3', data: base64.encode([7, 8, 9])),
        );
        final json = original.toJson();
        final deserialized = Part.fromJson(json);
        expect(deserialized, isA<InlineDataPart>());
        expect(
          (deserialized as InlineDataPart).inlineData.mimeType,
          equals(original.inlineData.mimeType),
        );
      });

      group('with mediaResolution', () {
        test('creates with mediaResolution from JSON', () {
          final json = {
            'inlineData': {
              'mimeType': 'image/png',
              'data': base64.encode([1, 2, 3]),
            },
            'mediaResolution': {'level': 'MEDIA_RESOLUTION_HIGH'},
          };
          final part = Part.fromJson(json);
          expect(part, isA<InlineDataPart>());
          final inlinePart = part as InlineDataPart;
          expect(inlinePart.mediaResolution, isNotNull);
          expect(
            inlinePart.mediaResolution!.level,
            equals(MediaResolutionLevel.high),
          );
        });

        test('serializes mediaResolution to JSON', () {
          const part = InlineDataPart(
            Blob(mimeType: 'image/png', data: 'data'),
            mediaResolution: MediaResolution(
              level: MediaResolutionLevel.medium,
            ),
          );
          final json = part.toJson();
          expect(json.containsKey('mediaResolution'), isTrue);
          expect(
            json['mediaResolution']['level'],
            equals('MEDIA_RESOLUTION_MEDIUM'),
          );
        });

        test('omits mediaResolution when null', () {
          const part = InlineDataPart(
            Blob(mimeType: 'image/png', data: 'data'),
          );
          final json = part.toJson();
          expect(json.containsKey('mediaResolution'), isFalse);
        });

        test('roundtrip with mediaResolution', () {
          const original = InlineDataPart(
            Blob(mimeType: 'video/mp4', data: 'videodata'),
            mediaResolution: MediaResolution(
              level: MediaResolutionLevel.ultraHigh,
            ),
          );
          final json = original.toJson();
          final deserialized = Part.fromJson(json) as InlineDataPart;
          expect(
            deserialized.mediaResolution!.level,
            equals(original.mediaResolution!.level),
          );
        });

        test('copyWith can update mediaResolution', () {
          const original = InlineDataPart(
            Blob(mimeType: 'image/png', data: 'data'),
          );
          final copy = original.copyWith(
            mediaResolution: const MediaResolution(
              level: MediaResolutionLevel.low,
            ),
          );
          expect(copy.mediaResolution, isNotNull);
          expect(copy.mediaResolution!.level, equals(MediaResolutionLevel.low));
        });

        test('copyWith can set mediaResolution to null', () {
          const original = InlineDataPart(
            Blob(mimeType: 'image/png', data: 'data'),
            mediaResolution: MediaResolution(level: MediaResolutionLevel.high),
          );
          final copy = original.copyWith(mediaResolution: null);
          expect(copy.mediaResolution, isNull);
        });
      });
    });

    group('FileDataPart', () {
      test('creates with FileData', () {
        const fileData = FileData(fileUri: 'gs://bucket/file.pdf');
        const part = FileDataPart(fileData);
        expect(part.fileData, equals(fileData));
      });

      test('serializes to JSON', () {
        const part = FileDataPart(
          FileData(fileUri: 'gs://bucket/video.mp4', mimeType: 'video/mp4'),
        );
        final json = part.toJson();
        expect(json.containsKey('fileData'), isTrue);
        expect(json['fileData']['fileUri'], equals('gs://bucket/video.mp4'));
      });

      test('deserializes from JSON', () {
        final json = {
          'fileData': {
            'fileUri': 'gs://bucket/doc.pdf',
            'mimeType': 'application/pdf',
          },
        };
        final part = Part.fromJson(json);
        expect(part, isA<FileDataPart>());
        expect(
          (part as FileDataPart).fileData.fileUri,
          equals('gs://bucket/doc.pdf'),
        );
      });

      test('roundtrip serialization', () {
        const original = FileDataPart(
          FileData(fileUri: 'gs://test/image.png', mimeType: 'image/png'),
        );
        final json = original.toJson();
        final deserialized = Part.fromJson(json);
        expect(deserialized, isA<FileDataPart>());
        expect(
          (deserialized as FileDataPart).fileData.fileUri,
          equals(original.fileData.fileUri),
        );
      });

      group('with mediaResolution', () {
        test('creates with mediaResolution from JSON', () {
          final json = {
            'fileData': {
              'fileUri': 'gs://bucket/video.mp4',
              'mimeType': 'video/mp4',
            },
            'mediaResolution': {'level': 'MEDIA_RESOLUTION_LOW'},
          };
          final part = Part.fromJson(json);
          expect(part, isA<FileDataPart>());
          final filePart = part as FileDataPart;
          expect(filePart.mediaResolution, isNotNull);
          expect(
            filePart.mediaResolution!.level,
            equals(MediaResolutionLevel.low),
          );
        });

        test('serializes mediaResolution to JSON', () {
          const part = FileDataPart(
            FileData(fileUri: 'gs://bucket/file'),
            mediaResolution: MediaResolution(
              level: MediaResolutionLevel.ultraHigh,
            ),
          );
          final json = part.toJson();
          expect(json.containsKey('mediaResolution'), isTrue);
          expect(
            json['mediaResolution']['level'],
            equals('MEDIA_RESOLUTION_ULTRA_HIGH'),
          );
        });

        test('omits mediaResolution when null', () {
          const part = FileDataPart(FileData(fileUri: 'gs://bucket/file'));
          final json = part.toJson();
          expect(json.containsKey('mediaResolution'), isFalse);
        });

        test('roundtrip with mediaResolution', () {
          const original = FileDataPart(
            FileData(fileUri: 'gs://bucket/video.mp4', mimeType: 'video/mp4'),
            mediaResolution: MediaResolution(
              level: MediaResolutionLevel.medium,
            ),
          );
          final json = original.toJson();
          final deserialized = Part.fromJson(json) as FileDataPart;
          expect(
            deserialized.mediaResolution!.level,
            equals(original.mediaResolution!.level),
          );
        });

        test('copyWith can update mediaResolution', () {
          const original = FileDataPart(FileData(fileUri: 'gs://test'));
          final copy = original.copyWith(
            mediaResolution: const MediaResolution(
              level: MediaResolutionLevel.high,
            ),
          );
          expect(copy.mediaResolution, isNotNull);
          expect(
            copy.mediaResolution!.level,
            equals(MediaResolutionLevel.high),
          );
        });

        test('copyWith can set mediaResolution to null', () {
          const original = FileDataPart(
            FileData(fileUri: 'gs://test'),
            mediaResolution: MediaResolution(level: MediaResolutionLevel.low),
          );
          final copy = original.copyWith(mediaResolution: null);
          expect(copy.mediaResolution, isNull);
        });
      });
    });

    group('FunctionCallPart', () {
      test('creates with FunctionCall', () {
        const functionCall = FunctionCall(
          name: 'get_weather',
          args: {'city': 'SF'},
        );
        const part = FunctionCallPart(functionCall);
        expect(part.functionCall, equals(functionCall));
      });

      test('serializes to JSON', () {
        const part = FunctionCallPart(
          FunctionCall(name: 'search', args: {'query': 'test'}),
        );
        final json = part.toJson();
        expect(json.containsKey('functionCall'), isTrue);
        expect(json['functionCall']['name'], equals('search'));
      });

      test('deserializes from JSON', () {
        final json = {
          'functionCall': {
            'name': 'calculate',
            'args': {'x': 5, 'y': 10},
          },
        };
        final part = Part.fromJson(json);
        expect(part, isA<FunctionCallPart>());
        expect(
          (part as FunctionCallPart).functionCall.name,
          equals('calculate'),
        );
      });

      test('roundtrip serialization', () {
        const original = FunctionCallPart(
          FunctionCall(name: 'test_func', args: {'param': 'value'}),
        );
        final json = original.toJson();
        final deserialized = Part.fromJson(json);
        expect(deserialized, isA<FunctionCallPart>());
        expect(
          (deserialized as FunctionCallPart).functionCall.name,
          equals(original.functionCall.name),
        );
      });
    });

    group('FunctionResponsePart', () {
      test('creates with FunctionResponse', () {
        const response = FunctionResponse(
          name: 'get_weather',
          response: {'temp': 72},
        );
        const part = FunctionResponsePart(response);
        expect(part.functionResponse, equals(response));
      });

      test('serializes to JSON', () {
        const part = FunctionResponsePart(
          FunctionResponse(name: 'search', response: {'results': <String>[]}),
        );
        final json = part.toJson();
        expect(json.containsKey('functionResponse'), isTrue);
        expect(json['functionResponse']['name'], equals('search'));
      });

      test('deserializes from JSON', () {
        final json = {
          'functionResponse': {
            'name': 'get_data',
            'response': {'data': 'test'},
          },
        };
        final part = Part.fromJson(json);
        expect(part, isA<FunctionResponsePart>());
        expect(
          (part as FunctionResponsePart).functionResponse.name,
          equals('get_data'),
        );
      });

      test('roundtrip serialization', () {
        const original = FunctionResponsePart(
          FunctionResponse(name: 'test', response: {'key': 'value'}),
        );
        final json = original.toJson();
        final deserialized = Part.fromJson(json);
        expect(deserialized, isA<FunctionResponsePart>());
        expect(
          (deserialized as FunctionResponsePart).functionResponse.name,
          equals(original.functionResponse.name),
        );
      });
    });

    group('ExecutableCodePart', () {
      test('creates with ExecutableCode', () {
        const code = ExecutableCode(
          language: Language.python,
          code: 'print("hello")',
        );
        const part = ExecutableCodePart(code);
        expect(part.executableCode, equals(code));
      });

      test('serializes to JSON', () {
        const part = ExecutableCodePart(
          ExecutableCode(
            language: Language.python,
            code: 'console.log("test")',
          ),
        );
        final json = part.toJson();
        expect(json.containsKey('executableCode'), isTrue);
        expect(json['executableCode']['language'], equals('PYTHON'));
      });

      test('deserializes from JSON', () {
        final json = {
          'executableCode': {'language': 'PYTHON', 'code': 'x = 5'},
        };
        final part = Part.fromJson(json);
        expect(part, isA<ExecutableCodePart>());
        expect(
          (part as ExecutableCodePart).executableCode.language,
          equals(Language.python),
        );
      });

      test('roundtrip serialization', () {
        const original = ExecutableCodePart(
          ExecutableCode(language: Language.python, code: 'puts "test"'),
        );
        final json = original.toJson();
        final deserialized = Part.fromJson(json);
        expect(deserialized, isA<ExecutableCodePart>());
        expect(
          (deserialized as ExecutableCodePart).executableCode.language,
          equals(original.executableCode.language),
        );
      });
    });

    group('CodeExecutionResultPart', () {
      test('creates with CodeExecutionResult', () {
        const result = CodeExecutionResult(outcome: Outcome.ok, output: 'Done');
        const part = CodeExecutionResultPart(result);
        expect(part.codeExecutionResult, equals(result));
      });

      test('serializes to JSON', () {
        const part = CodeExecutionResultPart(
          CodeExecutionResult(outcome: Outcome.failed, output: 'Failed'),
        );
        final json = part.toJson();
        expect(json.containsKey('codeExecutionResult'), isTrue);
        expect(
          json['codeExecutionResult']['outcome'],
          equals('OUTCOME_FAILED'),
        );
      });

      test('deserializes from JSON', () {
        final json = {
          'codeExecutionResult': {
            'outcome': 'OUTCOME_OK',
            'output': 'Result: 42',
          },
        };
        final part = Part.fromJson(json);
        expect(part, isA<CodeExecutionResultPart>());
        expect(
          (part as CodeExecutionResultPart).codeExecutionResult.outcome,
          equals(Outcome.ok),
        );
      });

      test('roundtrip serialization', () {
        const original = CodeExecutionResultPart(
          CodeExecutionResult(
            outcome: Outcome.deadlineExceeded,
            output: 'Timed out',
          ),
        );
        final json = original.toJson();
        final deserialized = Part.fromJson(json);
        expect(deserialized, isA<CodeExecutionResultPart>());
        expect(
          (deserialized as CodeExecutionResultPart).codeExecutionResult.outcome,
          equals(original.codeExecutionResult.outcome),
        );
      });
    });

    group('VideoMetadataPart', () {
      test('creates with VideoMetadata', () {
        const metadata = VideoMetadata(videoDuration: '10s');
        const part = VideoMetadataPart(metadata);
        expect(part.videoMetadata, equals(metadata));
      });

      test('serializes to JSON', () {
        const part = VideoMetadataPart(VideoMetadata(videoDuration: '15s'));
        final json = part.toJson();
        expect(json.containsKey('videoMetadata'), isTrue);
        expect(json['videoMetadata']['videoDuration'], equals('15s'));
      });

      test('deserializes from JSON', () {
        final json = {
          'videoMetadata': {'videoDuration': '30s'},
        };
        final part = Part.fromJson(json);
        expect(part, isA<VideoMetadataPart>());
        expect(
          (part as VideoMetadataPart).videoMetadata.videoDuration,
          equals('30s'),
        );
      });

      test('roundtrip serialization', () {
        const original = VideoMetadataPart(VideoMetadata(videoDuration: '20s'));
        final json = original.toJson();
        final deserialized = Part.fromJson(json);
        expect(deserialized, isA<VideoMetadataPart>());
        expect(
          (deserialized as VideoMetadataPart).videoMetadata.videoDuration,
          equals(original.videoMetadata.videoDuration),
        );
      });
    });

    group('ThoughtPart', () {
      test('creates with boolean', () {
        const part = ThoughtPart(thought: true);
        expect(part.thought, isTrue);
      });

      test('serializes to JSON', () {
        const part = ThoughtPart(thought: false);
        final json = part.toJson();
        expect(json, equals({'thought': false}));
      });

      test('deserializes from JSON', () {
        final json = {'thought': true};
        final part = Part.fromJson(json);
        expect(part, isA<ThoughtPart>());
        expect((part as ThoughtPart).thought, isTrue);
      });

      test('roundtrip serialization', () {
        const original = ThoughtPart(thought: true);
        final json = original.toJson();
        final deserialized = Part.fromJson(json);
        expect(deserialized, isA<ThoughtPart>());
        expect((deserialized as ThoughtPart).thought, equals(original.thought));
      });
    });

    group('ThoughtSignaturePart', () {
      test('creates with byte list', () {
        const part = ThoughtSignaturePart([1, 2, 3, 4]);
        expect(part.thoughtSignature, equals([1, 2, 3, 4]));
      });

      test('serializes to JSON with base64', () {
        const part = ThoughtSignaturePart([65, 66, 67]); // "ABC" in ASCII
        final json = part.toJson();
        expect(json.containsKey('thoughtSignature'), isTrue);
        expect(json['thoughtSignature'], equals(base64.encode([65, 66, 67])));
      });

      test('deserializes from JSON', () {
        final json = {
          'thoughtSignature': base64.encode([10, 20, 30]),
        };
        final part = Part.fromJson(json);
        expect(part, isA<ThoughtSignaturePart>());
        expect(
          (part as ThoughtSignaturePart).thoughtSignature,
          equals([10, 20, 30]),
        );
      });

      test('roundtrip serialization', () {
        const original = ThoughtSignaturePart([100, 200, 50]);
        final json = original.toJson();
        final deserialized = Part.fromJson(json);
        expect(deserialized, isA<ThoughtSignaturePart>());
        expect(
          (deserialized as ThoughtSignaturePart).thoughtSignature,
          equals(original.thoughtSignature),
        );
      });
    });

    group('PartMetadataPart', () {
      test('creates with metadata map', () {
        const part = PartMetadataPart({'key': 'value', 'count': 42});
        expect(part.partMetadata['key'], equals('value'));
        expect(part.partMetadata['count'], equals(42));
      });

      test('serializes to JSON', () {
        const part = PartMetadataPart({
          'foo': 'bar',
          'nested': {'a': 1},
        });
        final json = part.toJson();
        expect(json.containsKey('partMetadata'), isTrue);
        expect(json['partMetadata']['foo'], equals('bar'));
      });

      test('deserializes from JSON', () {
        final json = {
          'partMetadata': {'test': 'data', 'value': 123},
        };
        final part = Part.fromJson(json);
        expect(part, isA<PartMetadataPart>());
        expect((part as PartMetadataPart).partMetadata['test'], equals('data'));
      });

      test('roundtrip serialization', () {
        const original = PartMetadataPart({
          'x': 'y',
          'z': [1, 2, 3],
        });
        final json = original.toJson();
        final deserialized = Part.fromJson(json);
        expect(deserialized, isA<PartMetadataPart>());
        expect(
          (deserialized as PartMetadataPart).partMetadata['x'],
          equals('y'),
        );
      });
    });

    group('Exhaustive Matching', () {
      test('throws FormatException for unknown Part type', () {
        final json = {'unknownField': 'value'};
        expect(() => Part.fromJson(json), throwsA(isA<FormatException>()));
      });

      test('all 11 Part variants can be deserialized', () {
        final variants = <Map<String, dynamic>>[
          {'text': 'test'},
          {
            'inlineData': {'mimeType': 'image/png', 'data': 'YWJj'},
          },
          {
            'fileData': {'fileUri': 'gs://bucket/file'},
          },
          {
            'functionCall': {'name': 'test', 'args': <String, dynamic>{}},
          },
          {
            'functionResponse': {
              'name': 'test',
              'response': <String, dynamic>{},
            },
          },
          {
            'executableCode': {'language': 'PYTHON', 'code': 'x=1'},
          },
          {
            'codeExecutionResult': {'outcome': 'OUTCOME_OK', 'output': 'ok'},
          },
          {
            'videoMetadata': {'videoDuration': '10s'},
          },
          {'thought': true},
          {'thoughtSignature': 'YWJj'},
          {
            'partMetadata': <String, dynamic>{'key': 'value'},
          },
        ];

        for (final json in variants) {
          expect(() => Part.fromJson(json), returnsNormally);
        }
      });
    });
  });
}
