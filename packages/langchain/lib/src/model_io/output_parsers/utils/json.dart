import 'dart:convert';

/// Parses a JSON string that may be missing some closing characters.
///
/// This function is useful for parsing an incomplete JSON string that is
/// being streamed from an API.
///
/// For example:
/// ```dart
/// parsePartialJson('{"foo":"bar"'); // Returns {"foo":"bar"}
/// ```
dynamic parsePartialJson(final String s) {
  // Attempt to parse the string as-is
  try {
    return jsonDecode(s);
  } on Exception {
    // Pass
  }

  // Initialize variables
  String newStr = '';
  final stack = <String>[];
  bool isInsideString = false;
  bool escaped = false;

  // Process each character in the string one at a time
  for (int i = 0; i < s.length; i++) {
    var char = s[i];
    if (isInsideString) {
      if (char == '"' && !escaped) {
        isInsideString = false;
      } else if (char == '\n' && !escaped) {
        char = r'\n'; // Replace the newline character with the escape sequence
      } else if (char == r'\') {
        escaped = !escaped;
      } else {
        escaped = false;
      }
    } else {
      if (char == '"') {
        isInsideString = true;
        escaped = false;
      } else if (char == '{') {
        stack.add('}');
      } else if (char == '[') {
        stack.add(']');
      } else if (char == '}' || char == ']') {
        if (stack.isNotEmpty && stack.last == char) {
          stack.removeLast();
        } else {
          // Mismatched closing character; the input is malformed
          return null;
        }
      }
    }

    // Append the processed character to the new string
    newStr += char;
  }

  // If we're still inside a string at the end of processing,
  // we need to close the string
  if (isInsideString) {
    newStr += '"';
  }

  // Close any remaining open structures in the reverse order
  // that they were opened
  while (stack.isNotEmpty) {
    newStr += stack.removeLast();
  }

  // Attempt to parse the modified string as JSON
  try {
    return jsonDecode(newStr);
  } on Exception {
    // If we still can't parse the string as JSON,
    // return null to indicate failure
    return null;
  }
}
