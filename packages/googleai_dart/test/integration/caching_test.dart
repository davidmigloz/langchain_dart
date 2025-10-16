// ignore_for_file: avoid_print

import 'dart:io';
import 'package:googleai_dart/googleai_dart.dart';
import 'package:test/test.dart';

import 'test_config.dart';

/// Large content text to meet the minimum token requirement (1024 tokens).
/// This text is approximately 900+ words to comfortably exceed 1024 tokens.
const largeContentText = '''
# Introduction to Machine Learning and Artificial Intelligence

Machine learning is a subset of artificial intelligence that focuses on the development of algorithms and statistical models that enable computer systems to improve their performance on a specific task through experience. The fundamental premise of machine learning is that systems can learn from data, identify patterns, and make decisions with minimal human intervention.

## Historical Context and Evolution

The concept of machine learning has its roots in the mid-20th century, when pioneers like Alan Turing began exploring the question of whether machines could think. In 1950, Turing proposed what is now known as the Turing Test, a criterion of intelligence in a computer. The term "machine learning" was coined by Arthur Samuel in 1959, who defined it as a "field of study that gives computers the ability to learn without being explicitly programmed."

Throughout the 1960s and 1970s, researchers developed various approaches to machine learning, including neural networks and decision trees. However, progress was limited by computational power and the availability of data. The field experienced several "AI winters" where funding and interest diminished due to unmet expectations.

The resurgence of machine learning in the 1990s and 2000s was driven by three key factors: increased computational power, the availability of large datasets, and algorithmic innovations. The development of support vector machines, ensemble methods, and deep learning architectures revolutionized the field.

## Types of Machine Learning

Machine learning can be broadly categorized into three main types: supervised learning, unsupervised learning, and reinforcement learning.

Supervised learning involves training a model on a labeled dataset, where each example is paired with the correct output. The model learns to map inputs to outputs and can then make predictions on new, unseen data. Common supervised learning tasks include classification and regression. Applications range from email spam detection to medical diagnosis and stock price prediction.

Unsupervised learning deals with unlabeled data, where the model must find patterns and structures without explicit guidance. Clustering algorithms group similar data points together, while dimensionality reduction techniques simplify complex datasets. These methods are valuable for exploratory data analysis, customer segmentation, and anomaly detection.

Reinforcement learning focuses on training agents to make sequences of decisions by rewarding desired behaviors and punishing undesired ones. The agent learns through trial and error, exploring different actions and learning from the consequences. This approach has been successfully applied to game playing, robotics, and autonomous systems.

## Deep Learning and Neural Networks

Deep learning, a specialized subset of machine learning, uses artificial neural networks with multiple layers to model complex patterns in data. Inspired by the structure of the human brain, neural networks consist of interconnected nodes (neurons) organized in layers. Each connection has a weight that is adjusted during training to minimize prediction errors.

Convolutional Neural Networks (CNNs) excel at processing grid-like data such as images. They use specialized layers that can detect features like edges, textures, and shapes at different levels of abstraction. CNNs have revolutionized computer vision, enabling applications like facial recognition, object detection, and medical image analysis.

Recurrent Neural Networks (RNNs) and their variants, such as Long Short-Term Memory (LSTM) networks, are designed to handle sequential data. They maintain a form of memory that allows them to process sequences of varying lengths. These architectures are particularly effective for natural language processing, speech recognition, and time series analysis.

## Applications and Impact

Machine learning has transformed numerous industries and aspects of daily life. In healthcare, machine learning models assist in disease diagnosis, drug discovery, and personalized treatment plans. Financial institutions use machine learning for fraud detection, algorithmic trading, and credit scoring. Transportation systems benefit from machine learning through route optimization, traffic prediction, and the development of autonomous vehicles.

Natural language processing applications, powered by machine learning, enable virtual assistants, machine translation, and sentiment analysis. Recommendation systems used by streaming services, e-commerce platforms, and social media rely on machine learning to personalize user experiences. In manufacturing, machine learning optimizes production processes, predicts equipment failures, and improves quality control.

## Challenges and Future Directions

Despite remarkable progress, machine learning faces several challenges. Data quality and availability remain critical issues, as models require large amounts of high-quality labeled data for training. Bias in training data can lead to unfair or discriminatory outcomes, raising ethical concerns. The interpretability of complex models, particularly deep neural networks, is another significant challenge, as understanding why a model makes certain decisions is crucial for trust and accountability.

The future of machine learning promises exciting developments. Research continues on more efficient algorithms that require less data and computational resources. Transfer learning and few-shot learning aim to enable models to adapt quickly to new tasks with minimal training examples. Explainable AI seeks to make machine learning models more transparent and interpretable. Federated learning allows models to be trained across decentralized devices while preserving privacy.

As machine learning continues to evolve, it will undoubtedly play an increasingly important role in shaping technology and society.

The integration of machine learning into various sectors demonstrates its versatility and transformative potential. Educational institutions are leveraging machine learning to personalize learning experiences, adapt curricula to individual student needs, and predict academic performance. Environmental scientists use machine learning models to monitor climate change, predict natural disasters, and optimize resource management. The technology continues to advance rapidly, driven by increased computational resources, larger datasets, and innovative algorithmic approaches. As we move forward, the synergy between human intelligence and machine learning capabilities will likely unlock new possibilities and solutions to complex global challenges.
''';

