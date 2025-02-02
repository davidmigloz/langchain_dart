# Tavily Search Results

## Overview
The `TavilySearchResultsTool` is a component of the [Tavily Search API](https://tavily.com) integration that returns structured search results. This tool is ideal when you need detailed search data including sources, URLs, and confidence scores.

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
TavilySearchResultsTool(apiKey: 'your_tavily_key')
```

#### 2. Base URL Override (For proxies/custom endpoints)
```dart
TavilySearchResultsTool(baseUrl: 'https://your-proxy.com/')
```

## Basic Usage

```dart
final searchTool = TavilySearchResultsTool(apiKey: 'your_key');

void main() async {
  final response = await searchTool.invoke('Latest renewable energy innovations');
  final results = response.results;

  print(results.first.title); // -> '5 smart renewable energy innovations...'
  print(results.first.url);   // -> 'https://www.weforum.org/stories/...'
  print(results.first.score); // -> 0.98855
}
```

## Advanced Features

### Result Processing
```dart
void processResults(TavilySearchResults response) {
  // Filter high-confidence results
  final highConfidence = results.where((r) => r.score > 0.9).toList();

  // Extract URLs for verification
  final urls = results.map((r) => r.url).toList();

  // Get content from specific domains
  final scientificSources = results.where(
        (r) => r.url.contains('nature.com') || r.url.contains('science.org'),
  ).toList();
}
```

### Custom Configuration
```dart
final customSearchTool = TavilySearchResultsTool(
  apiKey: 'your_key',
  defaultOptions: const TavilySearchResultsToolOptions(
    searchDepth: TavilySearchDepth.advanced,
    maxResults: 10,
    includeRawContent: true,
    includeDomains: ['trusted-source.com'],
    excludeDomains: ['untrusted-source.com'],
  ),
);
```

## Agent Integration Example

```dart
void main() async {
  final aiAgent = ToolsAgent.fromLLMAndTools(
    llm: ChatOpenAI(apiKey: openAiKey),
    tools: [
      TavilySearchResultsTool(apiKey: 'tavily_key'),
      CalculatorTool(),
    ],
  );

  final executor = AgentExecutor(agent: aiAgent);

  final res = await executor.run(
    'Find recent research papers on quantum computing.',
  );

  print(res);
  // Here are some recent research papers and resources on quantum computing:
  // 
  // 1. **Evidence for the utility of quantum computing before fault tolerance**  
  //    - *Published in Nature (2023)*  
  ...
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