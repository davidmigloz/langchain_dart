// ignore_for_file: avoid_redundant_argument_values
import 'dart:async';

import 'package:http/http.dart' as http;
import 'package:langchain/langchain.dart';
import 'package:openai_dart/openai_dart.dart';

import 'models/models.dart';

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
///       size: ImageSize.v256x256,
///     ),
///   ),
/// ];
/// final agent = OpenAIFunctionsAgent.fromLLMAndTools(
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
final class OpenAIDallETool extends Tool<OpenAIDallEToolOptions> {
  /// {@macro dall_e_tool}
  OpenAIDallETool({
    final String? apiKey,
    final String? organization,
    final String? baseUrl,
    final Map<String, String>? headers,
    final Map<String, dynamic>? queryParams,
    final http.Client? client,
    this.defaultOptions = const OpenAIDallEToolOptions(),
  })  : _client = OpenAIClient(
          apiKey: apiKey ?? '',
          organization: organization,
          baseUrl: baseUrl,
          headers: headers,
          queryParams: queryParams,
          client: client,
        ),
        super(
          name: 'Dall-E-Image-Generator',
          description: 'A wrapper around OpenAI DALL-E API. '
              'Useful for when you need to generate images from a text '
              'description. Input should be an image description.',
        );

  /// A client for interacting with OpenAI API.
  final OpenAIClient _client;

  /// The default options to use when calling the DALL-E tool.
  OpenAIDallEToolOptions defaultOptions;

  /// Set or replace the API key.
  set apiKey(final String value) => _client.apiKey = value;

  /// Get the API key.
  String get apiKey => _client.apiKey;

  @override
  FutureOr<String> runInternalString(
    final String toolInput, {
    final OpenAIDallEToolOptions? options,
  }) async {
    try {
      final responseFormat =
          options?.responseFormat ?? defaultOptions.responseFormat;
      final res = await _client.createImage(
        request: CreateImageRequest(
          prompt: toolInput,
          model: CreateImageRequestModel.modelId(
            options?.model ?? defaultOptions.model,
          ),
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

  /// Closes the client and cleans up any resources associated with it.
  void close() {
    _client.endSession();
  }
}
