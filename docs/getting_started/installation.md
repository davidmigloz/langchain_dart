# Setup and Installation

To get started, add LangChain.dart dependency to your project `pubspec.yaml` file:

```yaml
dependencies:
  langchain: {version}
```

Then, run `pub get` to install the package.

Using LangChain will usually require integrations with one or more model providers, data stores,
tools APIs, etc.

For example, if you wan to use OpenAI’s APIs, you will need to add LangChain.dart OpenAI package
as well:

```yaml
dependencies:
  langchain: {version}
  langchain_openai: {version}
```
