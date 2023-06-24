import '../documents/models/models.dart';
import '../documents/retrievers/base.dart';
import '../model_io/language_models/base.dart';
import '../model_io/prompts/prompts.dart';
import 'base.dart';
import 'combine_documents/combine_documents.dart';
import 'models/models.dart';
import 'question_answering/question_answering.dart';

/// {@template retrieval_qa_chain}
/// Chain for question-answering against the documents retrieved by the
/// [retriever].
///
/// It retrieves the documents using the [retriever] and then combines them
/// using the [combineDocumentsChain].
///
/// Example:
/// ```dart
/// final llmChain = LLMChain(prompt: prompt, llm: llm);
/// final stuffChain = StuffDocumentsChain(llmChain: llmChain);
/// final retrievalQA = RetrievalQAChain(
///   retriever: retriever,
///   combineDocumentsChain: stuffChain,
/// );
/// final res = await retrievalQA({'query': 'What did I say?'});
/// ```
/// {@endtemplate}
class RetrievalQAChain extends BaseChain {
  /// {@macro retrieval_qa_chain}
  const RetrievalQAChain({
    required this.retriever,
    required this.combineDocumentsChain,
    this.inputKey = defaultInputKey,
    this.outputKey = defaultOutputKey,
    this.combineDocumentsChainInputKey =
        BaseCombineDocumentsChain.defaultInputKey,
    this.returnSourceDocuments = false,
  });

  /// Retriever to use.
  final BaseRetriever retriever;

  /// Chain to use to combine the documents.
  final BaseCombineDocumentsChain combineDocumentsChain;

  /// Key to use for the input query.
  final String inputKey;

  /// Key to use for output text.
  final String outputKey;

  /// Key to use for inputting the documents to [combineDocumentsChain].
  final String combineDocumentsChainInputKey;

  /// Whether to return the source documents.
  final bool returnSourceDocuments;

  /// Default input key for the query.
  static const String defaultInputKey = 'query';

  /// Default output key for the output of the chain.
  static const String defaultOutputKey = 'result';

  /// Output key to use for returning the source documents.
  static const sourceDocumentsOutputKey = 'source_documents';

  /// Prompt variable to use for the question.
  static const questionPromptVar = 'question';

  @override
  Set<String> get inputKeys => {inputKey};

  @override
  Set<String> get outputKeys => {
        outputKey,
        if (returnSourceDocuments) sourceDocumentsOutputKey,
      };

  @override
  String get chainType => 'retrieval_qa';

  /// Creates a [RetrievalQAChain] from a [LanguageModel] and a [Retriever].
  ///
  /// By default, it uses a prompt template optimized for question answering
  /// that includes the context and the question.
  ///
  /// The documents are combined using a [StuffDocumentsChain].
  ///
  /// Example:
  /// ```dart
  /// final retriever = VectorStoreRetriever(vectorStore: vectorStore);
  /// final retrievalQA = RetrievalQAChain.fromLlm(
  ///   llm: llm,
  ///   retriever: retriever,
  /// );
  /// final res = await retrievalQA({'query': 'What did I say?'});
  /// ```
  ///
  /// If you want to use a different prompt template, you can pass it in
  /// [prompt]. Use 'context' and 'question' as the variable names.
  factory RetrievalQAChain.fromLlm({
    required final BaseLanguageModel llm,
    required final BaseRetriever retriever,
    final PromptTemplate? prompt,
  }) {
    return RetrievalQAChain(
      retriever: retriever,
      combineDocumentsChain: StuffDocumentsQAChain(llm: llm, prompt: prompt),
    );
  }

  @override
  Future<ChainValues> callInternal(final ChainValues inputs) async {
    final query = inputs[inputKey] as String;

    final docs = await _getDocs(query);
    final combineDocumentsChainInputs = {
      combineDocumentsChainInputKey: docs,
      questionPromptVar: query,
    };
    final answer = await combineDocumentsChain.run(combineDocumentsChainInputs);

    return {
      outputKey: answer,
      if (returnSourceDocuments) sourceDocumentsOutputKey: docs,
    };
  }

  /// Returns the documents to do question answering over.
  Future<List<Document>> _getDocs(final String query) {
    return retriever.getRelevantDocuments(query);
  }
}
