import 'package:langchain/langchain.dart';

import '../dall_e.dart';

/// {@template open_ai_dall_e_tool_options}
/// Generation options to pass into the [OpenAIDallETool].
/// {@endtemplate}
class OpenAIDallEToolOptions extends ToolOptions {
  /// {@macro open_ai_dall_e_tool_options}
  const OpenAIDallEToolOptions({
    this.model = 'dall-e-3',
    this.quality = ImageQuality.standard,
    this.responseFormat = ImageResponseFormat.url,
    this.size = ImageSize.v1024x1024,
    this.style = ImageStyle.vivid,
    this.user,
  });

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
}
