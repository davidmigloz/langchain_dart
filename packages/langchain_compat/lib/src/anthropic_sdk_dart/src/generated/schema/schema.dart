// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: invalid_annotation_target

library anthropic_schema;

import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:typed_data';

part 'schema.g.dart';
part 'schema.freezed.dart';

part 'create_message_request.dart';
part 'create_message_request_metadata.dart';
part 'tool_choice.dart';
part 'tool_choice_type.dart';
part 'message.dart';
part 'message_role.dart';
part 'image_block_source.dart';
part 'cache_control_ephemeral.dart';
part 'stop_reason.dart';
part 'usage.dart';
part 'create_message_batch_request.dart';
part 'batch_message_request.dart';
part 'message_batch.dart';
part 'message_batch_request_counts.dart';
part 'message_stream_event_type.dart';
part 'message_delta.dart';
part 'message_delta_usage.dart';
part 'error.dart';
part 'tool.dart';
part 'block.dart';
part 'message_stream_event.dart';
part 'block_delta.dart';

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
