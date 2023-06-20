import '../../documents/models/models.dart';
import '../../prompts/base_prompt.dart';
import '../../prompts/models/models.dart';
import '../../prompts/prompt.dart';
import '../llm_chain.dart';
import 'base.dart';

/// {@template stuff_documents_chain}
/// Chain that combines documents by stuffing into context.
/// {@endtemplate}
class StuffDocumentsChain extends BaseCombineDocumentsChain {
  /// {@macro stuff_documents_chain}
  StuffDocumentsChain({
    required this.llmChain,
    super.inputKey = 'input_documents',
    super.outputKey = 'output_text',
    this.documentPrompt = const PromptTemplate(
      inputVariables: {BaseCombineDocumentsChain.pageContentPromptVar},
      template: '{${BaseCombineDocumentsChain.pageContentPromptVar}}',
    ),
    this.documentVariableName = '',
    this.documentSeparator = '\n\n',
  }) {
    final llmChainInputVariables = llmChain.prompt.inputVariables;
    if (documentVariableName.isEmpty) {
      if (llmChainInputVariables.length == 1) {
        documentVariableName = llmChainInputVariables.first;
      } else {
        throw ArgumentError(
          'documentVariableName must be provided if there are multiple '
          'llmChain input variables',
        );
      }
    } else {
      if (!llmChainInputVariables.contains(documentVariableName)) {
        throw ArgumentError(
          'documentVariableName ($documentVariableName) was not found in '
          'llmChain input variables',
        );
      }
    }
  }

  /// LLM wrapper to use after formatting documents.
  final LLMChain llmChain;

  /// Prompt to use to format each document.
  final BasePromptTemplate documentPrompt;

  /// The variable name in the [llmChain] to put the documents in.
  /// If only one variable in the [llmChain], this doesn't need to be provided.
  String documentVariableName;

  /// The string with which to join the formatted documents.
  final String documentSeparator;

  @override
  Set<String> get inputKeys => {
        inputKey,
        ...llmChain.inputKeys.difference({documentVariableName}),
      };

  @override
  String get chainType => 'stuff_documents_chain';

  /// Stuff all documents into one prompt and pass to LLM.
  ///
  /// - [docs] the documents to combine.
  @override
  Future<(String output, Map<String, dynamic> extraInfo)> combineDocs(
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
      documentVariableName: docStrings.join(documentSeparator),
    };
  }
}
