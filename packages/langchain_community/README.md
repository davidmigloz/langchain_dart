# 🦜️🔗 LangChain.dart Community

[![tests](https://img.shields.io/github/actions/workflow/status/davidmigloz/langchain_dart/test.yaml?logo=github&label=tests)](https://github.com/davidmigloz/langchain_dart/actions/workflows/test.yaml)
[![docs](https://img.shields.io/github/actions/workflow/status/davidmigloz/langchain_dart/pages%2Fpages-build-deployment?logo=github&label=docs)](https://github.com/davidmigloz/langchain_dart/actions/workflows/pages/pages-build-deployment)
[![langchain_community](https://img.shields.io/pub/v/langchain_community.svg)](https://pub.dev/packages/langchain_community)
[![](https://dcbadge.vercel.app/api/server/x4qbhqecVR?style=flat)](https://discord.gg/x4qbhqecVR)
[![MIT](https://img.shields.io/badge/license-MIT-purple.svg)](https://github.com/davidmigloz/langchain_dart/blob/main/LICENSE)

Community package for [LangChain.dart](https://github.com/davidmigloz/langchain_dart). 

## What is LangChain.dart Community?

LangChain.dart Community contains third-party integrations and community-contributed components that are not part of the core LangChain.dart API. 

> Depend on this package if you want to use any of the integrations or components it provides.

The most popular third-party integrations have their own packages (e.g. [langchain_openai](https://pub.dev/packages/langchain_openai), [langchain_google](https://pub.dev/packages/langchain_google), etc.). Check out the [full list of packages](https://github.com/davidmigloz/langchain_dart?tab=readme-ov-file#packages).

![LangChain.dart packages](https://raw.githubusercontent.com/davidmigloz/langchain_dart/main/docs/img/langchain_packages.png)

## Features

- Document loaders:
  * `TextLoader`: for plain text files.
  * `CsvLoader`: for CSV or TSV files.
  * `JsonLoader` for JSON files.
  * `WebBaseLoader`: for web pages.
  * `DirectoryLoader`: for directories of files.
- Tools:
  * `CalculatorTool`: to calculate math expressions. 
  * `TavilySearchResultsTool`: returns a list of results for a query using the [Tavily](https://tavily.com) search engine.
  * `TavilyAnswerTool`: returns an answer for a query using the [Tavily](https://tavily.com) search engine.
- Vector stores:
  * `ObjectBoxVectorStore`: [ObjectBox](https://objectbox.io/) on-device vector database. 

Check out the [API reference](https://pub.dev/documentation/langchain_community/latest) for more details.

## License

LangChain.dart is licensed under the
[MIT License](https://github.com/davidmigloz/langchain_dart/blob/main/LICENSE).
