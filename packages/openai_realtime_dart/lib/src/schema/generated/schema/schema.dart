// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: invalid_annotation_target

library openai_realtime_schema;

import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:typed_data';

part 'schema.g.dart';
part 'schema.freezed.dart';

part 'audio_format.dart';
part 'voice.dart';
part 'item_role.dart';
part 'item_type.dart';
part 'item_status.dart';
part 'content_type.dart';
part 'object_type.dart';
part 'tool_type.dart';
part 'tool_definition.dart';
part 'tool_choice_forced.dart';
part 'input_audio_transcription_config.dart';
part 'turn_detection.dart';
part 'turn_detection_type.dart';
part 'rate_limit.dart';
part 'rate_limit_name.dart';
part 'response.dart';
part 'response_status.dart';
part 'response_status_type.dart';
part 'response_status_incomplete_reason.dart';
part 'response_config.dart';
part 'usage.dart';
part 'session.dart';
part 'session_config.dart';
part 'conversation.dart';
part 'modality.dart';
part 'delta.dart';
part 'formatted_tool.dart';
part 'formatted_property.dart';
part 'formatted_item.dart';
part 'item_speech.dart';
part 'item_transcript.dart';
part 'event_handler_result.dart';
part 'transcription_error.dart';
part 'api_error.dart';
part 'realtime_event_type.dart';
part 'content_part.dart';
part 'item.dart';
part 'response_status_details.dart';
part 'realtime_event.dart';

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
