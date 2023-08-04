import '../../model_io/language_models/language_models.dart';
import '../../model_io/prompts/prompts.dart';
import '../combine_documents/combine_documents.dart';
import '../llm_chain.dart';

const _template = '''
Write a concise summary of the following:


"{context}"


CONCISE SUMMARY:''';

const _promptTemplate = PromptTemplate(
  template: _template,
  inputVariables: {'context'},
);

/// Chain for summarizing documents.
///
/// There are two methods to summarize documents:
/// - [stuff] uses the [StuffDocumentsChain] to combine all the documents into
///   a single string, then prompts the model to summarize that string. This
///   method is limited by the context length limit of the model.
/// - [mapReduce] uses the [MapReduceDocumentsChain] to summarize each document
///   individually, then combines the results into a single summary.
abstract class SummarizeChain {
  /// The [stuff] method uses the [StuffDocumentsChain] to combine all the
  /// documents into a single string, then prompts the model to summarize that
  /// string. This method is limited by the context length limit of the [llm].
  ///
  /// - [llm] is the language model to use for summarization.
  /// - [inputKey] is the input key where the documents to summarize will be
  ///   placed.
  /// - [outputKey] is the output key where the summary will be placed.
  /// - [promptTemplate] is the prompt to use to summarize the documents.
  ///   The default prompt template instructs the model to create a
  ///   "concise summary".
  /// - [documentPrompt] is the prompt to use to format each document before
  ///   combining them. The default prompt just takes the content of the
  ///   document.
  /// - [stuffedDocumentPromptVar] is the variable used in the [promptTemplate]
  ///   to indicate where the stuffed document should be placed.
  /// - [documentSeparator] is the separator used to join the documents while
  ///   stuffing them.
  ///
  /// Example:
  /// ```dart
  /// final loader = TextLoader('path/to/file.txt');
  /// final docs = await loader.load();
  ///
  /// const textSplitter = RecursiveCharacterTextSplitter();
  /// final docsChunks = textSplitter.splitDocuments(docs);
  ///
  /// final llm = ChatOpenAI(apiKey: openAIKey);
  /// final summarizeChain = SummarizeChain.stuff(llm: llm);
  ///
  /// final summary = await summarizeChain.run(docsChunks);
  /// ```
  static StuffDocumentsChain stuff({
    required final BaseLanguageModel llm,
    final String inputKey = SummarizeChain.defaultInputKey,
    final String outputKey = SummarizeChain.defaultOutputKey,
    final BasePromptTemplate promptTemplate = _promptTemplate,
    final BasePromptTemplate documentPrompt =
        StuffDocumentsChain.defaultDocumentPrompt,
    final String stuffedDocumentPromptVar =
        StuffDocumentsChain.defaultLlmChainStuffedDocumentPromptVar,
    final String documentSeparator =
        StuffDocumentsChain.defaultDocumentSeparator,
  }) {
    final llmChain = LLMChain(
      llm: llm,
      prompt: promptTemplate,
    );

    return StuffDocumentsChain(
      llmChain: llmChain,
      inputKey: inputKey,
      outputKey: outputKey,
      documentPrompt: documentPrompt,
      llmChainStuffedDocumentPromptVar: stuffedDocumentPromptVar,
      documentSeparator: documentSeparator,
    );
  }