/// Integration tests for caching operations.
///
/// These tests require a real API key set in the GEMINI_API_KEY
/// environment variable. If the key is not present, all tests are skipped.
void main() {
  String? apiKey;
  GoogleAIClient? client;

  setUpAll(() {
    apiKey = Platform.environment['GEMINI_API_KEY'];
    if (apiKey == null || apiKey!.isEmpty) {
      print(
        '⚠️  GEMINI_API_KEY not set. Integration tests will be skipped.\n'
        '   To run these tests, export GEMINI_API_KEY=your_api_key',
      );
    } else {
      client = GoogleAIClient(
        config: GoogleAIConfig(authProvider: ApiKeyProvider(apiKey!)),
      );
    }
  });

  tearDownAll(() {
    client?.close();
  });

  group('Caching Operations - Integration', () {
    test('creates and retrieves cached content', () async {
      if (apiKey == null) {
        markTestSkipped('API key not available');
        return;
      }

      // Create cached content with large text to meet 1024 token minimum
      final cachedContent = await client!.cachedContents.create(
        cachedContent: const CachedContent(
          model: 'models/$defaultGenerativeModel',
          displayName: 'Test Cache - System Instructions',
          systemInstruction: Content(
            parts: [
              TextPart(
                'You are an expert mathematician. '
                'Always provide detailed explanations.',
              ),
            ],
          ),
          contents: [
            Content(parts: [TextPart(largeContentText)], role: 'user'),
          ],
          ttl: '3600s', // 1 hour
        ),
      );

      // Verify creation
      expect(cachedContent, isNotNull);
      expect(cachedContent.name, isNotNull);
      expect(cachedContent.name, startsWith('cachedContents/'));
      expect(cachedContent.displayName, 'Test Cache - System Instructions');
      expect(cachedContent.model, 'models/$defaultGenerativeModel');
      expect(cachedContent.expireTime, isNotNull);
      expect(cachedContent.createTime, isNotNull);

      // Get the cached content
      final retrieved = await client!.cachedContents.get(
        name: cachedContent.name!,
      );
      expect(retrieved, isNotNull);
      expect(retrieved.name, cachedContent.name);
      expect(retrieved.displayName, cachedContent.displayName);

      // Clean up
      await client!.cachedContents.delete(name: cachedContent.name!);
    });

    test('creates cached content with contents', () async {
      if (apiKey == null) {
        markTestSkipped('API key not available');
        return;
      }

      final cachedContent = await client!.cachedContents.create(
        cachedContent: const CachedContent(
          model: 'models/$defaultGenerativeModel',
          displayName: 'Test Cache - With Contents',
          contents: [
            Content(parts: [TextPart(largeContentText)], role: 'user'),
          ],
          ttl: '3600s',
        ),
      );

      expect(cachedContent, isNotNull);
      expect(cachedContent.name, isNotNull);

      // Clean up
      await client!.cachedContents.delete(name: cachedContent.name!);
    });

    test('lists cached contents', () async {
      if (apiKey == null) {
        markTestSkipped('API key not available');
        return;
      }

      // Create a cached content first with large content
      final cachedContent = await client!.cachedContents.create(
        cachedContent: const CachedContent(
          model: 'models/$defaultGenerativeModel',
          displayName: 'Test Cache for Listing',
          contents: [
            Content(parts: [TextPart(largeContentText)], role: 'user'),
          ],
          ttl: '3600s',
        ),
      );

      // List cached contents
      final listResponse = await client!.cachedContents.list(pageSize: 10);
      expect(listResponse, isNotNull);
      expect(listResponse.cachedContents, isNotNull);
      expect(listResponse.cachedContents.length, greaterThanOrEqualTo(1));

      // Should find the one we just created
      final found = listResponse.cachedContents.any(
        (c) => c.name == cachedContent.name,
      );
      expect(found, isTrue);

      // Clean up
      await client!.cachedContents.delete(name: cachedContent.name!);
    });

    test('updates cached content TTL', () async {
      if (apiKey == null) {
        markTestSkipped('API key not available');
        return;
      }

      // Create cached content with large text
      final cachedContent = await client!.cachedContents.create(
        cachedContent: const CachedContent(
          model: 'models/$defaultGenerativeModel',
          displayName: 'Test Cache for Update',
          contents: [
            Content(parts: [TextPart(largeContentText)], role: 'user'),
          ],
          ttl: '3600s',
        ),
      );

      final originalExpireTime = cachedContent.expireTime;
      expect(originalExpireTime, isNotNull);

      // Update TTL
      final updated = await client!.cachedContents.update(
        name: cachedContent.name!,
        cachedContent: const CachedContent(
          model: 'models/$defaultGenerativeModel',
          ttl: '7200s', // 2 hours
        ),
        updateMask: 'ttl',
      );

      expect(updated, isNotNull);
      expect(updated.expireTime, isNotNull);
      // The new expire time should be later than the original
      expect(updated.expireTime!.isAfter(originalExpireTime!), isTrue);

      // Clean up
      await client!.cachedContents.delete(name: cachedContent.name!);
    });

    test('deletes cached content', () async {
      if (apiKey == null) {
        markTestSkipped('API key not available');
        return;
      }

      // Create cached content with large text
      final cachedContent = await client!.cachedContents.create(
        cachedContent: const CachedContent(
          model: 'models/$defaultGenerativeModel',
          displayName: 'Test Cache for Deletion',
          contents: [
            Content(parts: [TextPart(largeContentText)], role: 'user'),
          ],
          ttl: '3600s',
        ),
      );

      // Delete it
      await client!.cachedContents.delete(name: cachedContent.name!);

      // Try to get it - should fail
      try {
        await client!.cachedContents.get(name: cachedContent.name!);
        fail('Should have thrown exception for deleted cached content');
      } on ApiException catch (e) {
        // Expected - should get a 404 or similar error
        expect(e.code, greaterThanOrEqualTo(400));
      }
    });

    test('creates cached content with usage metadata', () async {
      if (apiKey == null) {
        markTestSkipped('API key not available');
        return;
      }

      final cachedContent = await client!.cachedContents.create(
        cachedContent: const CachedContent(
          model: 'models/$defaultGenerativeModel',
          displayName: 'Test Cache - Usage Metadata',
          contents: [
            Content(parts: [TextPart(largeContentText)], role: 'user'),
          ],
          ttl: '3600s',
        ),
      );

      expect(cachedContent, isNotNull);
      expect(cachedContent.usageMetadata, isNotNull);
      expect(cachedContent.usageMetadata!.totalTokenCount, greaterThan(0));

      // Clean up
      await client!.cachedContents.delete(name: cachedContent.name!);
    });
  });
}
