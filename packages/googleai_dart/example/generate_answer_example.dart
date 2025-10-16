// ignore_for_file: avoid_print
import 'dart:io';

import 'package:googleai_dart/googleai_dart.dart';

/// Example demonstrating how to use the generateAnswer API for
/// grounded question answering.
///
/// generateAnswer provides answers grounded in specific sources,
/// making it ideal for Retrieval Augmented Generation (RAG) use cases.
///
/// This example shows both inline passages and semantic retriever approaches.
Future<void> main() async {
  // Get API key from environment
  final apiKey = Platform.environment['GOOGLEAI_API_KEY'];
  if (apiKey == null) {
    stderr.writeln('No GOOGLEAI_API_KEY environment variable');
    exit(1);
  }

  // Create client
  final client = GoogleAIClient(
    config: GoogleAIConfig(authProvider: ApiKeyProvider(apiKey)),
  );

  try {
    print(
      '=== Example 1: Inline Passages (Best for small knowledge bases) ===\n',
    );
    await generateAnswerWithInlinePassages(client);

    print('\n=== Example 2: Semantic Retriever (Best for large corpora) ===\n');
    await generateAnswerWithSemanticRetriever(client);

    print('\n=== Example 3: Different Answer Styles ===\n');
    await demonstrateAnswerStyles(client);

    print('\n=== Example 4: Low Answerability Handling ===\n');
    await handleLowAnswerability(client);
  } finally {
    client.close();
  }
}

/// Example using inline passages - suitable for small, static knowledge bases.
Future<void> generateAnswerWithInlinePassages(GoogleAIClient client) async {
  final response = await client.models.generateAnswer(
    model: 'aqa',
    request: const GenerateAnswerRequest(
      contents: [
        Content(
          parts: [TextPart('What is the capital of France?')],
          role: 'user',
        ),
      ],
      answerStyle: AnswerStyle.abstractive,
      inlinePassages: GroundingPassages(
        passages: [
          GroundingPassage(
            id: 'passage-1',
            content: Content(
              parts: [
                TextPart(
                  'Paris is the capital and most populous city of France.',
                ),
              ],
            ),
          ),
          GroundingPassage(
            id: 'passage-2',
            content: Content(
              parts: [
                TextPart(
                  'France is a country in Western Europe. Its capital, Paris, '
                  'is known for its art, fashion, and culture.',
                ),
              ],
            ),
          ),
        ],
      ),
      temperature: 0.2, // Low temperature for factual answers
    ),
  );

  print('Question: What is the capital of France?');
  print('Answer: ${_extractAnswerText(response)}');
  print('Answerability: ${response.answerableProbability ?? "N/A"}');

  if (response.inputFeedback?.blockReason != null) {
    print(
      'Warning: Input was blocked due to: ${response.inputFeedback!.blockReason}',
    );
  }
}

/// Example using Semantic Retriever - suitable for large, indexed corpora.
Future<void> generateAnswerWithSemanticRetriever(GoogleAIClient client) async {
  // First, create a corpus and populate it (simplified for example)
  print('Note: This example requires a pre-existing corpus.');
  print('See corpus_example.dart for how to create and populate corpora.\n');

  // Assuming you have a corpus named 'my-corpus'
  try {
    final response = await client.models.generateAnswer(
      model: 'aqa',
      request: const GenerateAnswerRequest(
        contents: [
          Content(
            parts: [TextPart('What are the key features of Dart?')],
            role: 'user',
          ),
        ],
        answerStyle: AnswerStyle.verbose,
        semanticRetriever: SemanticRetrieverConfig(
          source: 'corpora/my-corpus', // Replace with your corpus name
          query: Content(
            parts: [TextPart('Dart programming language features')],
          ),
          maxChunksCount: 5,
          minimumRelevanceScore: 0.5,
        ),
        temperature: 0.2,
      ),
    );

    print('Question: What are the key features of Dart?');
    print('Answer: ${_extractAnswerText(response)}');
    print('Answerability: ${response.answerableProbability ?? "N/A"}');
  } catch (e) {
    print('Skipping semantic retriever example (corpus not found): $e');
  }
}

/// Demonstrates different answer styles: abstractive, extractive, and verbose.
Future<void> demonstrateAnswerStyles(GoogleAIClient client) async {
  const passages = GroundingPassages(
    passages: [
      GroundingPassage(
        id: 'p1',
        content: Content(
          parts: [
            TextPart(
              'Quantum computing uses quantum-mechanical phenomena such as '
              'superposition and entanglement to perform computation. Unlike '
              'classical computers that use bits, quantum computers use quantum '
              'bits or qubits.',
            ),
          ],
        ),
      ),
    ],
  );

  const question = Content(
    parts: [TextPart('What is quantum computing?')],
    role: 'user',
  );

  // Abstractive: Succinct but abstract
  print('Style: ABSTRACTIVE (succinct, abstract)');
  final abstractive = await client.models.generateAnswer(
    model: 'aqa',
    request: const GenerateAnswerRequest(
      contents: [question],
      answerStyle: AnswerStyle.abstractive,
      inlinePassages: passages,
    ),
  );
  print('Answer: ${_extractAnswerText(abstractive)}\n');

  // Extractive: Brief and extractive
  print('Style: EXTRACTIVE (brief, extractive)');
  final extractive = await client.models.generateAnswer(
    model: 'aqa',
    request: const GenerateAnswerRequest(
      contents: [question],
      answerStyle: AnswerStyle.extractive,
      inlinePassages: passages,
    ),
  );
  print('Answer: ${_extractAnswerText(extractive)}\n');

  // Verbose: Detailed response
  print('Style: VERBOSE (detailed, comprehensive)');
  final verbose = await client.models.generateAnswer(
    model: 'aqa',
    request: const GenerateAnswerRequest(
      contents: [question],
      answerStyle: AnswerStyle.verbose,
      inlinePassages: passages,
    ),
  );
  print('Answer: ${_extractAnswerText(verbose)}');
}

/// Demonstrates handling low answerability probability.
Future<void> handleLowAnswerability(GoogleAIClient client) async {
  final response = await client.models.generateAnswer(
    model: 'aqa',
    request: const GenerateAnswerRequest(
      contents: [
        Content(
          parts: [TextPart('What is the meaning of life?')],
          role: 'user',
        ),
      ],
      answerStyle: AnswerStyle.abstractive,
      inlinePassages: GroundingPassages(
        passages: [
          GroundingPassage(
            id: 'unrelated',
            content: Content(
              parts: [TextPart('The weather today is sunny and pleasant.')],
            ),
          ),
        ],
      ),
    ),
  );

  print('Question: What is the meaning of life?');
  print('Answer: ${_extractAnswerText(response)}');
  print('Answerability: ${response.answerableProbability ?? "N/A"}');

  // Handle low answerability
  const threshold = 0.5;
  if (response.answerableProbability != null &&
      response.answerableProbability! < threshold) {
    print('\n⚠️  Low answerability detected!');
    print('Recommendation: The answer may not be grounded in the sources.');
    print('Consider:');
    print('  - Showing "We couldn\'t answer that question" to the user');
    print('  - Falling back to a general-purpose LLM');
    print('  - Providing additional or more relevant passages');
  }
}

/// Helper to extract answer text from response.
String _extractAnswerText(GenerateAnswerResponse response) {
  if (response.answer?.content?.parts.isEmpty ?? true) {
    return '(No answer provided)';
  }

  final parts = response.answer!.content!.parts;
  final textParts = parts.whereType<TextPart>();

  if (textParts.isEmpty) {
    return '(No text in answer)';
  }

  return textParts.map((p) => p.text).join(' ');
}
