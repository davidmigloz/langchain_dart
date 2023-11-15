import '../../documents/models/models.dart';
import '../../model_io/chat_models/models/models.dart';
import '../../model_io/prompts/prompts.dart';
import '../llm_chain.dart';
import '../models/models.dart';
import 'base.dart';

/// {@template stuff_documents_chain}
/// Chain that combines documents by stuffing into context.
///
/// This chain takes a list of documents and first combines them into a single
/// string. It does this by formatting each document into a string with the
/// [documentPrompt] and then joining them together with [documentSeparator].
/// It then adds that new resulting string to the inputs with the variable
/// name set by [llmChainStuffedDocumentPromptVar]. Those inputs are then
/// passed to the [llmChain] who will format the prompt and call the model.
///
/// The content of each document is formatted using [documentPrompt].
/// By default, it just takes the content of the document.
///
/// Example:
/// ```dart
/// final prompt = PromptTemplate.fromTemplate(
///   'Print {foo}. Context: {context}',
/// );
/// final llm = OpenAI(apiKey: openaiApiKey);
/// final llmChain = LLMChain(prompt: prompt, llm: llm);
/// final stuffChain = StuffDocumentsChain(llmChain: llmChain)
/// const foo = 'Hello world!';
/// const docs = [
///   Document(pageContent: 'Hello 1!'),
///   Document(pageContent: 'Hello 2!'),
/// ];
/// final res = await stuffChain.call({
///   'foo': foo,
///   'input_documents': docs,
/// });
/// ```
/// {@endtemplate}
class StuffDocumentsChain extends BaseCombineDocumentsChain {
  /// {@macro stuff_documents_chain}
  StuffDocumentsChain({
    required this.llmChain,
    super.inputKey = defaultInputKey,
    super.outputKey = defaultOutputKey,
    this.documentPrompt = defaultDocumentPrompt,
    this.documentSeparator = defaultDocumentSeparator,
    this.llmChainStuffedDocumentPromptVar =
        defaultLlmChainStuffedDocumentPromptVar,
  }) {
    _initLlmChainDocumentPromptVar();
  }

  /// LLM wrapper to use after formatting documents.
  final LLMChain llmChain;

  /// Prompt to use to format each document.
  final BasePromptTemplate documentPrompt;

  /// The string with which to join the formatted documents.
  final String documentSeparator;

  /// The variable name in the [LLMChain.prompt] where to put the documents in.
  /// If only one variable in the [llmChain], this doesn't need to be provided.
  String llmChainStuffedDocumentPromptVar;

  /// Default [inputKey] value.
  static const defaultInputKey = BaseCombineDocumentsChain.defaultInputKey;

  /// Default [outputKey] value.
  static const defaultOutputKey = BaseCombineDocumentsChain.defaultOutputKey;

  /// Default [documentPrompt] value.
  static const defaultDocumentPrompt = PromptTemplate(
    inputVariables: {StuffDocumentsChain.pageContentPromptVar},
    template: '{${StuffDocumentsChain.pageContentPromptVar}}',
  );

  /// Default value for [documentSeparator].
  static const defaultDocumentSeparator = '\n\n';

  /// Default value for [llmChainStuffedDocumentPromptVar].
  static const defaultLlmChainStuffedDocumentPromptVar = 'context';

  /// Prompt variable to use for the page content.
  static const pageContentPromptVar =
      BaseCombineDocumentsChain.pageContentPromptVar;

  @override
  Set<String> get inputKeys => {
        inputKey,
        ...llmChain.inputKeys.difference({llmChainStuffedDocumentPromptVar}),
      };

  @override
  String get chainType => 'stuff_documents_chain';

  void _initLlmChainDocumentPromptVar() {
    // If only one variable is present in the llmChain.prompt,
    // we can infer that the formatted documents should be passed in
    // with this variable name
    final llmChainInputVariables = llmChain.prompt.inputVariables;
    if (llmChainInputVariables.length == 1) {
      llmChainStuffedDocumentPromptVar = llmChainInputVariables.first;
    } else if (llmChainStuffedDocumentPromptVar.isEmpty) {
      throw ArgumentError(
        'llmChainStuffedDocumentPromptVar must be provided if there are '
        'multiple llmChain input variables',
      );
    } else if (!llmChainInputVariables
        .contains(llmChainStuffedDocumentPromptVar)) {
      throw ArgumentError(
        'llmChainStuffedDocumentPromptVar ($llmChainStuffedDocumentPromptVar) '
        'was not found in llmChain input variables',
      );
    }
  }

  @override
  Future<int?> promptLength(
    final List<Document> docs, {
    final InputValues inputs = const {},
  }) {
    final llmInputs = _getInputs(docs, inputs);
    final prompt = llmChain.prompt.formatPrompt(llmInputs);
    return llmChain.llm.countTokens(prompt);
  }

  /// Stuff all documents into one prompt and pass to LLM.
  ///
  /// - [docs] the documents to combine.
  /// - [inputs] the inputs to pass to the [llmChain].
  ///
  /// Returns the output of the chain.
  @override
  Future<ChainValues> combineDocs(
    final List<Document> docs, {
    final InputValues inputs = const {},
  }) async {
    final llmInputs = _getInputs(docs, inputs);
    final llmOutput = await llmChain.call(llmInputs);
    final content = llmOutput[llmChain.outputKey];
    final output = switch (content) {
      final AIChatMessage resultMsg => resultMsg.content,
      _ => content,
    };
    return {
      outputKey: output,
      if (!llmChain.returnFinalOnly)
        LLMChain.fullGenerationOutputKey:
            llmOutput[LLMChain.fullGenerationOutputKey],
    };
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
      llmChainStuffedDocumentPromptVar: docStrings.join(documentSeparator),
    };
  }
}