  /// The [mapReduce] method uses the [MapReduceDocumentsChain] to summarize
  /// each document individually, then combines the results into a single
  /// summary.
  ///
  /// The [MapReduceDocumentsChain] involves two chains behind the scenes:
  /// - [MapReduceDocumentsChain.mapLlmChain] this is the chain that is applied
  ///   to each document to create a summary.
  /// - [MapReduceDocumentsChain.reduceDocumentsChain] this is a
  ///   [ReduceDocumentsChain] that reduces the summaries of each document into
  ///   a single summary.
  ///
  /// - [llm] is the language model to use for summarization.
  /// - [inputKey] is the input key where the documents to summarize will be
  ///   placed.
  /// - [outputKey] is the output key where the summary will be placed.
  /// - [mapPrompt] is the prompt to use to summarize each document
  ///   individually.
  /// - [mapDocumentPromptVar] is the variable used in the [mapPrompt] to
  ///   indicate where the document should be placed.
  /// - [combinePrompt] is the prompt to use to summarize the summaries of each
  ///   document.
  /// - [combineLlm] is the language model to use to summarize the summaries of
  ///   each document. By default, [llm] is used.
  /// - [combineDocumentPrompt] is the prompt to use to format each individual
  ///   document before summarizing it. The default prompt just takes the
  ///   content of the document.
  /// - [combineDocumentPromptVar] is the variable used in the [combinePrompt]
  ///   to indicate where the summaries should be placed.
  /// - [combineDocumentSeparator] is the separator used to join the summaries.
  /// - [combineInputMaxTokens] is the maximum number of tokens allowed for the
  ///   input of the final combine call. If the sum of the lengths of the
  ///   summaries of each document exceeds this limit, the summaries will be
  ///   collapsed using [collapseLlm] before they are combined into the final
  ///   summary. Set this to a value lower than the context length limit of the
  ///   model. For example: if the model context length is 4,097, you can set
  ///   [combineInputMaxTokens] to 3,000 to have 1,097 tokens left for the final
  ///   summary generation.
  /// - [collapsePrompt] is the prompt to use to collapse the final summary if
  ///   it exceeds the [combineInputMaxTokens] limit. By default,
  ///   [combinePrompt] is used.
  /// - [collapseLlm] is the language model to use to collapse the final
  ///   summary. By default, [combineLlm] is used if it is not null, otherwise
  ///   [llm] is used.
  /// - [collapseDocumentPrompt] is the prompt to use to format the final
  ///   summary before collapsing it. The default prompt just takes the content
  ///   of the document.
  /// - [collapseDocumentPromptVar] is the variable used in the [collapsePrompt]
  ///   to indicate where the summary to be collapsed should be placed.
  /// - [collapseDocumentSeparator] is the separator used to join the summary
  ///   to be collapsed.
  /// - [returnIntermediateSteps] indicates whether to return the intermediate
  ///   steps of the summarization process. If true, the intermediate steps
  ///   will be placed in the [MapReduceDocumentsChain.intermediateStepsOutputKey]
  ///   output key.
  ///
  /// Example:
  /// ```dart
  /// final loader = WebBaseLoader(['https://example.com']);
  /// final docs = await loader.load();
  ///
  /// const textSplitter = RecursiveCharacterTextSplitter();
  /// final docsChunks = textSplitter.splitDocuments(docs);
  ///
  /// final llm = ChatOpenAI(apiKey: openAIKey);
  /// final summarizeChain = SummarizeChain.mapReduce(llm: llm);
  ///
  /// final summary = await summarizeChain.run(docsChunks);
  /// ```
  static MapReduceDocumentsChain mapReduce({
    required final BaseLanguageModel llm,
    final String inputKey = SummarizeChain.defaultInputKey,
    final String outputKey = SummarizeChain.defaultOutputKey,
    final BasePromptTemplate mapPrompt = _promptTemplate,
    final String mapDocumentPromptVar =
        MapReduceDocumentsChain.defaultLlmChainDocumentPromptVar,
    final BasePromptTemplate combinePrompt = _promptTemplate,
    final BaseLanguageModel? combineLlm,
    final BasePromptTemplate combineDocumentPrompt =
        StuffDocumentsChain.defaultDocumentPrompt,
    final String combineDocumentPromptVar =
        StuffDocumentsChain.defaultLlmChainStuffedDocumentPromptVar,
    final String combineDocumentSeparator =
        StuffDocumentsChain.defaultDocumentSeparator,
    final int combineInputMaxTokens = ReduceDocumentsChain.defaultTokenMax,
    final BasePromptTemplate? collapsePrompt,
    final BaseLanguageModel? collapseLlm,
    final BasePromptTemplate collapseDocumentPrompt =
        StuffDocumentsChain.defaultDocumentPrompt,
    final String collapseDocumentPromptVar =
        StuffDocumentsChain.defaultLlmChainStuffedDocumentPromptVar,
    final String collapseDocumentSeparator =
        StuffDocumentsChain.defaultDocumentSeparator,
    final bool returnIntermediateSteps = false,
  }) {
    final finalCombineLlm = combineLlm ?? llm;
    final combineLlmChain = LLMChain(
      llm: finalCombineLlm,
      prompt: combinePrompt,
    );

    final combineDocumentsChain = StuffDocumentsChain(
      llmChain: combineLlmChain,
      documentPrompt: combineDocumentPrompt,
      llmChainStuffedDocumentPromptVar: combineDocumentPromptVar,
      documentSeparator: combineDocumentSeparator,
    );

    StuffDocumentsChain? collapseDocumentsChain;
    if (collapsePrompt != null) {
      final finalCollapseLLm = collapseLlm ?? combineLlm ?? llm;
      final collapseLlmChain = LLMChain(
        llm: finalCollapseLLm,
        prompt: collapsePrompt,
      );
      collapseDocumentsChain = StuffDocumentsChain(
        llmChain: collapseLlmChain,
        documentPrompt: collapseDocumentPrompt,
        llmChainStuffedDocumentPromptVar: collapseDocumentPromptVar,
        documentSeparator: collapseDocumentSeparator,
      );
    }

    final reduceDocumentsChain = ReduceDocumentsChain(
      combineDocumentsChain: combineDocumentsChain,
      collapseDocumentsChain: collapseDocumentsChain,
      tokenMax: combineInputMaxTokens,
    );

    final mapLlmChain = LLMChain(llm: llm, prompt: mapPrompt);

    return MapReduceDocumentsChain(
      inputKey: inputKey,
      outputKey: outputKey,
      mapLlmChain: mapLlmChain,
      reduceDocumentsChain: reduceDocumentsChain,
      mapLlmChainDocumentPromptVar: mapDocumentPromptVar,
      returnIntermediateSteps: returnIntermediateSteps,
    );
  }

  /// Default input key for the summarization chain where to place the
  /// documents to summarize.
  static const defaultInputKey = BaseCombineDocumentsChain.defaultInputKey;

  /// Default output key for the summarization chain where to place the
  /// summary.
  static const defaultOutputKey = BaseCombineDocumentsChain.defaultOutputKey;
}
