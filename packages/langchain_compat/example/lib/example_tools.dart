import 'dart:math';

import 'package:json_schema/json_schema.dart';
import 'package:langchain_compat/langchain_compat.dart';

/// Tool that returns the current date and time
final currentDateTimeTool = Tool<Map<String, dynamic>>(
  name: 'current_date_time',
  description: 'Get the current date and time',
  inputFromJson: (json) => json,
  onCall: (_) => DateTime.now().toIso8601String(),
);

/// Tool that returns a simple weather report for a given location
final weatherTool = Tool<Map<String, dynamic>>(
  name: 'weather',
  description: 'Get the weather for a given location',
  inputSchema: JsonSchema.create({
    'type': 'object',
    'properties': {
      'location': {
        'type': 'string',
        'description': 'The location to get the weather for',
      },
    },
    'required': ['location'],
  }),
  inputFromJson: (json) => json,
  onCall: (input) {
    final location = input['location'] as String;
    // This is a mock implementation. In a real app, you'd call a weather API.
    final temp = 20 + Random().nextInt(15);
    return {
      'location': location,
      'temperature': temp,
      'unit': 'C',
      'conditions': ['sunny', 'cloudy', 'rainy'][Random().nextInt(3)],
    };
  },
);

/// Tool that converts Fahrenheit to Celsius
final fahrenheitToCelsiusTool = Tool<Map<String, dynamic>>(
  name: 'fahrenheit_to_celsius',
  description: 'Convert a temperature from Fahrenheit to Celsius',
  inputSchema: JsonSchema.create({
    'type': 'object',
    'properties': {
      'fahrenheit': {
        'type': 'number',
        'description': 'The temperature in Fahrenheit',
      },
    },
    'required': ['fahrenheit'],
  }),
  inputFromJson: (json) => json,
  onCall: (input) {
    final fahrenheit = input['fahrenheit'] as num;
    final celsius = (fahrenheit - 32) * 5 / 9;
    return {'fahrenheit': fahrenheit, 'celsius': celsius.toStringAsFixed(1)};
  },
);

/// Tool that gets the temperature for a location (returns just the temperature
/// string)
final temperatureTool = Tool<Map<String, dynamic>>(
  name: 'temperature',
  description: 'Get the temperature for a given location',
  inputSchema: JsonSchema.create({
    'type': 'object',
    'properties': {
      'location': {
        'type': 'string',
        'description': 'The location to get the temperature for',
      },
    },
    'required': ['location'],
  }),
  inputFromJson: (json) => json,
  onCall: (input) {
    final location = input['location'] as String;
    // This is a mock implementation
    final temp = 20 + Random().nextInt(15);
    return '$temp°C in $location';
  },
);

/// Tool that converts temperature between units
final temperatureConverterTool = Tool<Map<String, dynamic>>(
  name: 'temperature_converter',
  description: 'Convert temperature between Celsius and Fahrenheit',
  inputSchema: JsonSchema.create({
    'type': 'object',
    'properties': {
      'value': {
        'type': 'number',
        'description': 'The temperature value to convert',
      },
      'from_unit': {
        'type': 'string',
        'description': 'The unit to convert from (C or F)',
        'enum': ['C', 'F'],
      },
      'to_unit': {
        'type': 'string',
        'description': 'The unit to convert to (C or F)',
        'enum': ['C', 'F'],
      },
    },
    'required': ['value', 'from_unit', 'to_unit'],
  }),
  inputFromJson: (json) => json,
  onCall: (input) {
    final value = input['value'] as num;
    final fromUnit = input['from_unit'] as String;
    final toUnit = input['to_unit'] as String;

    if (fromUnit == toUnit) {
      return {'result': value, 'unit': toUnit};
    }

    final converted = fromUnit == 'C'
        ? (value * 9 / 5) +
              32 // C to F
        : (value - 32) * 5 / 9; // F to C

    return {
      'original': {'value': value, 'unit': fromUnit},
      'converted': {'value': converted.toStringAsFixed(1), 'unit': toUnit},
    };
  },
);

/// Tool that calculates the distance between two cities
final distanceCalculatorTool = Tool<Map<String, dynamic>>(
  name: 'distance_calculator',
  description: 'Calculate the distance between two cities',
  inputSchema: JsonSchema.create({
    'type': 'object',
    'properties': {
      'city1': {'type': 'string', 'description': 'First city'},
      'city2': {'type': 'string', 'description': 'Second city'},
    },
    'required': ['city1', 'city2'],
  }),
  inputFromJson: (json) => json,
  onCall: (input) {
    final city1 = input['city1'] as String;
    final city2 = input['city2'] as String;
    // Mock implementation
    final distance = 100 + Random().nextInt(900);
    return {'from': city1, 'to': city2, 'distance': distance, 'unit': 'km'};
  },
);

/// Tool that gets stock price (mock)
final stockPriceTool = Tool<Map<String, dynamic>>(
  name: 'stock_price',
  description: 'Get the current stock price for a ticker symbol',
  inputSchema: JsonSchema.create({
    'type': 'object',
    'properties': {
      'symbol': {
        'type': 'string',
        'description': 'Stock ticker symbol (e.g., AAPL, GOOGL)',
      },
    },
    'required': ['symbol'],
  }),
  inputFromJson: (json) => json,
  onCall: (input) {
    final symbol = input['symbol'] as String;
    // Mock implementation
    final price = 100 + Random().nextDouble() * 200;
    final change = -5 + Random().nextDouble() * 10;
    return {
      'symbol': symbol.toUpperCase(),
      'price': price.toStringAsFixed(2),
      'change': change.toStringAsFixed(2),
      'change_percent': (change / price * 100).toStringAsFixed(2),
      'currency': 'USD',
    };
  },
);

/// Returns example tools for demonstrations
List<Tool> get exampleTools => [
  currentDateTimeTool,
  weatherTool,
  fahrenheitToCelsiusTool,
  temperatureTool,
  temperatureConverterTool,
  distanceCalculatorTool,
  stockPriceTool,
];

/// Recipe lookup tool for chef scenario
final recipeLookupTool = Tool<Map<String, dynamic>>(
  name: 'lookup_recipe',
  description: 'Look up a recipe by name',
  inputSchema: JsonSchema.create({
    'type': 'object',
    'properties': {
      'recipe_name': {
        'type': 'string',
        'description': 'The name of the recipe to look up',
      },
    },
    'required': ['recipe_name'],
  }),
  inputFromJson: (json) => json,
  onCall: (input) {
    final recipeName = input['recipe_name'] as String;
    // Mock recipe database
    if (recipeName.toLowerCase().contains('mushroom') &&
        recipeName.toLowerCase().contains('omelette')) {
      return {
        'name': "Grandma's Mushroom Omelette",
        'ingredients': [
          '3 large eggs',
          '1/4 cup sliced mushrooms',
          '2 tablespoons butter',
          '1/4 cup shredded cheddar cheese',
          'Salt and pepper to taste',
          '1 tablespoon fresh chives',
        ],
        'instructions': [
          'Beat eggs in a bowl with salt and pepper',
          'Heat butter in a non-stick pan over medium heat',
          'Sauté mushrooms until golden, about 3 minutes',
          'Pour beaten eggs over mushrooms',
          'When eggs begin to set, sprinkle cheese on one half',
          'Fold omelette in half and cook until cheese melts',
          'Garnish with fresh chives and serve',
        ],
        'prep_time': '5 minutes',
        'cook_time': '10 minutes',
        'servings': 1,
      };
    }
    return {
      'error': 'Recipe not found',
      'suggestion': 'Try searching for "mushroom omelette"',
    };
  },
);
