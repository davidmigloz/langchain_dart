// USAGE: Copy this file, then find-replace:
//   {EnumName} → YourEnumName (PascalCase, e.g., HarmCategory)
//   {enumName} → yourEnumName (camelCase, e.g., harmCategory)
//   {ENUM_NAME} → YOUR_ENUM_NAME (SCREAMING_SNAKE_CASE, e.g., HARM_CATEGORY)
//   {description} → Description from OpenAPI spec
//   Replace example values with actual enum values from schema
//
// Wire format: SCREAMING_SNAKE_CASE (e.g., HARM_CATEGORY_HATE_SPEECH)
// Dart values: camelCase (e.g., hateSpeech)
//
// See references/implementation-patterns.md for detailed conventions

/// {description}.
enum {EnumName} {
  /// Unspecified value.
  unspecified,

  /// Value one description.
  valueOne,

  /// Value two description.
  valueTwo,
}

/// Converts string to [{EnumName}] enum.
{EnumName} {enumName}FromString(String? value) {
  return switch (value?.toUpperCase()) {
    '{ENUM_NAME}_VALUE_ONE' => {EnumName}.valueOne,
    '{ENUM_NAME}_VALUE_TWO' => {EnumName}.valueTwo,
    _ => {EnumName}.unspecified,
  };
}

/// Converts [{EnumName}] enum to string.
String {enumName}ToString({EnumName} value) {
  return switch (value) {
    {EnumName}.valueOne => '{ENUM_NAME}_VALUE_ONE',
    {EnumName}.valueTwo => '{ENUM_NAME}_VALUE_TWO',
    {EnumName}.unspecified => '{ENUM_NAME}_UNSPECIFIED',
  };
}
