/// TESTING PHILOSOPHY:
/// 1. DO NOT catch exceptions - let them bubble up for diagnosis
/// 2. DO NOT add provider filtering except by capabilities (e.g. ProviderCaps)
/// 3. DO NOT add performance tests
/// 4. DO NOT add regression tests
/// 5. 80% cases = common usage patterns tested across ALL capable providers
/// 6. Edge cases = rare scenarios tested on Google only to avoid timeouts
/// 7. Each functionality should only be tested in ONE file - no duplication

import 'dart:io';
import 'dart:typed_data';

import 'package:langchain_compat/langchain_compat.dart';
import 'package:test/test.dart';

void main() {
  late Uint8List testImageBytes;
  late Uint8List testTextBytes;
  late Uint8List testPdfBytes;

  setUpAll(() async {
    // Load test files once for all tests
    testImageBytes = await File('test/files/pikachu.png').readAsBytes();
    testTextBytes = await File('test/files/bio.txt').readAsBytes();
    testPdfBytes = await File('test/files/Tiny PDF.pdf').readAsBytes();
  });

  // Helper to get vision-capable model name for a provider
  String getVisionModelName(ChatProvider provider) => switch (provider.name) {
    'together' => 'meta-llama/Llama-3.2-11B-Vision-Instruct-Turbo',
    'lambda' => 'llama3.2-11b-vision-instruct',
    'ollama' => 'llava:7b',
    'ollama-openai' => 'llava:7b',
    'fireworks' => 'accounts/fireworks/models/llama-v3p1-70b-instruct',
    _ => provider.defaultModelName,
  };
  
  // Helper to get model name based on test requirements
  String getModelName(ChatProvider provider, {bool visionOnly = false}) {
    if (visionOnly) {
      return getVisionModelName(provider);
    }
    return provider.defaultModelName;
  }

  // Helper to run parameterized tests
  void runProviderTest(
    String description,
    Future<void> Function(ChatProvider provider, Agent agent) testFunction, {
    Set<ProviderCaps>? requiredCaps,
    bool edgeCase = false,
    bool visionOnly = false,
  }) {
    final providers = edgeCase
        ? [ChatProvider.forName('google')] // Edge cases on Google only
        : ChatProvider.all.where(
            (p) =>
                requiredCaps == null ||
                requiredCaps.every((cap) => p.caps.contains(cap)),
          );

    for (final provider in providers) {
      // Create agent with appropriate model based on test type
      final modelName = getModelName(provider, visionOnly: visionOnly);
      final agent = Agent('${provider.name}:$modelName');
      
      test('${agent.model}: $description', () async {
        await testFunction(provider, agent);
      });
    }
  }

  group('Multi-Modal', () {
    group('image attachments (80% cases)', () {
      runProviderTest(
          'handles single image attachment', (provider, agent) async {
        // Debug: verify correct model is being used for Together
        if (provider.name == 'together') {
          expect(
            agent.model,
            contains('meta-llama/Llama-3.2-11B-Vision-Instruct-Turbo'),
          );
        }

        // Use the pre-loaded test image
        final imageData = testImageBytes;

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
      }, requiredCaps: {ProviderCaps.vision}, visionOnly: true);

      runProviderTest(
          'handles multiple images', (provider, agent) async {

        // Use pre-loaded test images
        final image1 = testImageBytes;
        final image2 = testImageBytes;

        final result = await agent.run(
          'How many images do you see?',
          attachments: [
            DataPart(bytes: image1, mimeType: 'image/png'),
            DataPart(bytes: image2, mimeType: 'image/png'),
          ],
        );

        expect(result.output, isNotEmpty);
        // Verify both attachments are in the message
        final userMessage = result.messages.firstWhere(
          (m) => m.role == MessageRole.user,
        );
        expect(userMessage.parts.whereType<DataPart>().length, equals(2));
      }, requiredCaps: {ProviderCaps.vision}, visionOnly: true);

      runProviderTest('handles text with image', (provider, agent) async {

        final imageData = testImageBytes;

        final result = await agent.run(
          'What type of file is this?',
          attachments: [DataPart(bytes: imageData, mimeType: 'image/png')],
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
      runProviderTest(
          'handles single URL attachment', (provider, agent) async {

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

      runProviderTest('handles multiple URLs', (provider, agent) async {

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

    group('text file attachments (80% cases)', () {
      // Note: Text files are converted to text content for providers that
      // don't support native file attachments
      runProviderTest('handles text file attachment', (provider, agent) async {
        final result = await agent.run(
          'Summarize this text file',
          attachments: [DataPart(bytes: testTextBytes, mimeType: 'text/plain')],
        );

        expect(result.output, isNotEmpty);
        // Verify the message has the attachment
        final userMessage = result.messages.firstWhere(
          (m) => m.role == MessageRole.user,
        );
        expect(userMessage.parts.whereType<DataPart>().length, equals(1));
      }, requiredCaps: {ProviderCaps.chat}); // All chat providers

      runProviderTest('handles PDF file attachment', (provider, agent) async {
        final result = await agent.run(
          'What does this PDF contain?',
          attachments: [
            DataPart(bytes: testPdfBytes, mimeType: 'application/pdf'),
          ],
        );

        expect(result.output, isNotEmpty);
        // Verify the message has the attachment
        final userMessage = result.messages.firstWhere(
          (m) => m.role == MessageRole.user,
        );
        expect(userMessage.parts.whereType<DataPart>().length, equals(1));
      }, requiredCaps: {ProviderCaps.chat}); // All chat providers

      runProviderTest('handles mixed file types', (provider, agent) async {
        final result = await agent.run(
          'Compare the image and text content',
          attachments: [
            DataPart(bytes: testImageBytes, mimeType: 'image/png'),
            DataPart(bytes: testTextBytes, mimeType: 'text/plain'),
          ],
        );

        expect(result.output, isNotEmpty);
        // Verify both attachments are in the message
        final userMessage = result.messages.firstWhere(
          (m) => m.role == MessageRole.user,
        );
        expect(userMessage.parts.whereType<DataPart>().length, equals(2));
      }, requiredCaps: {ProviderCaps.chat}); // All chat providers
    });

    group('mixed attachments (80% cases)', () {
      runProviderTest(
          'handles image and URL together', (provider, agent) async {

        final imageData = testImageBytes;

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
      runProviderTest(
          'handles empty attachments list', (provider, agent) async {

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

      runProviderTest('handles very large images', (provider, agent) async {

        // Use the pikachu image as our "large" image for this test
        final largeImage = testImageBytes;

        final result = await agent.run(
          'Can you process this large image?',
          attachments: [DataPart(bytes: largeImage, mimeType: 'image/png')],
        );

        expect(result.output, isNotEmpty);
      }, edgeCase: true);

      runProviderTest('handles unusual MIME types', (provider, agent) async {

        // Use the pikachu image for this test too
        final data = testImageBytes;

        final result = await agent.run(
          'What format is this?',
          attachments: [DataPart(bytes: data, mimeType: 'image/png')],
        );

        expect(result.output, isNotEmpty);
      }, edgeCase: true);

      runProviderTest(
          'handles attachment without text', (provider, agent) async {

        final imageData = testImageBytes;

        final result = await agent.run(
          '', // Empty text
          attachments: [DataPart(bytes: imageData, mimeType: 'image/png')],
        );

        expect(result.output, isNotEmpty);
      }, edgeCase: true);

      runProviderTest('handles many attachments', (provider, agent) async {

        // Create 10 small images using pre-loaded data
        final attachments = List.generate(
          10,
          (i) => DataPart(bytes: testImageBytes, mimeType: 'image/png'),
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
