# Tavily Dart Client

[![tests](https://img.shields.io/github/actions/workflow/status/davidmigloz/langchain_dart/test.yaml?logo=github&label=tests)](https://github.com/davidmigloz/langchain_dart/actions/workflows/test.yaml)
[![tavily_dart](https://img.shields.io/pub/v/tavily_dart.svg)](https://pub.dev/packages/tavily_dart)
![Discord](https://img.shields.io/discord/1123158322812555295?label=discord)
[![MIT](https://img.shields.io/badge/license-MIT-purple.svg)](https://github.com/davidmigloz/langchain_dart/blob/main/LICENSE)

Dart Client for the [Tavily](https://tavily.com) API (a search engine optimized for LLMs and RAG).

## Features

- Fully type-safe, [documented](https://pub.dev/documentation/tavily_dart/latest) and tested
- All platforms supported
- Custom base URL, headers and query params support (e.g. HTTP proxies)
- Custom HTTP client support (e.g. SOCKS5 proxies or advanced use cases)

**Supported endpoints:**
- Search

## Table of contents

- [Usage](#usage)
    * [Authentication](#authentication)
    * [Search](#search)
- [Advance Usage](#advance-usage)
    * [Custom HTTP client](#custom-http-client)
    * [Using a proxy](#using-a-proxy)
        + [HTTP proxy](#http-proxy)
        + [SOCKS5 proxy](#socks5-proxy)
- [Acknowledgements](#acknowledgements)
- [License](#license)

## Usage

Refer to the [documentation](https://docs.tavily.com) for more information about the API.

### Authentication

The Tavily API uses API keys for authentication. Visit the [Tavily console](https://app.tavily.com/) to retrieve the API key you'll use in your requests.

> **Remember that your API key is a secret!**  
> Do not share it with others or expose it in any client-side code (browsers, apps). Production requests must be routed through your own backend server where your API key can be securely loaded from an environment variable or key management service.

```dart
final apiKey = Platform.environment['TAVILY_API_KEY'];
final client = TavilyClient();
```

### Search

Search for data based on a query.

**Basic search:**

```dart
final res = await client.search(
  request: SearchRequest(
    apiKey: apiKey,
    query: 'Should I invest in Apple right now?',
  ),
);
print(res);
```

**Advanced search:**

```dart
final res = await client.search(
  request: SearchRequest(
    apiKey: apiKey,
    query: 'Should I invest in Apple right now?',
    searchDepth: SearchRequestSearchDepth.advanced,
  ),
);
print(res);
```

See the API documentation for more information on all supported search parameters.

## Advance Usage

### Custom HTTP client

You can always provide your own implementation of `http.Client` for further customization:

```dart
final client = TavilyClient(
  client: MyHttpClient(),
);
```

### Using a proxy

#### HTTP proxy

You can use your own HTTP proxy by overriding the `baseUrl` and providing your required `headers`:

```dart 
final client = TavilyClient(
  baseUrl: 'https://my-proxy.com',
  headers: {
      'x-my-proxy-header': 'value',
  },
);
```

If you need further customization, you can always provide your own `http.Client`.

#### SOCKS5 proxy

To use a SOCKS5 proxy, you can use the [`socks5_proxy`](https://pub.dev/packages/socks5_proxy) package:

```dart
final baseHttpClient = HttpClient();
SocksTCPClient.assignToHttpClient(baseHttpClient, [
  ProxySettings(InternetAddress.loopbackIPv4, 1080),
]);
final httpClient = IOClient(baseClient);

final client = TavilyClient(
  client: httpClient,
);
```

## Acknowledgements

The generation of this client was made possible by the [openapi_spec](https://github.com/tazatechnology/openapi_spec) package.

## License

Tavily Dart Client is licensed under the [MIT License](https://github.com/davidmigloz/langchain_dart/blob/main/LICENSE).
