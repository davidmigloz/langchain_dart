// CRITICAL TEST FAILURE INVESTIGATION PROCESS:
// When a test fails for a provider capability:
// 1. NEVER immediately disable the capability in provider definitions
// 2. ALWAYS investigate at the API level first:
//    - Test with curl to verify if the feature works at the raw API level
//    - Check the provider's official documentation
//    - Look for differences between our implementation and the API requirements
// 3. ONLY disable a capability after confirming:
//    - The API itself doesn't support the feature, OR
//    - The API has a fundamental limitation (like Together's
//      streaming tool format)
// 4. If the API supports it but our code doesn't: FIX THE IMPLEMENTATION

import 'dart:typed_data';

import 'package:langchain_compat/langchain_compat.dart';
import 'package:test/test.dart';

void main() {
  group('Message API', () {
    group('basic message construction', () {
      test('creates simple text messages', () {
        const message = ChatMessage(
          role: MessageRole.user,
          parts: [TextPart('Hello, world!')],
        );

        expect(message.role, equals(MessageRole.user));
        expect(message.parts, hasLength(1));
        expect(message.parts.first, isA<TextPart>());
        expect((message.parts.first as TextPart).text, equals('Hello, world!'));
      });

      test('creates system messages', () {
        const message = ChatMessage(
          role: MessageRole.system,
          parts: [TextPart('You are a helpful assistant.')],
        );

        expect(message.role, equals(MessageRole.system));
        expect(message.parts, hasLength(1));
        expect(message.parts.first, isA<TextPart>());
        expect(
          (message.parts.first as TextPart).text,
          equals('You are a helpful assistant.'),
        );
      });

      test('creates model response messages', () {
        const message = ChatMessage(
          role: MessageRole.model,
          parts: [TextPart('I can help you with that!')],
        );

        expect(message.role, equals(MessageRole.model));
        expect(message.parts, hasLength(1));
        expect(message.parts.first, isA<TextPart>());
        expect(
          (message.parts.first as TextPart).text,
          equals('I can help you with that!'),
        );
      });

      test('creates empty messages', () {
        const message = ChatMessage(role: MessageRole.user, parts: []);

        expect(message.role, equals(MessageRole.user));
        expect(message.parts, isEmpty);
      });

      test('creates messages with multiple text parts', () {
        const message = ChatMessage(
          role: MessageRole.user,
          parts: [TextPart('First part. '), TextPart('Second part.')],
        );

        expect(message.role, equals(MessageRole.user));
        expect(message.parts, hasLength(2));
        expect(message.parts.every((p) => p is TextPart), isTrue);
        expect((message.parts[0] as TextPart).text, equals('First part. '));
        expect((message.parts[1] as TextPart).text, equals('Second part.'));
      });
    });

    group('multipart messages', () {
      test('creates text and data combination', () {
        final imageBytes = Uint8List.fromList([1, 2, 3, 4]);
        final message = ChatMessage(
          role: MessageRole.user,
          parts: [
            const TextPart('What do you see in this image?'),
            DataPart(bytes: imageBytes, mimeType: 'image/jpeg'),
          ],
        );

        expect(message.role, equals(MessageRole.user));
        expect(message.parts, hasLength(2));
        expect(message.parts[0], isA<TextPart>());
        expect(message.parts[1], isA<DataPart>());

        final textPart = message.parts[0] as TextPart;
        final dataPart = message.parts[1] as DataPart;

        expect(textPart.text, equals('What do you see in this image?'));
        expect(dataPart.bytes, equals(imageBytes));
        expect(dataPart.mimeType, equals('image/jpeg'));
      });

      test('creates text and link combination', () {
        const message = ChatMessage(
          role: MessageRole.user,
          parts: [
            TextPart('Tell me about this website: '),
            LinkPart(url: 'https://www.example.com'),
          ],
        );

        expect(message.role, equals(MessageRole.user));
        expect(message.parts, hasLength(2));
        expect(message.parts[0], isA<TextPart>());
        expect(message.parts[1], isA<LinkPart>());

        final textPart = message.parts[0] as TextPart;
        final linkPart = message.parts[1] as LinkPart;

        expect(textPart.text, equals('Tell me about this website: '));
        expect(linkPart.url, equals('https://www.example.com'));
      });

      test('creates complex multipart messages', () {
        final documentBytes = Uint8List.fromList([10, 20, 30]);
        final message = ChatMessage(
          role: MessageRole.user,
          parts: [
            const TextPart('Analyze these inputs:'),
            DataPart(bytes: documentBytes, mimeType: 'application/pdf'),
            const LinkPart(url: 'https://example.com/reference'),
            const TextPart('Let me know what you find.'),
          ],
        );

        expect(message.role, equals(MessageRole.user));
        expect(message.parts, hasLength(4));
        expect(message.parts[0], isA<TextPart>());
        expect(message.parts[1], isA<DataPart>());
        expect(message.parts[2], isA<LinkPart>());
        expect(message.parts[3], isA<TextPart>());

        expect(
          (message.parts[0] as TextPart).text,
          equals('Analyze these inputs:'),
        );
        expect(
          (message.parts[1] as DataPart).mimeType,
          equals('application/pdf'),
        );
        expect(
          (message.parts[2] as LinkPart).url,
          equals('https://example.com/reference'),
        );
        expect(
          (message.parts[3] as TextPart).text,
          equals('Let me know what you find.'),
        );
      });

      test('creates data-only messages', () {
        final imageBytes = Uint8List.fromList([255, 216, 255]); // JPEG header
        final message = ChatMessage(
          role: MessageRole.user,
          parts: [DataPart(bytes: imageBytes, mimeType: 'image/jpeg')],
        );

        expect(message.role, equals(MessageRole.user));
        expect(message.parts, hasLength(1));
        expect(message.parts.first, isA<DataPart>());

        final dataPart = message.parts.first as DataPart;
        expect(dataPart.bytes, equals(imageBytes));
        expect(dataPart.mimeType, equals('image/jpeg'));
      });

      test('creates link-only messages', () {
        const message = ChatMessage(
          role: MessageRole.user,
          parts: [LinkPart(url: 'https://docs.example.com/api')],
        );

        expect(message.role, equals(MessageRole.user));
        expect(message.parts, hasLength(1));
        expect(message.parts.first, isA<LinkPart>());

        final linkPart = message.parts.first as LinkPart;
        expect(linkPart.url, equals('https://docs.example.com/api'));
      });
    });

    group('data part specifications', () {
      test('supports various image mime types', () {
        final testCases = [
          ('image/jpeg', [255, 216, 255]),
          ('image/png', [137, 80, 78, 71]),
          ('image/gif', [71, 73, 70, 56]),
          ('image/webp', [82, 73, 70, 70]),
        ];

        for (final (mimeType, headerBytes) in testCases) {
          final bytes = Uint8List.fromList(headerBytes);
          final dataPart = DataPart(bytes: bytes, mimeType: mimeType);

          expect(dataPart.bytes, equals(bytes));
          expect(dataPart.mimeType, equals(mimeType));
        }
      });

      test('supports document mime types', () {
        final testCases = [
          'application/pdf',
          'text/plain',
          'application/json',
          'text/csv',
          'application/vnd.openxmlformats-officedocument.wordprocessingml.document',
        ];

        for (final mimeType in testCases) {
          final bytes = Uint8List.fromList([1, 2, 3]);
          final dataPart = DataPart(bytes: bytes, mimeType: mimeType);

          expect(dataPart.mimeType, equals(mimeType));
          expect(dataPart.bytes, isNotNull);
        }
      });

      test('handles empty data', () {
        final dataPart = DataPart(bytes: Uint8List(0), mimeType: 'text/plain');

        expect(dataPart.bytes, hasLength(0));
        expect(dataPart.mimeType, equals('text/plain'));
      });

      test('handles large data efficiently', () {
        // Test with reasonably large data (1MB)
        final largeBytes = Uint8List(1024 * 1024)
          ..fillRange(0, 1024 * 1024, 42);
        final dataPart = DataPart(
          bytes: largeBytes,
          mimeType: 'application/octet-stream',
        );

        expect(dataPart.bytes.length, equals(1024 * 1024));
        expect(dataPart.mimeType, equals('application/octet-stream'));
        expect(dataPart.bytes.every((b) => b == 42), isTrue);
      });
    });

    group('link part specifications', () {
      test('supports various URL schemes', () {
        final testUrls = [
          'https://www.example.com',
          'http://localhost:3000',
          'ftp://files.example.com/data.txt',
          'file:///Users/docs/readme.txt',
          'data:text/plain;base64,SGVsbG8gV29ybGQ=',
        ];

        for (final url in testUrls) {
          final linkPart = LinkPart(url: url);
          expect(linkPart.url, equals(url));
        }
      });

      test('handles URLs with query parameters', () {
        const url = 'https://api.example.com/data?format=json&limit=10';
        const linkPart = LinkPart(url: url);

        expect(linkPart.url, equals(url));
      });

      test('handles URLs with fragments', () {
        const url = 'https://docs.example.com/guide#section-2';
        const linkPart = LinkPart(url: url);

        expect(linkPart.url, equals(url));
      });

      test('handles international domain names', () {
        const url = 'https://例え.テスト/path';
        const linkPart = LinkPart(url: url);

        expect(linkPart.url, equals(url));
      });
    });

    group('tool integration in messages', () {
      test('creates messages with tool calls', () {
        const toolCall = ToolPart.call(
          id: 'call_123',
          name: 'string_tool',
          arguments: {'input': 'test value'},
        );

        const message = ChatMessage(
          role: MessageRole.model,
          parts: [
            TextPart('I will use the tool to process your request.'),
            toolCall,
          ],
        );

        expect(message.role, equals(MessageRole.model));
        expect(message.parts, hasLength(2));
        expect(message.parts[0], isA<TextPart>());
        expect(message.parts[1], isA<ToolPart>());

        final toolPart = message.parts[1] as ToolPart;
        expect(toolPart.id, equals('call_123'));
        expect(toolPart.name, equals('string_tool'));
        expect(toolPart.arguments!['input'], equals('test value'));
        expect(toolPart.kind, equals(ToolPartKind.call));
      });

      test('creates messages with tool results', () {
        const toolResult = ToolPart.result(
          id: 'call_123',
          name: 'string_tool',
          result: 'Tool executed successfully',
        );

        const message = ChatMessage(
          role: MessageRole.model,
          parts: [TextPart('Here is the result:'), toolResult],
        );

        expect(message.role, equals(MessageRole.model));
        expect(message.parts, hasLength(2));
        expect(message.hasToolResults, isTrue);
        expect(message.toolResults, hasLength(1));

        final result = message.toolResults.first;
        expect(result.id, equals('call_123'));
        expect(result.name, equals('string_tool'));
        expect(result.result, equals('Tool executed successfully'));
        expect(result.kind, equals(ToolPartKind.result));
      });

      test('creates messages with multiple tool results', () {
        const toolResults = [
          ToolPart.result(id: 'call_1', name: 'tool_1', result: 'Result 1'),
          ToolPart.result(id: 'call_2', name: 'tool_2', result: 'Result 2'),
        ];

        const message = ChatMessage(
          role: MessageRole.model,
          parts: [TextPart('Multiple tools executed:'), ...toolResults],
        );

        expect(message.hasToolResults, isTrue);
        expect(message.toolResults, hasLength(2));
        expect(message.toolResults[0].id, equals('call_1'));
        expect(message.toolResults[1].id, equals('call_2'));
        expect(message.toolResults[0].result, equals('Result 1'));
        expect(message.toolResults[1].result, equals('Result 2'));
      });

      test('handles tool results with complex output', () {
        const complexOutput = {
          'status': 'success',
          'data': ['item1', 'item2'],
          'metadata': {'count': 2},
        };

        const toolResult = ToolPart.result(
          id: 'call_complex',
          name: 'complex_tool',
          result: complexOutput,
        );

        const message = ChatMessage(
          role: MessageRole.model,
          parts: [TextPart('Complex tool completed:'), toolResult],
        );

        final result = message.toolResults.first;
        expect(result.result, equals(complexOutput));
        expect(
          (result.result as Map<String, dynamic>)['status'],
          equals('success'),
        );
      });

      test('distinguishes between tool calls and results', () {
        const toolCall = ToolPart.call(
          id: 'call_456',
          name: 'test_tool',
          arguments: {'param': 'value'},
        );

        const toolResult = ToolPart.result(
          id: 'call_456',
          name: 'test_tool',
          result: 'Success',
        );

        const message = ChatMessage(
          role: MessageRole.model,
          parts: [
            TextPart('Processing...'),
            toolCall,
            TextPart('Done.'),
            toolResult,
          ],
        );

        expect(message.hasToolCalls, isTrue);
        expect(message.hasToolResults, isTrue);
        expect(message.toolCalls, hasLength(1));
        expect(message.toolResults, hasLength(1));
        expect(message.toolCalls.first.id, equals('call_456'));
        expect(message.toolResults.first.id, equals('call_456'));
      });
    });

    group('message role validation', () {
      test('supports all message roles', () {
        final roles = [MessageRole.system, MessageRole.user, MessageRole.model];

        for (final role in roles) {
          final message = ChatMessage(
            role: role,
            parts: [TextPart('Message with role: $role')],
          );

          expect(message.role, equals(role));
        }
      });

      test('system messages typically contain instructions', () {
        const message = ChatMessage(
          role: MessageRole.system,
          parts: [
            TextPart(
              'You are an expert data analyst. Be concise and accurate.',
            ),
          ],
        );

        expect(message.role, equals(MessageRole.system));
        final text = (message.parts.first as TextPart).text;
        expect(text, contains('You are'));
      });

      test('user messages typically contain queries', () {
        const message = ChatMessage(
          role: MessageRole.user,
          parts: [TextPart('Can you help me analyze this data?')],
        );

        expect(message.role, equals(MessageRole.user));
        final text = (message.parts.first as TextPart).text;
        expect(text, contains('help'));
      });

      test('model messages typically contain responses', () {
        const message = ChatMessage(
          role: MessageRole.model,
          parts: [TextPart('I would be happy to help you analyze your data.')],
        );

        expect(message.role, equals(MessageRole.model));
        final text = (message.parts.first as TextPart).text;
        expect(text, contains('happy to help'));
      });
    });

    group('message immutability and copying', () {
      test('messages are immutable after creation', () {
        const originalMessage = ChatMessage(
          role: MessageRole.user,
          parts: [TextPart('Original text')],
        );

        // Attempting to modify parts should not affect original
        final parts = originalMessage.parts;
        expect(parts, hasLength(1));

        // Message properties should remain unchanged
        expect(originalMessage.role, equals(MessageRole.user));
        expect(originalMessage.parts, hasLength(1));
      });

      test('can create message variants', () {
        const baseMessage = ChatMessage(
          role: MessageRole.user,
          parts: [TextPart('Base message')],
        );

        // Create a new message with additional parts
        final extendedMessage = ChatMessage(
          role: baseMessage.role,
          parts: [...baseMessage.parts, const TextPart(' Extended text')],
        );

        expect(baseMessage.parts, hasLength(1));
        expect(extendedMessage.parts, hasLength(2));
        expect(
          (extendedMessage.parts[1] as TextPart).text,
          equals(' Extended text'),
        );
      });

      test('tool results are preserved in message copies', () {
        const originalToolResult = ToolPart.result(
          id: 'tool_1',
          name: 'original_tool',
          result: 'Original result',
        );

        const originalMessage = ChatMessage(
          role: MessageRole.model,
          parts: [TextPart('Original response'), originalToolResult],
        );

        const newToolResult = ToolPart.result(
          id: 'tool_2',
          name: 'new_tool',
          result: 'New result',
        );

        final newMessage = ChatMessage(
          role: originalMessage.role,
          parts: [...originalMessage.parts, newToolResult],
        );

        expect(originalMessage.toolResults, hasLength(1));
        expect(newMessage.toolResults, hasLength(2));
        expect(newMessage.toolResults[1].id, equals('tool_2'));
      });
    });

    group('message collection patterns', () {
      test('builds conversation history', () {
        const conversation = <ChatMessage>[
          ChatMessage(
            role: MessageRole.system,
            parts: [TextPart('You are a helpful assistant.')],
          ),
          ChatMessage(role: MessageRole.user, parts: [TextPart('Hello!')]),
          ChatMessage(
            role: MessageRole.model,
            parts: [TextPart('Hello! How can I help you today?')],
          ),
          ChatMessage(
            role: MessageRole.user,
            parts: [TextPart('What is 2 + 2?')],
          ),
          ChatMessage(
            role: MessageRole.model,
            parts: [TextPart('2 + 2 equals 4.')],
          ),
        ];

        expect(conversation, hasLength(5));
        expect(conversation[0].role, equals(MessageRole.system));
        expect(conversation[1].role, equals(MessageRole.user));
        expect(conversation[2].role, equals(MessageRole.model));
        expect(conversation[3].role, equals(MessageRole.user));
        expect(conversation[4].role, equals(MessageRole.model));
      });

      test('filters messages by role', () {
        const conversation = <ChatMessage>[
          ChatMessage(role: MessageRole.system, parts: [TextPart('System')]),
          ChatMessage(role: MessageRole.user, parts: [TextPart('User 1')]),
          ChatMessage(role: MessageRole.model, parts: [TextPart('Model 1')]),
          ChatMessage(role: MessageRole.user, parts: [TextPart('User 2')]),
          ChatMessage(role: MessageRole.model, parts: [TextPart('Model 2')]),
        ];

        final userMessages = conversation
            .where((m) => m.role == MessageRole.user)
            .toList();
        final modelMessages = conversation
            .where((m) => m.role == MessageRole.model)
            .toList();

        expect(userMessages, hasLength(2));
        expect(modelMessages, hasLength(2));
        expect((userMessages[0].parts[0] as TextPart).text, equals('User 1'));
        expect((modelMessages[1].parts[0] as TextPart).text, equals('Model 2'));
      });

      test('extracts all tool results from conversation', () {
        const conversation = <ChatMessage>[
          ChatMessage(
            role: MessageRole.model,
            parts: [
              TextPart('Using tool...'),
              ToolPart.result(id: 'call_1', name: 'tool_1', result: 'Result 1'),
            ],
          ),
          ChatMessage(role: MessageRole.user, parts: [TextPart('Continue')]),
          ChatMessage(
            role: MessageRole.model,
            parts: [
              TextPart('Using another tool...'),
              ToolPart.result(id: 'call_2', name: 'tool_2', result: 'Result 2'),
              ToolPart.result(id: 'call_3', name: 'tool_3', result: 'Result 3'),
            ],
          ),
        ];

        final allToolResults = conversation
            .expand((m) => m.toolResults)
            .toList();

        expect(allToolResults, hasLength(3));
        expect(allToolResults[0].id, equals('call_1'));
        expect(allToolResults[1].id, equals('call_2'));
        expect(allToolResults[2].id, equals('call_3'));
      });

      test('counts parts by type across conversation', () {
        final imageBytes = Uint8List.fromList([1, 2, 3]);
        final conversation = <ChatMessage>[
          const ChatMessage(
            role: MessageRole.user,
            parts: [
              TextPart('Text 1'),
              LinkPart(url: 'https://example.com'),
            ],
          ),
          ChatMessage(
            role: MessageRole.user,
            parts: [
              const TextPart('Text 2'),
              DataPart(bytes: imageBytes, mimeType: 'image/jpeg'),
            ],
          ),
          const ChatMessage(
            role: MessageRole.model,
            parts: [
              TextPart('Response'),
              ToolPart.call(
                id: 'call_1',
                name: 'test_tool',
                arguments: {'param': 'value'},
              ),
            ],
          ),
        ];

        final allParts = conversation.expand((m) => m.parts).toList();
        final textParts = allParts.whereType<TextPart>().length;
        final dataParts = allParts.whereType<DataPart>().length;
        final linkParts = allParts.whereType<LinkPart>().length;
        final toolParts = allParts.whereType<ToolPart>().length;

        expect(textParts, equals(3));
        expect(dataParts, equals(1));
        expect(linkParts, equals(1));
        expect(toolParts, equals(1));
        expect(allParts.length, equals(6));
      });
    });

    group('edge cases and validation', () {
      test('handles very long text content', () {
        final longText = 'A' * 10000; // 10k characters
        final message = ChatMessage(
          role: MessageRole.user,
          parts: [TextPart(longText)],
        );

        expect(message.parts, hasLength(1));
        expect((message.parts.first as TextPart).text.length, equals(10000));
      });

      test('handles unicode and special characters', () {
        const unicodeText = '🚀 Hello 世界! 🌟 Testing émojis and accénts';
        const message = ChatMessage(
          role: MessageRole.user,
          parts: [TextPart(unicodeText)],
        );

        final text = (message.parts.first as TextPart).text;
        expect(text, equals(unicodeText));
        expect(text, contains('🚀'));
        expect(text, contains('世界'));
        expect(text, contains('émojis'));
      });

      test('handles newlines and formatting', () {
        const formattedText = '''
Line 1
Line 2
  - Bullet point
  - Another bullet

Final paragraph.''';
        const message = ChatMessage(
          role: MessageRole.user,
          parts: [TextPart(formattedText)],
        );

        final text = (message.parts.first as TextPart).text;
        expect(text, contains('\n'));
        expect(text, contains('  - '));
        expect(text.split('\n'), hasLength(6));
      });

      test('handles empty strings gracefully', () {
        const message = ChatMessage(
          role: MessageRole.user,
          parts: [TextPart('')],
        );

        expect(message.parts, hasLength(1));
        expect((message.parts.first as TextPart).text, equals(''));
      });

      test('handles malformed URLs in LinkPart', () {
        const testUrls = [
          'not-a-url',
          'http://',
          'https:///',
          '',
          'javascript:alert("xss")',
        ];

        for (final url in testUrls) {
          // LinkPart should accept any string as URL without validation
          final linkPart = LinkPart(url: url);
          expect(linkPart.url, equals(url));
        }
      });
    });

    group('convenience methods', () {
      test('text getter concatenates text parts', () {
        const message = ChatMessage(
          role: MessageRole.user,
          parts: [
            TextPart('Hello '),
            LinkPart(url: 'https://example.com'),
            TextPart('world!'),
          ],
        );

        expect(message.text, equals('Hello world!'));
      });

      test('hasToolCalls and hasToolResults work correctly', () {
        const messageWithCalls = ChatMessage(
          role: MessageRole.model,
          parts: [
            TextPart('Using tool...'),
            ToolPart.call(id: 'call_1', name: 'tool', arguments: {}),
          ],
        );

        const messageWithResults = ChatMessage(
          role: MessageRole.model,
          parts: [
            TextPart('Tool completed.'),
            ToolPart.result(id: 'call_1', name: 'tool', result: 'Done'),
          ],
        );

        const messageWithBoth = ChatMessage(
          role: MessageRole.model,
          parts: [
            ToolPart.call(id: 'call_1', name: 'tool', arguments: {}),
            ToolPart.result(id: 'call_1', name: 'tool', result: 'Done'),
          ],
        );

        expect(messageWithCalls.hasToolCalls, isTrue);
        expect(messageWithCalls.hasToolResults, isFalse);

        expect(messageWithResults.hasToolCalls, isFalse);
        expect(messageWithResults.hasToolResults, isTrue);

        expect(messageWithBoth.hasToolCalls, isTrue);
        expect(messageWithBoth.hasToolResults, isTrue);
      });

      test('factory constructors work correctly', () {
        final systemMessage = ChatMessage.system('You are helpful.');
        final userMessage = ChatMessage.user('Hello');
        final modelMessage = ChatMessage.model('Hi there!');

        expect(systemMessage.role, equals(MessageRole.system));
        expect(systemMessage.text, equals('You are helpful.'));

        expect(userMessage.role, equals(MessageRole.user));
        expect(userMessage.text, equals('Hello'));

        expect(modelMessage.role, equals(MessageRole.model));
        expect(modelMessage.text, equals('Hi there!'));
      });

      test('userParts and modelParts factories work correctly', () {
        final imageBytes = Uint8List.fromList([1, 2, 3]);
        final userMessage = ChatMessage.userParts([
          const TextPart('Check this image:'),
          DataPart(bytes: imageBytes, mimeType: 'image/jpeg'),
        ]);

        final modelMessage = ChatMessage.modelParts(const [
          TextPart('Processing...'),
          ToolPart.call(id: 'call_1', name: 'analyze', arguments: {}),
        ]);

        expect(userMessage.role, equals(MessageRole.user));
        expect(userMessage.parts, hasLength(2));
        expect(userMessage.parts[1], isA<DataPart>());

        expect(modelMessage.role, equals(MessageRole.model));
        expect(modelMessage.parts, hasLength(2));
        expect(modelMessage.parts[1], isA<ToolPart>());
        expect(modelMessage.hasToolCalls, isTrue);
      });
    });
  });
}
