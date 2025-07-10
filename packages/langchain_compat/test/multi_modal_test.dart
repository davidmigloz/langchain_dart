/// TESTING PHILOSOPHY:
/// 1. DO NOT catch exceptions - let them bubble up for diagnosis
/// 2. DO NOT add provider filtering except by capabilities (e.g. ProviderCaps)
/// 3. DO NOT add performance tests
/// 4. DO NOT add regression tests
/// 5. 80% cases = common usage patterns tested across ALL capable providers
/// 6. Edge cases = rare scenarios tested on Google only to avoid timeouts
/// 7. Each functionality should only be tested in ONE file - no duplication

import 'dart:typed_data';

import 'package:langchain_compat/langchain_compat.dart';
import 'package:test/test.dart';

void main() {
  // Helper to run parameterized tests
  void runProviderTest(
    String description,
    Future<void> Function(ChatProvider provider) testFunction, {
    Set<ProviderCaps>? requiredCaps,
    bool edgeCase = false,
  }) {
    final providers = edgeCase
        ? ['google:gemini-2.0-flash'] // Edge cases on Google only
        : ChatProvider.all
              .where(
                (p) =>
                    requiredCaps == null ||
                    requiredCaps.every((cap) => p.caps.contains(cap)),
              )
              .map((p) => '${p.name}:${p.defaultModelName}');

    for (final providerModel in providers) {
      test('$providerModel: $description', () async {
        final parts = providerModel.split(':');
        final providerName = parts[0];
        final provider = ChatProvider.forName(providerName);
        await testFunction(provider);
      });
    }
  }

  group('Multi-Modal', () {
    group('image attachments (80% cases)', () {
      runProviderTest('handles single image attachment', (provider) async {
        final agent = Agent('${provider.name}:${provider.defaultModelName}');

        // Create a simple 1x1 PNG image
        final imageData = Uint8List.fromList([
          0x89, 0x50, 0x4E, 0x47, 0x0D, 0x0A, 0x1A, 0x0A, // PNG header
          0x00, 0x00, 0x00, 0x0D, 0x49, 0x48, 0x44, 0x52, // IHDR chunk
          0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x01, // 1x1 pixel
          0x08, 0x02, 0x00, 0x00, 0x00, 0x90, 0x77, 0x53,
          0xDE, 0x00, 0x00, 0x00, 0x0C, 0x49, 0x44, 0x41,
          0x54, 0x08, 0x99, 0x01, 0x01, 0x00, 0x00, 0xFF,
          0xFF, 0x00, 0x00, 0x00, 0x02, 0x00, 0x01, 0x73,
          0x75, 0x01, 0x18, 0x00, 0x00, 0x00, 0x00, 0x49,
          0x45, 0x4E, 0x44, 0xAE, 0x42, 0x60, 0x82,
        ]);

        final result = await agent.run(
          'Describe this image in one word',
          attachments: [DataPart(bytes: imageData, mimeType: 'image/png')],
        );

        expect(result.output, isNotEmpty);
        // Verify the message has the attachment
        final userMessage = result.messages.firstWhere(
          (m) => m.role == MessageRole.user,
        );
        expect(userMessage.parts.whereType<DataPart>().length, equals(1));
      });

      runProviderTest('handles multiple images', (provider) async {
        final agent = Agent('${provider.name}:${provider.defaultModelName}');

        // Create two simple images
        final image1 = Uint8List.fromList([1, 2, 3, 4]); // Minimal data
        final image2 = Uint8List.fromList([5, 6, 7, 8]); // Minimal data

        final result = await agent.run(
          'How many images do you see?',
          attachments: [
            DataPart(bytes: image1, mimeType: 'image/png'),
            DataPart(bytes: image2, mimeType: 'image/jpeg'),
          ],
        );

        expect(result.output, isNotEmpty);
        // Verify both attachments are in the message
        final userMessage = result.messages.firstWhere(
          (m) => m.role == MessageRole.user,
        );
        expect(userMessage.parts.whereType<DataPart>().length, equals(2));
      });

      runProviderTest('handles text with image', (provider) async {
        final agent = Agent('${provider.name}:${provider.defaultModelName}');

        final imageData = Uint8List.fromList([0xFF, 0xD8, 0xFF, 0xE0]); // JPEG

        final result = await agent.run(
          'What type of file is this?',
          attachments: [DataPart(bytes: imageData, mimeType: 'image/jpeg')],
        );

        expect(result.output, isNotEmpty);
        // Should have both text and image parts
        final userMessage = result.messages.firstWhere(
          (m) => m.role == MessageRole.user,
        );
        expect(userMessage.parts.whereType<TextPart>().length, equals(1));
        expect(userMessage.parts.whereType<DataPart>().length, equals(1));
      });
    });

    group('link attachments (80% cases)', () {
      runProviderTest('handles single URL attachment', (provider) async {
        final agent = Agent('${provider.name}:${provider.defaultModelName}');

        final result = await agent.run(
          'What is at this URL?',
          attachments: [const LinkPart(url: 'https://example.com/image.png')],
        );

        expect(result.output, isNotEmpty);
        // Verify the link is in the message
        final userMessage = result.messages.firstWhere(
          (m) => m.role == MessageRole.user,
        );
        expect(userMessage.parts.whereType<LinkPart>().length, equals(1));
      });

      runProviderTest('handles multiple URLs', (provider) async {
        final agent = Agent('${provider.name}:${provider.defaultModelName}');

        final result = await agent.run(
          'Compare these URLs',
          attachments: [
            const LinkPart(url: 'https://example.com/1.jpg'),
            const LinkPart(url: 'https://example.com/2.jpg'),
          ],
        );

        expect(result.output, isNotEmpty);
        // Verify both links are in the message
        final userMessage = result.messages.firstWhere(
          (m) => m.role == MessageRole.user,
        );
        expect(userMessage.parts.whereType<LinkPart>().length, equals(2));
      });
    });

    group('mixed attachments (80% cases)', () {
      runProviderTest('handles image and URL together', (provider) async {
        final agent = Agent('${provider.name}:${provider.defaultModelName}');

        final imageData = Uint8List.fromList([1, 2, 3, 4]);

        final result = await agent.run(
          'Compare these two inputs',
          attachments: [
            DataPart(bytes: imageData, mimeType: 'image/png'),
            const LinkPart(url: 'https://example.com/ref.jpg'),
          ],
        );

        expect(result.output, isNotEmpty);
        // Verify mixed attachments
        final userMessage = result.messages.firstWhere(
          (m) => m.role == MessageRole.user,
        );
        expect(userMessage.parts.whereType<DataPart>().length, equals(1));
        expect(userMessage.parts.whereType<LinkPart>().length, equals(1));
      });
    });

    group('edge cases', () {
      runProviderTest('handles empty attachments list', (provider) async {
        final agent = Agent('${provider.name}:${provider.defaultModelName}');

        final result = await agent.run(
          'Hello',
          attachments: [], // Empty attachments
        );

        expect(result.output, isNotEmpty);
        // Should just have text part
        final userMessage = result.messages.firstWhere(
          (m) => m.role == MessageRole.user,
        );
        expect(userMessage.parts.whereType<TextPart>().length, equals(1));
        expect(userMessage.parts.whereType<DataPart>().length, equals(0));
      }, edgeCase: true);

      runProviderTest('handles very large images', (provider) async {
        final agent = Agent('${provider.name}:${provider.defaultModelName}');

        // Create a 1MB image
        final largeImage = Uint8List(1024 * 1024); // 1MB of zeros

        final result = await agent.run(
          'Can you process this large image?',
          attachments: [DataPart(bytes: largeImage, mimeType: 'image/png')],
        );

        expect(result.output, isNotEmpty);
      }, edgeCase: true);

      runProviderTest('handles unusual MIME types', (provider) async {
        final agent = Agent('${provider.name}:${provider.defaultModelName}');

        final data = Uint8List.fromList([0x47, 0x49, 0x46]); // GIF header

        final result = await agent.run(
          'What format is this?',
          attachments: [DataPart(bytes: data, mimeType: 'image/gif')],
        );

        expect(result.output, isNotEmpty);
      }, edgeCase: true);

      runProviderTest('handles attachment without text', (provider) async {
        final agent = Agent('${provider.name}:${provider.defaultModelName}');

        final imageData = Uint8List.fromList([1, 2, 3, 4]);

        final result = await agent.run(
          '', // Empty text
          attachments: [DataPart(bytes: imageData, mimeType: 'image/png')],
        );

        expect(result.output, isNotEmpty);
      }, edgeCase: true);

      runProviderTest('handles many attachments', (provider) async {
        final agent = Agent('${provider.name}:${provider.defaultModelName}');

        // Create 10 small images
        final attachments = List.generate(
          10,
          (i) =>
              DataPart(bytes: Uint8List.fromList([i]), mimeType: 'image/png'),
        );

        final result = await agent.run(
          'How many images are there?',
          attachments: attachments,
        );

        expect(result.output, isNotEmpty);
        // Verify all attachments are present
        final userMessage = result.messages.firstWhere(
          (m) => m.role == MessageRole.user,
        );
        expect(userMessage.parts.whereType<DataPart>().length, equals(10));
      }, edgeCase: true);
    });
  });
}
