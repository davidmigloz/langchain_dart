import 'package:json_schema/json_schema.dart';
import 'package:langchain_compat/langchain_compat.dart';

// A weather tool that can be called multiple times with different cities
final weatherTool = Tool(
  name: 'get_weather',
  description: 'Get the current weather for a city',
  inputSchema: JsonSchema.create({
    'type': 'object',
    'properties': {
      'city': {'type': 'string', 'description': 'The city to get weather for'},
    },
    'required': ['city'],
  }),
  onCall: (args) async {
    final city = args['city'] as String;
    // Mock weather data
    final weatherData = {
      'boston': {'temp': 45, 'condition': 'cloudy'},
      'new york': {'temp': 52, 'condition': 'sunny'},
      'los angeles': {'temp': 72, 'condition': 'clear'},
      'chicago': {'temp': 38, 'condition': 'windy'},
      'seattle': {'temp': 55, 'condition': 'rainy'},
    };

    final data =
        weatherData[city.toLowerCase()] ?? {'temp': 60, 'condition': 'unknown'};

    return 'Weather in $city: ${data['temp']}°F, ${data['condition']}';
  },
  inputFromJson: (json) => json,
);
