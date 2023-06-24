import '../../documents/models/models.dart';
import '../../model_io/prompts/prompts.dart';
import '../llm_chain.dart';
import 'base.dart';

/// {@template stuff_documents_chain}
/// Chain that combines documents by stuffing into context.
///
/// It expects a `List<Document>` as input, combines the documents and calls
/// the [llmChain] with the stuffed documents as input (using
/// [llmChainStuffedDocumentInputKey] as input key).
///
/// The content of each document is formatted using [documentPrompt].
/// By default, it just takes the content of the document.
/// {@endtemplate}
class StuffDocumentsChain extends BaseCombineDocumentsChain {
  /// {@macro stuff_documents_chain}
  StuffDocumentsChain({
    required this.llmChain,
    super.inputKey = defaultInputKey,
    super.outputKey = defaultOutputKey,
    this.documentPrompt = const PromptTemplate(
      inputVariables: {StuffDocumentsChain.pageContentPromptVar},
      template: '{${StuffDocumentsChain.pageContentPromptVar}}',
    ),
    this.llmChainStuffedDocumentInputKey =
        defaultLlmChainStuffedDocumentInputKey,
    this.documentSeparator = '\n\n',
  }) {
    _initLlmChainDocumentInputKey();
  }

  /// LLM wrapper to use after formatting documents.
  final LLMChain llmChain;

  /// Prompt to use to format each document.
  final BasePromptTemplate documentPrompt;

  /// The key in the [llmChain] input values where to put the documents in.
  /// If only one variable in the [llmChain], this doesn't need to be provided.
  String llmChainStuffedDocumentInputKey;

  /// The string with which to join the formatted documents.
  final String documentSeparator;

  /// Default [inputKey] value.
  static const String defaultInputKey =
      BaseCombineDocumentsChain.defaultInputKey;

  /// Default [outputKey] value.
  static const String defaultOutputKey =
      BaseCombineDocumentsChain.defaultOutputKey;

  /// Default value for [llmChainStuffedDocumentInputKey].
  static const String defaultLlmChainStuffedDocumentInputKey = 'context';

  /// Prompt variable to use for the page content.
  static const pageContentPromptVar =
      BaseCombineDocumentsChain.pageContentPromptVar;

  @override
  Set<String> get inputKeys => {
        inputKey,
        ...llmChain.inputKeys.difference({llmChainStuffedDocumentInputKey}),
      };

  @override
  String get chainType => 'stuff_documents_chain';

  void _initLlmChainDocumentInputKey() {
    final llmChainInputVariables = llmChain.prompt.inputVariables;
    if (llmChainInputVariables.length == 1) {
      llmChainStuffedDocumentInputKey = llmChainInputVariables.first;
    } else if (llmChainStuffedDocumentInputKey.isEmpty) {
      throw ArgumentError(
        'llmChainDocumentInputKey must be provided if there are multiple '
        'llmChain input variables',
      );
    } else if (!llmChainInputVariables
        .contains(llmChainStuffedDocumentInputKey)) {
      throw ArgumentError(
        'llmChainDocumentInputKey ($llmChainStuffedDocumentInputKey) was not found in '
        'llmChain input variables',
      );
    }
  }

  /// Stuff all documents into one prompt and pass to LLM.
  ///
  /// - [docs] the documents to combine.
  @override
  Future<(dynamic output, Map<String, dynamic> extraInfo)> combineDocs(
    final List<Document> docs, {
    final InputValues inputs = const {},
  }) async {
    final llmInputs = _getInputs(docs, inputs);
    final llmOutput = await llmChain.run(llmInputs);
    return (llmOutput, const <String, dynamic>{});
  }

  /// Returns a map with all the input values for the prompt and the
  /// a string containing all the formatted documents to be passed in the
  /// prompt.
  Map<String, dynamic> _getInputs(
    final List<Document> docs,
    final InputValues inputs,
  ) {
    // Format each document according to the prompt
    final docStrings = docs
        .map((final doc) => formatDocument(doc, documentPrompt))
        .toList(growable: false);
    // Join the documents together to put them in the prompt
    final promptInputValues = {
      for (final key in inputs.keys)
        if (llmChain.prompt.inputVariables.contains(key)) key: inputs[key],
    };

    return {
      ...promptInputValues,
      llmChainStuffedDocumentInputKey: docStrings.join(documentSeparator),
    };
  }
}
