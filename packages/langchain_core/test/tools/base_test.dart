import 'package:langchain_core/tools.dart';
import 'package:meta/meta.dart';
import 'package:test/test.dart';

void main() {
  group('Tool tests', () {
    test('Tool.fromFunction', () async {
      final echoTool = Tool.fromFunction<int, String>(
        name: 'echo-int',
        description: 'echo-int',
        func: (final int toolInput) => toolInput.toString(),
        inputJsonSchema: const {
          'type': 'object',
          'properties': {
            'input': {
              'type': 'integer',
              'description': 'The input to the tool',
            },
          },
          'required': ['input'],
        },
      );

      expect(echoTool.name, 'echo-int');
      expect(echoTool.description, 'echo-int');
      expect(await echoTool.invoke(1), '1');
      expect(echoTool.getInputFromJson({'input': 1}), 1);
    });

    test('Tool.fromFunction with custom deserialization', () async {
      final tool = Tool.fromFunction<_SearchInput, String>(
        name: 'search',
        description: 'Tool for searching the web.',
        inputJsonSchema: const {
          'type': 'object',
          'properties': {
            'query': {
              'type': 'string',
              'description': 'The query to search for',
            },
            'n': {
              'type': 'number',
              'description': 'The number of results to return',
            },
          },
          'required': ['query'],
        },
        func: (final _SearchInput toolInput) {
          final n = toolInput.n;
          final res = List<String>.generate(n, (final i) => 'Result ${i + 1}');
          return 'Results:\n${res.join('\n')}';
        },
        getInputFromJson: _SearchInput.fromJson,
      );

      expect(tool.name, 'search');
      expect(tool.description, 'Tool for searching the web.');
      expect(
        await tool.invoke(const _SearchInput(query: 'cats', n: 3)),
        'Results:\nResult 1\nResult 2\nResult 3',
      );
      expect(
        tool.getInputFromJson({'query': 'cats', 'n': 3}),
        const _SearchInput(query: 'cats', n: 3),
      );
    });

    group('Tool.fromFunction multi-LLM compatibility', () {
      test('OpenAI format compatibility - nested input format', () async {
        final weatherTool = Tool.fromFunction<Map<String, dynamic>, String>(
          name: 'get_current_weather',
          description: 'Get the current weather in a given location',
          inputJsonSchema: const {
            'type': 'object',
            'properties': {
              'location': {
                'type': 'string',
                'description': 'The city and state, e.g. San Francisco, CA',
              },
            },
            'required': ['location'],
          },
          func: (final Map<String, dynamic> toolInput) {
            final location = toolInput['location'] as String;
            return 'Weather in $location: 20°C, sunny';
          },
        );

        // OpenAI format: {input: {location: "..."}}
        final openAiFormat = {
          'input': {'location': 'San Francisco, CA'},
        };

        final parsedInput = weatherTool.getInputFromJson(openAiFormat);
        expect(parsedInput, {'location': 'San Francisco, CA'});

        final result = await weatherTool.invoke(parsedInput);
        expect(result, 'Weather in San Francisco, CA: 20°C, sunny');
      });

      test(
        'Google AI format compatibility - direct arguments format',
        () async {
          final weatherTool = Tool.fromFunction<Map<String, dynamic>, String>(
            name: 'get_current_weather',
            description: 'Get the current weather in a given location',
            inputJsonSchema: const {
              'type': 'object',
              'properties': {
                'location': {
                  'type': 'string',
                  'description': 'The city and state, e.g. San Francisco, CA',
                },
              },
              'required': ['location'],
            },
            func: (final Map<String, dynamic> toolInput) {
              final location = toolInput['location'] as String;
              return 'Weather in $location: 15°C, cloudy';
            },
          );

          // Google AI format: {location: "..."} (direct arguments)
          final googleAiFormat = {'location': 'Boston, MA'};

          final parsedInput = weatherTool.getInputFromJson(googleAiFormat);
          expect(parsedInput, {'location': 'Boston, MA'});

          final result = await weatherTool.invoke(parsedInput);
          expect(result, 'Weather in Boston, MA: 15°C, cloudy');
        },
      );
    });
  });
}

@immutable
class _SearchInput {
  const _SearchInput({required this.query, required this.n});

  final String query;
  final int n;

  _SearchInput.fromJson(final Map<String, dynamic> json)
    : this(query: json['query'] as String, n: json['n'] as int);

  @override
  bool operator ==(covariant _SearchInput other) =>
      identical(this, other) || query == other.query && n == other.n;

  @override
  int get hashCode => query.hashCode ^ n.hashCode;
}
