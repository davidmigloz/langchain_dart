// ignore_for_file: avoid_redundant_argument_values
import 'dart:async';

import 'package:http/http.dart' as http;
import 'package:langchain/langchain.dart';
import 'package:openai_dart/openai_dart.dart';

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
///   model: 'gpt-4',
///   temperature: 0,
/// );
/// final tools = [
///   CalculatorTool(),
///   OpenAIDallETool(
///     apiKey: openAiKey,
///     model: 'dall-e-2',
///     size: ImageSize.v256x256,
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
final class OpenAIDallETool extends Tool {
  /// {@macro dall_e_tool}
  OpenAIDallETool({
    final String? apiKey,
    final String? organization,
    final String? baseUrl,
    final Map<String, String>? headers,
    final Map<String, dynamic>? queryParams,
    final http.Client? client,
    this.model = 'dall-e-3',
    this.quality = ImageQuality.standard,
    this.responseFormat = ImageResponseFormat.url,
    this.size = ImageSize.v1024x1024,
    this.style = ImageStyle.vivid,
    this.user,
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

  /// ID of the model to use (e.g. `dall-e-2` or 'dall-e-3').
  ///
  /// See https://platform.openai.com/docs/api-reference/images/create#images-create-model
  final String model;

  /// The quality of the image that will be generated. [ImageQuality.hd]
  /// creates images with finer details and greater consistency across the
  /// image. This param is only supported for `dall-e-3`
  ///
  /// See https://platform.openai.com/docs/api-reference/images/create#images-create-quality
  final ImageQuality quality;

  /// The format in which the generated images are returned.
  ///
  /// See https://platform.openai.com/docs/api-reference/images/create#images-create-response_format
  final ImageResponseFormat responseFormat;

  /// The size of the generated images.
  ///
  /// Must be one of [ImageSize.v256x256], [ImageSize.v512x512], or
  /// [ImageSize.v1024x1024] for `dall-e-2`.
  ///
  /// Must be one of [ImageSize.v1024x1024], [ImageSize.v1792x1024], or
  /// [ImageSize.v1024x1792] for `dall-e-3` models.
  ///
  /// See https://platform.openai.com/docs/api-reference/images/create#images-create-size
  final ImageSize size;

  /// The style of the generated images.
  ///
  /// [ImageStyle.vivid] causes the model to lean towards generating hyper-real
  /// and dramatic images. [ImageStyle.natural] causes the model to produce
  /// more natural, less hyper-real looking images.
  ///
  /// This param is only supported for `dall-e-3`.
  ///
  /// See https://platform.openai.com/docs/api-reference/images/create#images-create-style
  final ImageStyle style;

  /// A unique identifier representing your end-user, which can help OpenAI to
  /// monitor and detect abuse.
  ///
  /// If you need to send different users in different requests, you can set
  /// this field in [ChatOpenAIOptions] instead.
  ///
  /// Ref: https://platform.openai.com/docs/guides/safety-best-practices/end-user-ids
  final String? user;

  @override
  FutureOr<String> runInternalString(final String toolInput) async {
    try {
      final res = await _client.createImage(
        request: CreateImageRequest(
          prompt: toolInput,
          model: CreateImageRequestModel.modelId(model),
          n: 1,
          quality: quality,
          responseFormat: responseFormat,
          size: size,
          style: style,
          user: user,
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
