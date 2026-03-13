// ignore_for_file: avoid_redundant_argument_values
import 'dart:async';

import 'package:http/http.dart' as http;
import 'package:langchain_core/tools.dart';
import 'package:openai_dart/openai_dart.dart';

import '../utils/auth.dart';
import 'types.dart';

export 'package:openai_dart/openai_dart.dart'
    show ImageQuality, ImageResponseFormat, ImageSize, ImageStyle;

/// {@template dall_e_tool}
/// Wrapper for [OpenAI's DALL-E Image Generator API](https://platform.openai.com/docs/api-reference/images).
///
/// Given a prompt the model will generate an image.
///
/// Example:
/// ```dart
/// final llm = ChatOpenAI(
///   apiKey: openAiKey,
///   defaultOptions: const ChatOpenAIOptions(
///     model: 'gpt-4',
///     temperature: 0,
///   ),
/// );
/// final tools = [
///   CalculatorTool(),
///   OpenAIDallETool(
///     apiKey: openAiKey,
///     defaultOptions: const OpenAIDallEToolOptions(
///       model: 'dall-e-2',
///       size: ImageSize.size256x256,
///     ),
///   ),
/// ];
/// final agent = ToolsAgent.fromLLMAndTools(
///   llm: llm,
///   tools: tools,
/// );
/// final executor = AgentExecutor(agent: agent);
/// final res = await executor.run(
///   'Calculate the result of 40 raised to the power of 0.43 and generate a funny illustration with it. '
///   'Return ONLY the URL of the image. Do not add any explanation.',
/// );
/// ```
/// {@endtemplate}
final class OpenAIDallETool extends StringTool<OpenAIDallEToolOptions> {
  /// {@macro dall_e_tool}
  OpenAIDallETool({
    final String? apiKey,
    final String? organization,
    final String? baseUrl,
    final Map<String, String>? headers,
    final Map<String, dynamic>? queryParams,
    final http.Client? client,
    super.defaultOptions = const OpenAIDallEToolOptions(),
  }) : _authProvider = MutableApiKeyProvider(apiKey ?? ''),
       super(
         name: 'Dall-E-Image-Generator',
         description:
             'A wrapper around OpenAI DALL-E API. '
             'Useful for when you need to generate images from a text '
             'description. Input should be an image description.',
       ) {
    _client = OpenAIClient(
      config: OpenAIConfig(
        authProvider: _authProvider,
        organization: organization,
        baseUrl:
            buildBaseUrl(baseUrl ?? 'https://api.openai.com/v1', queryParams) ??
            baseUrl ??
            'https://api.openai.com/v1',
        defaultHeaders: headers ?? const {},
      ),
      httpClient: client,
    );
  }

  /// A client for interacting with OpenAI API.
  late final OpenAIClient _client;

  /// The auth provider for mutable API key access.
  final MutableApiKeyProvider _authProvider;

  /// Set or replace the API key.
  set apiKey(final String value) => _authProvider.apiKey = value;

  /// Get the API key.
  String get apiKey => _authProvider.apiKey;

  @override
  Future<String> invokeInternal(
    final String toolInput, {
    final OpenAIDallEToolOptions? options,
  }) async {
    try {
      final responseFormat =
          options?.responseFormat ?? defaultOptions.responseFormat;
      final res = await _client.images.generate(
        ImageGenerationRequest(
          prompt: toolInput,
          model: options?.model ?? defaultOptions.model,
          n: 1,
          quality: options?.quality ?? defaultOptions.quality,
          responseFormat: responseFormat,
          size: options?.size ?? defaultOptions.size,
          style: options?.style ?? defaultOptions.style,
          user: options?.user,
        ),
      );
      final data = res.data.first;
      return (responseFormat == ImageResponseFormat.url
              ? data.url
              : data.b64Json) ??
          'No image generated.';
    } catch (e) {
      return "I couldn't generate an image for you. I got this error: $e";
    }
  }

  @override
  void close() {
    _client.close();
  }
}
