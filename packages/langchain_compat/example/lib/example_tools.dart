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

// Tool that returns a string
final stringTool = Tool<Map<String, dynamic>>(
  name: 'get_greeting',
  description: 'Returns a greeting message',
  inputSchema: JsonSchema.create({
    'type': 'object',
    'properties': {
      'name': {'type': 'string'},
    },
    'required': ['name'],
  }),
  onCall: (input) => 'Hello, ${input['name']}!',
  inputFromJson: (json) => json,
);

// Tool that returns an int
final intTool = Tool<Map<String, dynamic>>(
  name: 'calculate_age',
  description: 'Calculates age from birth year',
  inputSchema: JsonSchema.create({
    'type': 'object',
    'properties': {
      'birth_year': {'type': 'integer'},
    },
    'required': ['birth_year'],
  }),
  onCall: (input) => 2025 - (input['birth_year'] as int),
  inputFromJson: (json) => json,
);

// Tool that returns an array
final arrayTool = Tool<Map<String, dynamic>>(
  name: 'list_colors',
  description: 'Returns a list of favorite colors',
  inputSchema: JsonSchema.create({
    'type': 'object',
    'properties': {
      'count': {'type': 'integer'},
    },
    'required': ['count'],
  }),
  onCall: (input) {
    final count = input['count'] as int;
    return List.generate(
      count,
      (i) => ['red', 'blue', 'green', 'yellow'][i % 4],
    );
  },
  inputFromJson: (json) => json,
);

// Tool that returns a map
final mapTool = Tool<Map<String, dynamic>>(
  name: 'get_weather',
  description: 'Returns weather information',
  inputSchema: JsonSchema.create({
    'type': 'object',
    'properties': {
      'city': {'type': 'string'},
    },
    'required': ['city'],
  }),
  onCall: (input) => {
    'city': input['city'],
    'temperature': 72,
    'conditions': 'sunny',
    'humidity': 45,
    'forecast': ['sunny', 'partly cloudy', 'rain'],
  },
  inputFromJson: (json) => json,
);

// Tool that returns null (edge case)
final nullTool = Tool<Map<String, dynamic>>(
  name: 'check_availability',
  description: 'Checks if something is available',
  inputSchema: JsonSchema.create({
    'type': 'object',
    'properties': {
      'item': {'type': 'string'},
    },
    'required': ['item'],
  }),
  onCall: (input) => input['item'] == 'unicorn' ? null : 'available',
  inputFromJson: (json) => json,
);

// Tool that returns a boolean
final boolTool = Tool<Map<String, dynamic>>(
  name: 'is_prime',
  description: 'Checks if a number is prime',
  inputSchema: JsonSchema.create({
    'type': 'object',
    'properties': {
      'number': {'type': 'integer'},
    },
    'required': ['number'],
  }),
  onCall: (input) {
    final n = input['number'] as int;
    if (n <= 1) return false;
    for (var i = 2; i * i <= n; i++) {
      if (n % i == 0) return false;
    }
    return true;
  },
  inputFromJson: (json) => json,
);
