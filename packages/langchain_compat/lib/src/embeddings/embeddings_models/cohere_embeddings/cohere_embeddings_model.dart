import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:logging/logging.dart';

import '../../../chat/chat_providers/chat_provider.dart';
import '../../../language_models/finish_reason.dart';
import '../../../language_models/language_model_usage.dart';
import '../../../platform/platform.dart';
import '../../embeddings_model.dart';
import '../../embeddings_result.dart';
import 'cohere_embeddings_model_options.dart';

/// Cohere embeddings model implementation.
class CohereEmbeddingsModel
    extends EmbeddingsModel<CohereEmbeddingsModelOptions> {
  /// Creates a new Cohere embeddings model.
  CohereEmbeddingsModel({
    String? name,
    String? apiKey,
    super.dimensions,
    super.batchSize = 96, // Cohere's default batch size limit
    String? inputType,
    List<String>? embeddingTypes,
    String? truncate,
    super.defaultOptions = const CohereEmbeddingsModelOptions(),
  }) : _truncate = truncate,
       _embeddingTypes = embeddingTypes,
       _inputType = inputType,
       _apiKey = apiKey ?? getEnv(apiKeyName),
       super(name: name ?? defaultName) {
    _logger.info(
      'Created Cohere embeddings model: ${this.name} '
      '(dimensions: $dimensions, batchSize: $batchSize)',
    );
  }
  static final _logger = Logger('dartantic.embeddings.models.cohere');

  /// The environment variable name for the Cohere API key.
  static final apiKeyName = ChatProvider.cohere.apiKeyName;

  /// The default model name.
  static const defaultName = 'embed-v4.0';

  static const _baseUrl = 'https://api.cohere.ai/v2';

  final String _apiKey;
  final String? _inputType;
  final List<String>? _embeddingTypes;
  final String? _truncate;

  @override
  Future<EmbeddingsResult> embedQuery(
    String query, {
    CohereEmbeddingsModelOptions? options,
  }) async {
    final queryLength = query.length;

    _logger.fine(
      'Embedding query with Cohere model "$name" '
      '(length: $queryLength)',
    );

    final result = await embedDocuments([query], options: options);

    final queryResult = EmbeddingsResult(
      id: result.id,
      output: result.embeddings.first,
      finishReason: result.finishReason,
      usage: result.usage,
      metadata: result.metadata,
    );

    _logger.info(
      'Cohere embedding query result: '
      '${queryResult.output.length} dimensions, '
      '${queryResult.usage.totalTokens} tokens',
    );

    return queryResult;
  }

  @override
  Future<BatchEmbeddingsResult> embedDocuments(
    List<String> texts, {
    CohereEmbeddingsModelOptions? options,
  }) async {
    final chunks = <List<String>>[];
    final actualBatchSize = options?.batchSize ?? batchSize ?? 96;
    final totalTexts = texts.length;
    final totalCharacters = texts.map((t) => t.length).reduce((a, b) => a + b);

    for (var i = 0; i < texts.length; i += actualBatchSize) {
      chunks.add(
        texts.sublist(i, (i + actualBatchSize).clamp(0, texts.length)),
      );
    }

    _logger.info(
      'Embedding $totalTexts documents with Cohere model "$name" '
      '(batches: ${chunks.length}, batchSize: $actualBatchSize, '
      'totalChars: $totalCharacters)',
    );

    final allEmbeddings = <List<double>>[];
    var totalPromptTokens = 0;
    // var totalTokens = 0; // Unused in Cohere response
    var totalBillableCharacters = 0;
    var lastId = '';

    for (var i = 0; i < chunks.length; i++) {
      final chunk = chunks[i];
      final chunkCharacters = chunk
          .map((t) => t.length)
          .reduce((a, b) => a + b);

      _logger.fine(
        'Processing batch ${i + 1}/${chunks.length} '
        '(${chunk.length} texts, $chunkCharacters chars)',
      );

      final response = await _makeRequest(chunk, options);

      // Handle Cohere v2 API response format
      List<List<double>> embeddings;
      if (response.containsKey('embeddings') && response['embeddings'] is Map) {
        // v2 API format: {"embeddings": {"float": [[...], [...]]}}
        final embeddingsMap = response['embeddings'] as Map<String, dynamic>;
        final floatEmbeddings = embeddingsMap['float'] as List<dynamic>;
        embeddings = floatEmbeddings
            .map(
              (item) => (item as List<dynamic>)
                  .map((e) => (e as num).toDouble())
                  .toList(),
            )
            .toList();
      } else if (response.containsKey('embeddings') &&
          response['embeddings'] is List) {
        // v1 API format: {"embeddings": [[...], [...]]}
        embeddings = (response['embeddings'] as List<dynamic>)
            .map(
              (item) => (item as List<dynamic>)
                  .map((e) => (e as num).toDouble())
                  .toList(),
            )
            .toList();
      } else {
        throw Exception(
          'Unexpected Cohere embeddings response format: ${response.keys}',
        );
      }

      allEmbeddings.addAll(embeddings);

      // Accumulate usage data
      final meta = response['meta'] as Map<String, dynamic>?;
      if (meta != null) {
        final billedUnits = meta['billed_units'] as Map<String, dynamic>?;
        if (billedUnits != null) {
          totalPromptTokens += billedUnits['input_tokens'] as int? ?? 0;
          totalBillableCharacters += billedUnits['search_units'] as int? ?? 0;
        }
      }

      lastId = response['id'] as String? ?? '';

      _logger.fine(
        'Batch ${i + 1} completed: '
        '${embeddings.length} embeddings, '
        // ignore: avoid_dynamic_calls
        '${meta?['billed_units']?['input_tokens'] ?? 0} tokens',
      );
    }

    final usage = LanguageModelUsage(
      promptTokens: totalPromptTokens > 0 ? totalPromptTokens : null,
      totalTokens: totalPromptTokens > 0 ? totalPromptTokens : null,
      promptBillableCharacters: totalBillableCharacters > 0
          ? totalBillableCharacters
          : null,
    );

    final result = BatchEmbeddingsResult(
      id: lastId,
      output: allEmbeddings,
      finishReason: FinishReason.stop,
      usage: usage,
      metadata: {'model': name, 'provider': 'cohere'},
    );

    _logger.info(
      'Cohere batch embedding completed: '
      '${result.output.length} embeddings, '
      '${result.usage.totalTokens} total tokens',
    );

    return result;
  }

  Future<Map<String, dynamic>> _makeRequest(
    List<String> texts,
    CohereEmbeddingsModelOptions? options,
  ) async {
    final url = Uri.parse('$_baseUrl/embed');
    final body = {
      'model': name,
      'texts': texts,
      if (_inputType != null || options?.inputType != null)
        'input_type': options?.inputType ?? _inputType ?? 'search_document',
      if (_embeddingTypes != null || options?.embeddingTypes != null)
        'embedding_types':
            options?.embeddingTypes ?? _embeddingTypes ?? ['float'],
      if (_truncate != null || options?.truncate != null)
        'truncate': options?.truncate ?? _truncate,
    };

    _logger.fine('Making Cohere API request for ${texts.length} texts');

    final response = await http.post(
      url,
      headers: {
        'Authorization': 'Bearer $_apiKey',
        'Content-Type': 'application/json',
      },
      body: jsonEncode(body),
    );

    if (response.statusCode != 200) {
      _logger.warning(
        'Cohere API error: ${response.statusCode} ${response.body}',
      );
      throw Exception(
        'Cohere embeddings API error: '
        '${response.statusCode} ${response.body}',
      );
    }

    final result = jsonDecode(response.body) as Map<String, dynamic>;
    _logger.fine('Cohere API response received successfully');
    return result;
  }

  @override
  void dispose() {
    // Nothing to close for HTTP-based model
  }
}
