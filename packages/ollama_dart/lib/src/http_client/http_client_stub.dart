import 'package:http/http.dart' as http;

/// Creates a default HTTP client for the current platform.
http.Client createDefaultHttpClient() => throw UnsupportedError(
      'Cannot create a client without dart:html or dart:io.',
    );
