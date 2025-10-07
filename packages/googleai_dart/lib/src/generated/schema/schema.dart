// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: invalid_annotation_target

library google_a_i_schema;

import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:typed_data';

part 'schema.g.dart';
part 'schema.freezed.dart';

part 'batch_embed_contents_response.dart';
part 'candidate.dart';
part 'create_tuned_model_metadata.dart';
part 'batch_embed_contents_request.dart';
part 'safety_rating.dart';
part 'part.dart';
part 'operation.dart';
part 'status.dart';
part 'citation_metadata.dart';
part 'safety_setting.dart';
part 'citation_source.dart';
part 'generation_config.dart';
part 'count_tokens_request.dart';
part 'tuning_snapshot.dart';
part 'blob.dart';
part 'list_models_response.dart';
part 'content_embedding.dart';
part 'prompt_feedback.dart';
part 'embed_content_request.dart';
part 'list_operations_response.dart';
part 'empty.dart';
part 'content.dart';
part 'cancel_operation_request.dart';
part 'embed_content_response.dart';
part 'count_tokens_response.dart';
part 'generate_content_response.dart';
part 'model.dart';
part 'generate_content_request.dart';

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
