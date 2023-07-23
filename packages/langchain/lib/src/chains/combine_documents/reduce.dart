import '../../documents/models/models.dart';
import '../../model_io/prompts/models/models.dart';
import '../models/models.dart';
import 'base.dart';
import 'stuff.dart';

/// {@template reduce_documents_chain}
/// Chain that combines documents by recursively reducing them if needed.
///
/// This involves two chains:
/// - [combineDocumentsChain] this is the chain that combines the documents.
/// - [collapseDocumentsChain] this is the chain that collapses the documents
///   if they exceed [tokenMax].
///
/// The chain works as follows:
/// - If the number of tokens resulting of formatting the prompt from
///   [combineDocumentsChain] is less than [tokenMax], then
///   [combineDocumentsChain] is called with the documents and the result is
///   returned.
/// - Otherwise, the documents are split into groups of max [tokenMax]
///   tokens and [collapseDocumentsChain] is called for each group. Then, the
///   resulting documents are combined by calling [combineDocumentsChain] and
///   the result is returned.
///
/// Example:
/// ```dart
/// final finalPrompt = PromptTemplate.fromTemplate(
///   'Summarize this content: {context}',
/// );
/// final finalLlmChain = LLMChain(prompt: finalPrompt, llm: llm);
/// final combineDocsChain = StuffDocumentsChain(llmChain: finalLlmChain);
///
/// final collapsePrompt = PromptTemplate.fromTemplate(
///   'Collapse this content: {context}',
/// );
/// final collapseLlmChain = LLMChain(prompt: collapsePrompt, llm: llm);
/// final collapseDocsChain = StuffDocumentsChain(llmChain: collapseLlmChain);
///
/// final reduceChain = ReduceDocumentsChain(
///   combineDocumentsChain: combineDocsChain,
///   collapseDocumentsChain: collapseDocsChain,
/// );
///
/// const docs = [
///   Document(pageContent: 'Hello world 1!'),
///   Document(pageContent: 'Hello world 2!'),
///   Document(pageContent: 'Hello world 3!'),
///   Document(pageContent: 'Hello world 4!'),
/// ];
/// final res = await reduceChain.run(docs);
/// ```
/// {@endtemplate}
class ReduceDocumentsChain extends BaseCombineDocumentsChain {
  /// {@macro reduce_documents_chain}
  const ReduceDocumentsChain({
    super.inputKey = defaultInputKey,
    super.outputKey = defaultOutputKey,
    required this.combineDocumentsChain,
    this.collapseDocumentsChain,
    this.tokenMax = defaultTokenMax,
  });

  /// Final chain to call to combine documents.
  /// This is typically a [StuffDocumentsChain].
  final BaseCombineDocumentsChain combineDocumentsChain;

  /// Chain to use to collapse documents if needed until they can all fit.
  /// If null, [combineDocumentsChain] will be used.
  /// This is typically a [StuffDocumentsChain].
  final BaseCombineDocumentsChain? collapseDocumentsChain;

  /// The maximum number of tokens to group documents into. For example, if
  /// set to 3000 then documents will be grouped into chunks of no greater than
  /// 3000 tokens before trying to combine them into a smaller chunk.
  ///
  /// This is useful to avoid exceeding the context size when combining the
  /// documents.
  ///
  /// It is assumed that each document to combine is less than
  /// [tokenMax] tokens.
  final int tokenMax;

  /// Default [inputKey] value.
  static const defaultInputKey = BaseCombineDocumentsChain.defaultInputKey;

  /// Default [outputKey] value.
  static const defaultOutputKey = BaseCombineDocumentsChain.defaultOutputKey;

  /// Default [tokenMax] value.
  static const defaultTokenMax = 3000;

  @override
  String get chainType => 'reduce_documents_chain';

  @override
  Future<int?> promptLength(
    final List<Document> docs, {
    final InputValues inputs = const {},
  }) async {
    // This combine method doesn't depend on the prompt length
    return null;
  }

  /// Combine multiple documents.
  ///
  /// - [docs] the documents to combine. It is assumed that each one is less
  ///   than [tokenMax] tokens.
  /// - [inputs] additional parameters to be passed to LLM calls (like other
  ///   input variables besides the documents).
  ///
  /// Returns the output of the chain.
  @override
  Future<ChainValues> combineDocs(
    final List<Document> docs, {
    final InputValues inputs = const {},
  }) async {
    final resultDocs = await _splitAndCollapseDocs(
      docs,
      inputs: inputs,
    );
    return combineDocumentsChain.combineDocs(resultDocs, inputs: inputs);
  }

  /// Splits the documents into smaller chunks that are each less than
  /// [tokenMax] tokens. And then collapses them into a single document.
  Future<List<Document>> _splitAndCollapseDocs(
    final List<Document> docs, {
    final InputValues inputs = const {},
  }) async {
    final lengthFunc = combineDocumentsChain.promptLength;

    List<Document> resultDocs = docs;
    int? numTokens = await lengthFunc(resultDocs, inputs: inputs);

    while (numTokens != null && numTokens > tokenMax) {
      final newResultDocList = await _splitDocs(
        docs,
        inputs,
        lengthFunc,
        tokenMax,
      );
      resultDocs = [];
      for (final docs in newResultDocList) {
        final newDoc = await _collapseDocs(docs, inputs);
        resultDocs.add(newDoc);
      }
      numTokens = await lengthFunc(resultDocs, inputs: inputs);
    }

    return resultDocs;
  }

  /// Split a list of documents into smaller lists of documents that are each
  /// less than [tokenMax] tokens.
  Future<List<List<Document>>> _splitDocs(
    final List<Document> docs,
    final InputValues inputs,
    final Future<int?> Function(
      List<Document> docs, {
      InputValues inputs,
    }) lengthFunc,
    final int tokenMax,
  ) async {
    final List<List<Document>> newResultDocList = [];
    List<Document> subResultDocs = [];

    for (final doc in docs) {
      subResultDocs.add(doc);
      final numTokens = await lengthFunc(subResultDocs, inputs: inputs);
      if (numTokens != null && numTokens > tokenMax) {
        assert(
          subResultDocs.length > 1,
          'We should never have a single document that is longer than the tokenMax.',
        );
        newResultDocList.add(
          subResultDocs.sublist(0, subResultDocs.length - 1),
        );
        subResultDocs = subResultDocs.sublist(subResultDocs.length - 1);
      }
    }
    newResultDocList.add(subResultDocs);
    return newResultDocList;
  }

  /// Combines multiple documents into one using [collapseDocumentsChain] (or
  /// [combineDocumentsChain] if [collapseDocumentsChain] is null).
  /// The metadata of the different documents is also combined.
  Future<Document> _collapseDocs(
    final List<Document> docs,
    final InputValues inputs,
  ) async {
    final collapseChain = collapseDocumentsChain ?? combineDocumentsChain;
    final result = await collapseChain.run({
      ...inputs,
      BaseCombineDocumentsChain.defaultInputKey: docs,
    });
    final combinedMetadata = {...docs[0].metadata};
    for (var i = 1; i < docs.length; i++) {
      docs[i].metadata.forEach((final key, final value) {
        if (combinedMetadata.containsKey(key) && value is String) {
          combinedMetadata[key] = '${combinedMetadata[key]}, $value';
        } else {
          combinedMetadata[key] = value;
        }
      });
    }
    return Document(pageContent: result, metadata: combinedMetadata);
  }
}
