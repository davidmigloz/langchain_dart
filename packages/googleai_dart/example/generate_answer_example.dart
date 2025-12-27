// ignore_for_file: avoid_print
import 'dart:io';

import 'package:googleai_dart/googleai_dart.dart';

/// Example demonstrating how to use the generateAnswer API for
/// grounded question answering.
///
/// generateAnswer provides answers grounded in specific sources,
/// making it ideal for Retrieval Augmented Generation (RAG) use cases.
///
/// This example shows inline passages approach for grounded answers.
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

    print('\n=== Example 2: Different Answer Styles ===\n');
    await demonstrateAnswerStyles(client);

    print('\n=== Example 3: Low Answerability Handling ===\n');
    await handleLowAnswerability(client);
  } finally {
    client.close();
  }
}

/// Example using inline passages - suitable for small, static knowledge bases.
Future<void> generateAnswerWithInlinePassages(GoogleAIClient client) async {
  final response = await client.models.generateAnswer(
    model: 'aqa',
    request: GenerateAnswerRequest(
      contents: [Content.text('What is the capital of France?')],
      answerStyle: AnswerStyle.abstractive,
      inlinePassages: GroundingPassages(
        passages: [
          GroundingPassage(
            id: 'passage-1',
            content: Content.text(
              'Paris is the capital and most populous city of France.',
            ),
          ),
          GroundingPassage(
            id: 'passage-2',
            content: Content.text(
              'France is a country in Western Europe. Its capital, Paris, '
              'is known for its art, fashion, and culture.',
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

/// Demonstrates different answer styles: abstractive, extractive, and verbose.
Future<void> demonstrateAnswerStyles(GoogleAIClient client) async {
  final passages = GroundingPassages(
    passages: [
      GroundingPassage(
        id: 'p1',
        content: Content.text(
          'Quantum computing uses quantum-mechanical phenomena such as '
          'superposition and entanglement to perform computation. Unlike '
          'classical computers that use bits, quantum computers use quantum '
          'bits or qubits.',
        ),
      ),
    ],
  );

  final question = Content.text('What is quantum computing?');

  // Abstractive: Succinct but abstract
  print('Style: ABSTRACTIVE (succinct, abstract)');
  final abstractive = await client.models.generateAnswer(
    model: 'aqa',
    request: GenerateAnswerRequest(
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
    request: GenerateAnswerRequest(
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
    request: GenerateAnswerRequest(
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
    request: GenerateAnswerRequest(
      contents: [Content.text('What is the meaning of life?')],
      answerStyle: AnswerStyle.abstractive,
      inlinePassages: GroundingPassages(
        passages: [
          GroundingPassage(
            id: 'unrelated',
            content: Content.text('The weather today is sunny and pleasant.'),
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
