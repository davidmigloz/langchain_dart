// ignore_for_file: avoid_print, avoid_dynamic_calls, prefer_const_constructors
/// Demonstrates Google Maps grounding for geospatial context.
///
/// Google Maps grounding enables the model to access location and place
/// information to provide contextual responses about places.
///
/// Key features:
/// - Provide user location context via latitude/longitude
/// - Get place information (name, URI, place ID)
/// - Receive widget context token for rendering interactive maps
///
/// See: https://ai.google.dev/gemini-api/docs/maps-grounding
library;

import 'package:googleai_dart/googleai_dart.dart';

Future<void> main() async {
  // Initialize client from environment variable (GOOGLE_GENAI_API_KEY)
  final client = GoogleAIClient.fromEnvironment();

  try {
    print('=== Example 1: Basic Google Maps Grounding ===\n');
    await basicMapsGrounding(client);

    print('\n=== Example 2: Maps with Location Context ===\n');
    await mapsWithLocationContext(client);

    print('\n=== Example 3: Maps with Widget Token ===\n');
    await mapsWithWidgetToken(client);
  } finally {
    client.close();
  }
}

/// Basic Google Maps grounding without location context.
Future<void> basicMapsGrounding(GoogleAIClient client) async {
  final response = await client.models.generateContent(
    model: 'gemini-3-flash-preview',
    request: GenerateContentRequest(
      contents: [
        Content.text('What are the best pizza places in New York City?'),
      ],
      // Enable Google Maps grounding
      tools: const [Tool(googleMaps: GoogleMaps())],
    ),
  );

  // Print response using the .text extension
  print('Response: ${response.text}\n');

  // Access grounding metadata with place information
  final metadata = response.candidates?.first.groundingMetadata;
  if (metadata != null) {
    printPlaceInfo(metadata);
  }
}

/// Google Maps grounding with user location context.
Future<void> mapsWithLocationContext(GoogleAIClient client) async {
  final response = await client.models.generateContent(
    model: 'gemini-3-flash-preview',
    request: GenerateContentRequest(
      contents: [Content.text('Find Italian restaurants near me')],
      // Enable Google Maps grounding
      tools: const [Tool(googleMaps: GoogleMaps())],
      // Provide user location for context (as Map)
      toolConfig: {
        'retrievalConfig': {
          'latLng': {
            'latitude': 40.758896, // Times Square, New York
            'longitude': -73.985130,
          },
          'languageCode': 'en-US',
        },
      },
    ),
  );

  // Print response using the .text extension
  print('Response: ${response.text}\n');

  // Access grounding metadata
  final metadata = response.candidates?.first.groundingMetadata;
  if (metadata != null) {
    printPlaceInfo(metadata);
  }
}

/// Google Maps grounding with widget token for rendering.
Future<void> mapsWithWidgetToken(GoogleAIClient client) async {
  final response = await client.models.generateContent(
    model: 'gemini-3-flash-preview',
    request: GenerateContentRequest(
      contents: [
        Content.text(
          'What are some popular tourist attractions near the Eiffel Tower?',
        ),
      ],
      // Enable Google Maps with widget support
      tools: const [Tool(googleMaps: GoogleMaps(enableWidget: true))],
      // Provide location near Eiffel Tower
      toolConfig: {
        'retrievalConfig': {
          'latLng': {'latitude': 48.858370, 'longitude': 2.294481},
          'languageCode': 'en-US',
        },
      },
    ),
  );

  // Print response using the .text extension
  print('Response: ${response.text}\n');

  // Access grounding metadata
  final metadata = response.candidates?.first.groundingMetadata;
  if (metadata != null) {
    printPlaceInfo(metadata);

    // Widget context token for rendering Google Maps widget
    if (metadata.googleMapsWidgetContextToken != null) {
      print('\nWidget Context Token available!');
      print('Token: ${metadata.googleMapsWidgetContextToken}');
      print('\nTo render the widget in a web app, use:');
      print(
        '<gmp-place-contextual '
        'context-token="${metadata.googleMapsWidgetContextToken}">'
        '</gmp-place-contextual>',
      );
    }
  }
}

/// Helper to print place information from grounding metadata.
void printPlaceInfo(GroundingMetadata metadata) {
  if (metadata.groundingChunks != null) {
    print('Places referenced:');
    for (final chunk in metadata.groundingChunks!) {
      if (chunk.maps != null) {
        final maps = chunk.maps!;
        print('  - ${maps.title ?? "Unknown"}');
        if (maps.uri != null) {
          print('    URL: ${maps.uri}');
        }
        if (maps.placeId != null) {
          print('    Place ID: ${maps.placeId}');
        }
        if (maps.text != null) {
          print('    Description: ${maps.text}');
        }
      }
    }
  }
}
