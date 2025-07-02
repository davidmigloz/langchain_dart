/// Normalizes and validates a JSON schema.
Map<String, dynamic> normalizeAndValidateSchema(Map<String, dynamic>? schema) {
  if (schema == null) {
    return {'type': 'object', 'properties': {}};
  }
  if (!schema.containsKey('type') || !schema.containsKey('properties')) {
    throw ArgumentError(
      'inputJsonSchema must contain both "type" and "properties" keys.',
    );
  }
  return schema;
}
