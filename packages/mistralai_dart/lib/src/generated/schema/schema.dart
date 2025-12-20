// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: invalid_annotation_target

library mistral_a_i_schema;

import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:typed_data';

part 'schema.g.dart';
part 'schema.freezed.dart';

part 'chat_completion_request.dart';
part 'chat_completion_response.dart';
part 'chat_completion_message.dart';
part 'assistant_message.dart';
part 'chat_completion_message_role.dart';
part 'chat_completion_finish_reason.dart';
part 'chat_completion_usage.dart';
part 'chat_completion_stream_response.dart';
part 'chat_completion_stream_delta.dart';
part 'tool.dart';
part 'tool_type.dart';
part 'function_definition.dart';
part 'tool_call.dart';
part 'function_call.dart';
part 'tool_choice_tool.dart';
part 'tool_choice_tool_function.dart';
part 'response_format.dart';
part 'response_format_type.dart';
part 'json_schema.dart';
part 'prediction.dart';
part 'mistral_prompt_mode.dart';
part 'embedding_request.dart';
part 'embedding_response.dart';
part 'embedding.dart';
part 'model_list.dart';
part 'model.dart';

class Uint8ListConverter implements JsonConverter<Uint8List, List<int>> {
  const Uint8ListConverter();

  @override
  Uint8List fromJson(List<int> json) {
    return Uint8List.fromList(json);
  }

  @override
  List<int> toJson(Uint8List object) {
    return object.toList();
  }
}
