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

  // Categorize providers by their multi-modal capabilities
  const generalPurposeProviders = {
    'openai',
    'anthropic',
    'google',
    'google-openai',
    'openrouter',
  };

  const visionOnlyProviders = {
    'mistral',
    'cohere',
    'lambda',
    'together',
    'ollama',
    'ollama-openai',
    // 'fireworks', // Disabled - only supports URL images, not base64
  };

  // Helper to get vision-capable model name for vision-only providers
  String getVisionModelName(ChatProvider provider) => switch (provider.name) {
    'together' => 'meta-llama/Llama-3.2-11B-Vision-Instruct-Turbo',
    'lambda' => 'llama3.2-11b-vision-instruct',
    'ollama' => 'llava:7b',
    'ollama-openai' => 'llava:7b',
    'cohere' => 'c4ai-aya-vision-8b',
    _ => provider.defaultModelName,
  };

  bool isGeneralPurpose(ChatProvider provider) =>
      generalPurposeProviders.contains(provider.name);

  bool isVisionOnly(ChatProvider provider) =>
      visionOnlyProviders.contains(provider.name);

  // Helper to run tests on general-purpose providers
  void runGeneralPurposeTest(
    String description,
    Future<void> Function(ChatProvider provider, Agent agent) testFunction, {
    bool edgeCase = false,
  }) {
    final providers = edgeCase
        ? [ChatProvider.forName('google')] // Edge cases on Google only
        : ChatProvider.all.where(
            (p) => p.caps.contains(ProviderCaps.vision) && isGeneralPurpose(p),
          );

    for (final provider in providers) {
      // Use default model for general-purpose providers
      final agent = Agent('${provider.name}:${provider.defaultModelName}');

      test('${agent.model}: $description', () async {
        await testFunction(provider, agent);
      });
    }
  }

  // Helper to run tests on vision-only providers
  void runVisionOnlyTest(
    String description,
    Future<void> Function(ChatProvider provider, Agent agent) testFunction,
  ) {
    final providers = ChatProvider.all.where(
      (p) => p.caps.contains(ProviderCaps.vision) && isVisionOnly(p),
    );

    for (final provider in providers) {
      // Use vision-specific model for vision-only providers
      final modelName = getVisionModelName(provider);
      final agent = Agent('${provider.name}:$modelName');

      test('${agent.model}: $description', () async {
        await testFunction(provider, agent);
      });
    }
  }

  group('Multi-Modal', () {
    group('General-purpose multi-modal (images + text + PDFs)', () {
      runGeneralPurposeTest('handles single image attachment', (
        provider,
        agent,
      ) async {
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
      });

      runGeneralPurposeTest('handles multiple images', (provider, agent) async {
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
      });

      runGeneralPurposeTest('handles text with image', (provider, agent) async {
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

      runGeneralPurposeTest('handles text file attachment', (
        provider,
        agent,
      ) async {
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
      });

      runGeneralPurposeTest('handles PDF file attachment', (
        provider,
        agent,
      ) async {
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
      });

      runGeneralPurposeTest('handles mixed file types', (
        provider,
        agent,
      ) async {
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
      });

      // Link attachments - only test on providers that support external URLs
      for (final providerName in ['openai', 'anthropic']) {
        final provider = ChatProvider.forName(providerName);
        final agent = Agent('${provider.name}:${provider.defaultModelName}');

        test('${agent.model}: handles single URL attachment', () async {
          final result = await agent.run(
            'What animal is in this image?',
            attachments: [
              const LinkPart(
                url:
                    'https://upload.wikimedia.org/wikipedia/commons/b/bc/Juvenile_Ragdoll.jpg',
              ),
            ],
          );

          expect(result.output, isNotEmpty);
          // Verify the link is in the message
          final userMessage = result.messages.firstWhere(
            (m) => m.role == MessageRole.user,
          );
          expect(userMessage.parts.whereType<LinkPart>().length, equals(1));
        });

        test('${agent.model}: handles multiple URLs', () async {
          final result = await agent.run(
            'Compare these two cat images',
            attachments: [
              const LinkPart(
                url:
                    'https://upload.wikimedia.org/wikipedia/commons/b/bc/Juvenile_Ragdoll.jpg',
              ),
              const LinkPart(
                url:
                    'https://upload.wikimedia.org/wikipedia/commons/thumb/3/3a/Cat03.jpg/1200px-Cat03.jpg',
              ),
            ],
          );

          expect(result.output, isNotEmpty);
          // Verify both links are in the message
          final userMessage = result.messages.firstWhere(
            (m) => m.role == MessageRole.user,
          );
          expect(userMessage.parts.whereType<LinkPart>().length, equals(2));
        });
      }
    });

    group('Vision-only multi-modal (images only)', () {
      runVisionOnlyTest('handles single image attachment', (
        provider,
        agent,
      ) async {
        // Debug: verify correct model is being used
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
      });

      runVisionOnlyTest('handles multiple images', (provider, agent) async {
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
      });

      runVisionOnlyTest('handles text with image', (provider, agent) async {
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

    group('edge cases (Google only)', () {
      runGeneralPurposeTest('handles empty attachments list', (
        provider,
        agent,
      ) async {
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

      runGeneralPurposeTest('handles very large images', (
        provider,
        agent,
      ) async {
        // Use the pikachu image as our "large" image for this test
        final largeImage = testImageBytes;

        final result = await agent.run(
          'Can you process this large image?',
          attachments: [DataPart(bytes: largeImage, mimeType: 'image/png')],
        );

        expect(result.output, isNotEmpty);
      }, edgeCase: true);

      runGeneralPurposeTest('handles unusual MIME types', (
        provider,
        agent,
      ) async {
        // Use the pikachu image for this test too
        final data = testImageBytes;

        final result = await agent.run(
          'What format is this?',
          attachments: [DataPart(bytes: data, mimeType: 'image/png')],
        );

        expect(result.output, isNotEmpty);
      }, edgeCase: true);

      runGeneralPurposeTest('handles attachment without text', (
        provider,
        agent,
      ) async {
        final imageData = testImageBytes;

        final result = await agent.run(
          '', // Empty text
          attachments: [DataPart(bytes: imageData, mimeType: 'image/png')],
        );

        expect(result.output, isNotEmpty);
      }, edgeCase: true);

      runGeneralPurposeTest('handles many attachments', (
        provider,
        agent,
      ) async {
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
