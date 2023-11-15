import '../../documents/models/models.dart';
import '../../model_io/chat_models/models/models.dart';
import '../../model_io/prompts/models/models.dart';
import '../llm_chain.dart';
import '../models/models.dart';
import 'base.dart';
import 'reduce.dart';
import 'stuff.dart';

/// {@template map_reduce_documents_chain}
/// Chain that combines documents by mapping them individually and then
/// reducing the results.
///
/// This involves two chains:
/// - [mapLlmChain] this is the chain that maps the documents individually.
/// - [reduceDocumentsChain] this is the chain that reduces the results of
///  applying [mapLlmChain] to each document.
///
/// The chain works as follows:
/// - [mapLlmChain] is applied to each document individually.
/// - The results of applying [mapLlmChain] to each document are combined by
///   calling [reduceDocumentsChain] and the result is returned.
///
/// Example:
/// ```dart
/// final mapPrompt = PromptTemplate.fromTemplate(
///   'Summarize this content: {context}',
/// );
/// final mapLlmChain = LLMChain(prompt: mapPrompt, llm: llm);
/// final reducePrompt = PromptTemplate.fromTemplate(
///   'Combine these summaries: {context}',
/// );
/// final reduceLlmChain = LLMChain(prompt: reducePrompt, llm: llm);
/// final reduceDocsChain = StuffDocumentsChain(llmChain: reduceLlmChain);
/// final reduceChain = MapReduceDocumentsChain(
///   mapLlmChain: mapLlmChain,
///   reduceDocumentsChain: reduceDocsChain,
/// );
/// const docs = [
///   Document(pageContent: 'Hello 1!'),
///   Document(pageContent: 'Hello 2!'),
///   Document(pageContent: 'Hello 3!'),
/// ];
/// final res = await reduceChain.run(docs);
/// ```
/// {@endtemplate}
class MapReduceDocumentsChain extends BaseCombineDocumentsChain {
  /// {@macro map_reduce_documents_chain}
  MapReduceDocumentsChain({
    required this.mapLlmChain,
    required this.reduceDocumentsChain,
    super.inputKey = defaultInputKey,
    super.outputKey = defaultOutputKey,
    this.mapLlmChainDocumentPromptVar = defaultLlmChainDocumentPromptVar,
    this.returnIntermediateSteps = false,
  }) {
    _initLlmChainDocumentPromptVar();
  }

  /// Chain to apply to each document individually.
  final LLMChain mapLlmChain;

  /// Chain to use to reduce the results of applying [mapLlmChain] to each doc.
  /// This typically either a [ReduceDocumentsChain] or [StuffDocumentsChain].
  final BaseCombineDocumentsChain reduceDocumentsChain;

  /// The variable name in the [mapLlmChain] where to put the documents in.
  /// If only one variable in the [mapLlmChain], this doesn't need to be provided.
  String mapLlmChainDocumentPromptVar;

  /// Return the results of the map steps in the output.
  final bool returnIntermediateSteps;

  /// Default [inputKey] value.
  static const String defaultInputKey =
      BaseCombineDocumentsChain.defaultInputKey;

  /// Default [outputKey] value.
  static const String defaultOutputKey =
      BaseCombineDocumentsChain.defaultOutputKey;

  /// Default value for [mapLlmChainDocumentPromptVar].
  static const String defaultLlmChainDocumentPromptVar = 'context';

  /// Output key for the chain's intermediate steps output.
  static const intermediateStepsOutputKey = 'intermediate_steps';

  @override
  String get chainType => 'map_reduce_documents_chain';

  @override
  Set<String> get inputKeys => {
        inputKey,
        ...reduceDocumentsChain.inputKeys,
      };

  @override
  Set<String> get outputKeys => {
        outputKey,
        if (returnIntermediateSteps) intermediateStepsOutputKey,
      };

  void _initLlmChainDocumentPromptVar() {
    // If only one variable is present in the llmChain.prompt,
    // we can infer that the formatted documents should be passed in
    // with this variable name
    final llmChainInputVariables = mapLlmChain.prompt.inputVariables;
    if (llmChainInputVariables.length == 1) {
      mapLlmChainDocumentPromptVar = llmChainInputVariables.first;
    } else if (mapLlmChainDocumentPromptVar.isEmpty) {
      throw ArgumentError(
        'llmChainDocumentPromptVar must be provided if there are multiple '
        'llmChain input variables',
      );
    } else if (!llmChainInputVariables.contains(mapLlmChainDocumentPromptVar)) {
      throw ArgumentError(
        'llmChainDocumentPromptVar ($mapLlmChainDocumentPromptVar) was not found '
        'in llmChain input variables',
      );
    }
  }

  @override
  Future<int?> promptLength(
    final List<Document> docs, {
    final InputValues inputs = const {},
  }) async {
    // This combine method doesn't depend on the prompt length
    return null;
  }

  /// Combines the documents in a map reduce manner.
  ///
  /// First, mapping [mapLlmChain] over all documents, then reducing the results
  /// using [reduceDocumentsChain].
  ///
  /// - [docs] is the list of documents to combine.
  /// - [inputs] is a map of other inputs to use in the combination.
  ///
  /// Returns the output of the chain.
  @override
  Future<ChainValues> combineDocs(
    final List<Document> docs, {
    final InputValues inputs = const {},
  }) async {
    final mapResults = await mapLlmChain.apply(
      docs
          .map(
            (final d) => {
              ...inputs,
              mapLlmChainDocumentPromptVar: d.pageContent,
            },
          )
          .toList(growable: false),
    );

    final questionResultKey = mapLlmChain.outputKey;
    final resultDocs = List<Document>.generate(
      mapResults.length,
      (final i) => Document(
        pageContent: _getContent(mapResults[i][questionResultKey]),
        metadata: docs[i].metadata,
      ),
    );

    final output = await reduceDocumentsChain.combineDocs(
      resultDocs,
      inputs: inputs,
    );

    if (returnIntermediateSteps) {
      final intermediateSteps = mapResults
          .map((final r) => _getContent(r[questionResultKey]))
          .toList(growable: false);
      return {
        ...output,
        intermediateStepsOutputKey: intermediateSteps,
      };
    }

    return output;
  }

  String _getContent(final dynamic content) => switch (content) {
        final AIChatMessage resultMsg => resultMsg.content,
        _ => content,
      };
}
