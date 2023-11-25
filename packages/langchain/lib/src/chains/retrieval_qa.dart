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
/// For convenience, you can instantiate this chain using the factory
/// constructor [RetrievalQAChain.fromLlm]. By default, it uses a prompt
/// template optimized for question answering that includes the retrieved
/// documents and the question to answer. The documents are inserted in the
/// prompt using a [StuffDocumentsQAChain].
///
/// The chain returns two outputs:
/// - `result` (or the output key specified in the constructor): the answer to
///   the question.
/// - `source_documents`: the documents used to answer the question.
///
/// Note: as the chain returns two outputs you can only call it using the
/// [call] method. The [run] method is not supported.
///
/// Example:
/// ```dart
/// final retriever = VectorStoreRetriever(vectorStore: vectorStore);
/// final retrievalQA = RetrievalQAChain.fromLlm(
///   llm: llm,
///   retriever: retriever,
/// );
/// final res = await retrievalQA({
///   RetrievalQAChain.defaultInputKey: 'What did I say?',
/// });
/// final answer = res[RetrievalQAChain.defaultOutputKey];
/// final docs = res[RetrievalQAChain.sourceDocumentsOutputKey];
/// ```
///
/// If you need more flexibility, you can use the primary constructor which
/// allows you to specify the [retriever] and the [combineDocumentsChain].
/// Your prompt should include the `{context}` and `{question}` variables to
/// be replaced by the documents and the question respectively.
///
/// Example:
/// ```dart
/// final llmChain = LLMChain(prompt: prompt, llm: llm);
/// final stuffChain = StuffDocumentsChain(llmChain: llmChain);
/// final retrievalQA = RetrievalQAChain(
///   retriever: retriever,
///   combineDocumentsChain: stuffChain,
/// );
/// final res = await retrievalQA({
///   RetrievalQAChain.defaultInputKey: 'What did I say?',
/// });
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
  });

  /// Retriever to use.
  final Retriever retriever;

  /// Chain to use to combine the documents.
  final BaseCombineDocumentsChain combineDocumentsChain;

  /// Key to use for the input query.
  final String inputKey;

  /// Key to use for output text.
  final String outputKey;

  /// Key to use for inputting the documents to [combineDocumentsChain].
  final String combineDocumentsChainInputKey;

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
        sourceDocumentsOutputKey,
      };

  @override
  String get chainType => 'retrieval_qa';

  /// Creates a [RetrievalQAChain] from a [BaseLanguageModel] and a
  /// [Retriever].
  ///
  /// By default, it uses a prompt template optimized for question answering
  /// that includes the retrieved documents and the question.
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
  /// final res = await retrievalQA({
  ///   RetrievalQAChain.defaultInputKey: 'What did I say?',
  /// });
  /// ```
  ///
  /// If you want to use a different prompt template, you can pass it in
  /// [prompt]. Use 'context' and 'question' as the variable names.
  factory RetrievalQAChain.fromLlm({
    required final BaseLanguageModel llm,
    required final Retriever retriever,
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
    final answer = await combineDocumentsChain.call(
      combineDocumentsChainInputs,
    );

    final output = <String, dynamic>{};
    for (final entry in answer.entries) {
      final key = entry.key;
      final value = entry.value;

      if (key == combineDocumentsChain.outputKey) {
        output[outputKey] = value;
      } else if (key == combineDocumentsChain.inputKey) {
        output[sourceDocumentsOutputKey] = value;
      } else {
        output[key] = value;
      }
    }

    return output;
  }

  /// Returns the documents to do question answering over.
  Future<List<Document>> _getDocs(final String query) {
    return retriever.getRelevantDocuments(query);
  }
}
