// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: invalid_annotation_target
part of open_a_i_schema;

// ==========================================
// CLASS: SubmitToolOutputsRunRequest
// ==========================================

/// Request object for the Submit tool outputs to run endpoint.
@freezed
class SubmitToolOutputsRunRequest with _$SubmitToolOutputsRunRequest {
  const SubmitToolOutputsRunRequest._();

  /// Factory constructor for SubmitToolOutputsRunRequest
  const factory SubmitToolOutputsRunRequest({
    /// A list of tools for which the outputs are being submitted.
    @JsonKey(name: 'tool_outputs')
    required List<RunSubmitToolOutput> toolOutputs,
  }) = _SubmitToolOutputsRunRequest;

  /// Object construction from a JSON representation
  factory SubmitToolOutputsRunRequest.fromJson(Map<String, dynamic> json) =>
      _$SubmitToolOutputsRunRequestFromJson(json);

  /// List of all property names of schema
  static const List<String> propertyNames = ['tool_outputs'];

  /// Perform validations on the schema property values
  String? validateSchema() {
    return null;
  }

  /// Map representation of object (not serialized)
  Map<String, dynamic> toMap() {
    return {
      'tool_outputs': toolOutputs,
    };
  }
}
