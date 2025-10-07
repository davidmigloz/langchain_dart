# Tavily Answer

## Overview
The `TavilyAnswerTool` is part of the [Tavily Search API](https://tavily.com) integration, specifically designed to provide direct answers to queries. This tool is optimized for scenarios where you need concise, accurate responses rather than raw search results.

## Installation

Add these dependencies to your project:
```yaml
dependencies:
  langchain: { version }
  langchain_community: { version }
```  

Install via terminal:

#### Dart
```bash
dart pub add langchain langchain_community
```

#### Flutter
```bash
flutter pub add langchain langchain_community
```

## Configuration

### Authentication Options

#### 1. API Key (Recommended)
```dart
TavilyAnswerTool(apiKey: 'your_tavily_key')
```

#### 2. Base URL Override (For proxies/custom endpoints)
```dart
TavilyAnswerTool(baseUrl: 'https://your-proxy.com/')
```

## Basic Usage

```dart
import 'package:langchain_community/langchain_community.dart';

final tool = TavilyAnswerTool(
  apiKey: Platform.environment['TAVILY_API_KEY'],
);

void main() async {
  final answer = await tool.invoke('Explain quantum entanglement simply');
  print(answer);
  // -> 'Quantum entanglement is a phenomenon where two or more particles...'
}
```

## Advanced Usage

### Custom Configuration with Domain Filtering
```dart
final expertTool = TavilyAnswerTool(
  baseUrl: 'https://science-proxy.com/',
  defaultOptions: const TavilyAnswerToolOptions(
    searchDepth: TavilySearchDepth.advanced,
    includeDomains: ['nasa.gov', 'nature.com'],
  ),
);

void main() async {
  final expertAnswer = await expertTool.invoke('Latest Mars rover findings');
  print(expertAnswer);
  // -> The latest findings from NASA's Perseverance Mars rover...
}
```

## Agent Integration Example

```dart
void main() async {
  final aiAgent = ToolsAgent.fromLLMAndTools(
    llm: ChatOpenAI(apiKey: openAiKey),
    tools: [
      TavilyAnswerTool(apiKey: 'tavily_key'),
      CalculatorTool(),
    ],
  );

  final executor = AgentExecutor(agent: aiAgent);

  final res = await executor.run(
    'Calculate the GDP growth rate of France in 2023 using official sources.',
  );

  print(res);
  // -> "The GDP growth rate of France in 2023 was 0.70%, as reported by EUROSTAT.
}
```

## Error Handling

```dart
try {
return await tool.invoke(query);
} on TavilyClientException catch (e) {
print('Error ${e.message}: ${e.code}');
return 'Failed to retrieve data';
}
```