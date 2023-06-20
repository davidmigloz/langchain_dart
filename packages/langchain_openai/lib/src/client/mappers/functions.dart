import 'package:dart_openai/dart_openai.dart' as c;

import '../models/functions.dart';

/// Mapper for [OpenAIFunctionModel] to [c.OpenAIFunctionModel].
extension OpenAIFunctionDtoMapper on OpenAIFunction {
  c.OpenAIFunctionModel toDto() {
    return c.OpenAIFunctionModel(
      name: name,
      description: description,
      parametersSchema: parametersSchema,
    );
  }
}

/// Mapper for [OpenAIFunctionCall] to [c.OpenAIFunctionCall].
extension OpenAIFunctionCallDtoMapper on OpenAIFunctionCall {
  c.FunctionCall toDto() {
    return switch (value) {
      final String s => s == 'none' ? c.FunctionCall.auto : c.FunctionCall.none,
      final Map<String, String> m =>
        c.FunctionCall.forFunction(m['name'] ?? ''),
      _ => throw ArgumentError('Invalid function call value: $value'),
    };
  }
}

/// Mapper for [OpenAIFunctionCallResponse] to [c.FunctionCallResponse].
extension OpenAIFunctionCallResponseDtoMapper on OpenAIFunctionCallResponse {
  c.FunctionCallResponse toDto() {
    return c.FunctionCallResponse(
      name: name,
      arguments: arguments,
    );
  }
}

extension OpenAIFunctionCallResponseMapper on c.FunctionCallResponse {
  OpenAIFunctionCallResponse toModel() {
    return OpenAIFunctionCallResponse(
      name: name ?? '',
      arguments: arguments ?? const {},
    );
  }
}
