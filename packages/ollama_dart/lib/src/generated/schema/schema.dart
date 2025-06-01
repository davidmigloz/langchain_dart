// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: invalid_annotation_target

library ollama_schema;

import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:typed_data';

part 'schema.g.dart';
part 'schema.freezed.dart';

part 'generate_completion_request.dart';
part 'request_options.dart';
part 'response_format.dart';
part 'version_response.dart';
part 'generate_completion_response.dart';
part 'generate_chat_completion_request.dart';
part 'generate_chat_completion_response.dart';
part 'done_reason.dart';
part 'message.dart';
part 'tool.dart';
part 'tool_function.dart';
part 'tool_function_params.dart';
part 'tool_call.dart';
part 'tool_call_function.dart';
part 'tool_call_function_args.dart';
part 'generate_embedding_request.dart';
part 'generate_embedding_response.dart';
part 'create_model_request.dart';
part 'create_model_response.dart';
part 'create_model_status.dart';
part 'models_response.dart';
part 'model.dart';
part 'model_details.dart';
part 'model_information.dart';
part 'tensor.dart';
part 'capability.dart';
part 'process_response.dart';
part 'process_model.dart';
part 'model_info_request.dart';
part 'model_info.dart';
part 'copy_model_request.dart';
part 'delete_model_request.dart';
part 'pull_model_request.dart';
part 'pull_model_response.dart';
part 'pull_model_status.dart';
part 'push_model_request.dart';
part 'push_model_response.dart';

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
