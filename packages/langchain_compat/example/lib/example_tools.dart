import 'package:json_schema/json_schema.dart';
import 'package:langchain_compat/langchain_compat.dart';

final currentDateTimeTool = Tool<String>(
  name: 'current_date_time',
  description: 'Returns the current date and time in ISO 8601 format.',
  onCall: (_) {
    final now = DateTime.now().toIso8601String();
    return now;
  },
);

final temperatureTool = Tool<Map<String, dynamic>>(
  name: 'get_temperature',
  description: 'Returns the current temperature in Portland, OR.',
  inputSchema: JsonSchema.create({
    'type': 'object',
    'properties': {
      'location': {
        'type': 'string',
        'description': 'The location to get the temperature for.',
      },
    },
    'required': ['location'],
  }),
  onCall: (_) => '80°F',
  inputFromJson: (json) => json,
);

final weatherTool = Tool<Map<String, dynamic>>(
  name: 'get_weather',
  description: 'Get the current weather for a given location',
  inputSchema: JsonSchema.create({
    'type': 'object',
    'properties': {
      'location': {
        'type': 'string',
        'description': 'The location to get weather for',
      },
    },
    'required': ['location'],
  }),
  inputFromJson: (json) => json,
  onCall: (input) async {
    final location = input['location'] as String;

    // Simulate weather API call with realistic variation
    final temps = {
      'Boston': '68°F',
      'New York': '71°F',
      'Seattle': '63°F',
      'Miami': '82°F',
    };
    final conditions = {
      'Boston': 'partly cloudy',
      'New York': 'sunny',
      'Seattle': 'overcast',
      'Miami': 'hot and humid',
    };

    final temp = temps[location] ?? '72°F';
    final condition = conditions[location] ?? 'partly cloudy';

    return 'The weather in $location is $temp and $condition.';
  },
);

final temperatureConverterTool = Tool<Map<String, dynamic>>(
  name: 'convert_f_to_c',
  description: 'Convert temperature from Fahrenheit to Celsius',
  inputSchema: JsonSchema.create({
    'type': 'object',
    'properties': {
      'fahrenheit': {
        'type': 'number',
        'description': 'Temperature in Fahrenheit to convert to Celsius',
      },
    },
    'required': ['fahrenheit'],
  }),
  inputFromJson: (json) => json,
  onCall: (input) async {
    final fahrenheit = input['fahrenheit'] as num;

    // Convert Fahrenheit to Celsius using formula: (F - 32) * 5/9
    final celsius = (fahrenheit - 32) * 5 / 9;
    final roundedCelsius = celsius.round();

    return '$fahrenheit°F = $roundedCelsius°C';
  },
);
