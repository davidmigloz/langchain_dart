import '../documents/models/models.dart';
import '../language_models/base.dart';
import '../prompts/prompt.dart';
import '../retrievers/base.dart';
import 'base.dart';
import 'combine_documents/base.dart';
import 'models/models.dart';
import 'question_answering/question_answering.dart';

/// {@template retrieval_qa_chain}
/// Chain for question-answering against an index.
/// {@endtemplate}
class RetrievalQAChain extends BaseChain {
  /// {@macro retrieval_qa_chain}
  const RetrievalQAChain({
    required this.retriever,
    required this.combineDocumentsChain,
    this.inputKey = 'query',
    this.outputKey = 'result',
    this.combineDocumentsChainInputKey = 'input_documents',
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
  /// By default, it uses a prompt template optimized for question answering.
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
    final question = inputs[inputKey] as String;

    final docs = await _getDocs(question);
    final combineDocumentsChainInputs = {
      combineDocumentsChainInputKey: docs,
      questionPromptVar: question,
    };
    final answer = await combineDocumentsChain.run(combineDocumentsChainInputs);

    return {
      outputKey: answer,
      if (returnSourceDocuments) sourceDocumentsOutputKey: docs,
    };
  }

  /// Returns the documents to do question answering over.
  Future<List<Document>> _getDocs(final String question) {
    return retriever.getRelevantDocuments(question);
  }
}
