<!-- 
This README describes the package. If you publish this package to pub.dev,
this README's contents appear on the landing page for your package.

For information about how to write a good package README, see the guide for
[writing package pages](https://dart.dev/tools/pub/writing-package-pages). 

For general information about developing packages, see the Dart guide for
[creating packages](https://dart.dev/guides/libraries/create-packages)
and the Flutter guide for
[developing packages and plugins](https://flutter.dev/to/develop-packages). 
-->

TODO: Put a short description of the package here that helps potential users
know whether this package might be useful for them.

## Features

TODO: List what your package can do. Maybe include images, gifs, or videos.

## Supported Providers

### Provider Capabilities

| Provider                   | Default Model                                     | Capabilities                                           | Notes                                  |
| -------------------------- | ------------------------------------------------- | ------------------------------------------------------ | -------------------------------------- |
| **OpenAI**                 | gpt-4o-mini                                       | Text Generation, Embeddings, Chat, File Uploads, Tools | Full feature support                   |
| **OpenRouter**             | google/gemini-2.5-flash                           | Text Generation, Chat, File Uploads, Tools             | No embedding support                   |
| **Google Gemini**          | gemini-2.0-flash                                  | Text Generation, Embeddings, Chat, File Uploads, Tools | Uses native Gemini API                 |
| **Gemini (OpenAI-compat)** | gemini-2.0-flash                                  | Text Generation, Embeddings, Chat, File Uploads, Tools | Uses OpenAI-compatible Gemini endpoint |
| **Fireworks AI**           | accounts/fireworks/models/llama-v3p1-70b-instruct | Text Generation, Chat, File Uploads, Tools             | OpenAI-compatible                      |
| **Groq**                   | llama3-70b-8192                                   | Text Generation, Chat, File Uploads, Tools             | OpenAI-compatible                      |
| **Together AI**            | mistralai/Mixtral-8x7B-Instruct-v0.1              | Text Generation, Chat, File Uploads, Tools             | OpenAI-compatible                      |
| **Mistral AI**             | mistral-small-latest                              | Text Generation, Chat, File Uploads, Tools             | OpenAI-compatible                      |
| **Cohere**                 | command-r-plus                                    | Text Generation, Chat, File Uploads, Tools             | OpenAI-compatible                      |
| **Lambda**                 | llama3.2-3b-instruct                              | Text Generation, Chat, File Uploads, Tools             | OpenAI-compatible                      |
| **NVIDIA NIM**             | nvidia/nemotron-mini-4b-instruct                  | Text Generation, Chat, File Uploads, Tools             | OpenAI-compatible                      |
| **Anthropic**              | claude-3-5-sonnet-20241022                        | Text Generation, Chat, File Uploads, Tools             | Native Claude API                      |
| **Ollama**                 | gemma3n                                           | Text Generation, Chat                                  | Local models only                      |

### Provider Configuration

| Provider                   | Provider Prefix | Aliases                      | API Key Name       | API Key Link                                                                   | Provider Type     |
| -------------------------- | --------------- | ---------------------------- | ------------------ | ------------------------------------------------------------------------------ | ----------------- |
| **OpenAI**                 | openai          | -                            | OPENAI_API_KEY     | [Get OpenAI API Key](https://platform.openai.com/account/api-keys)             | OpenAIProvider    |
| **OpenRouter**             | openrouter      | -                            | OPENROUTER_API_KEY | [Get OpenRouter API Key](https://openrouter.ai/keys)                           | OpenAIProvider    |
| **Google Gemini**          | google          | gemini, googleai, google-gla | GEMINI_API_KEY     | [Get Gemini API Key](https://aistudio.google.com/app/apikey)                   | GoogleAIProvider  |
| **Gemini (OpenAI-compat)** | gemini-openai   | -                            | GEMINI_API_KEY     | [Get Gemini API Key](https://aistudio.google.com/app/apikey)                   | OpenAIProvider    |
| **Fireworks AI**           | fireworks       | -                            | FIREWORKS_API_KEY  | [Get Fireworks API Key](https://app.fireworks.ai/keys)                         | OpenAIProvider    |
| **Groq**                   | groq            | -                            | GROQ_API_KEY       | [Get Groq API Key](https://console.groq.com/keys)                              | OpenAIProvider    |
| **Together AI**            | together        | -                            | TOGETHER_API_KEY   | [Get Together AI API Key](https://platform.together.ai/account/api-keys)       | OpenAIProvider    |
| **Mistral AI**             | mistral         | -                            | MISTRAL_API_KEY    | [Get Mistral API Key](https://console.mistral.ai/api-keys)                     | OpenAIProvider    |
| **Cohere**                 | cohere          | -                            | COHERE_API_KEY     | [Get Cohere API Key](https://dashboard.cohere.com/api-keys)                    | OpenAIProvider    |
| **Lambda**                 | lambda          | -                            | LAMBDA_API_KEY     | [Get Lambda API Key](https://platform.lambdalabs.com/api-keys)                 | OpenAIProvider    |
| **NVIDIA NIM**             | nvidia          | -                            | NVIDIA_API_KEY     | [Get NVIDIA API Key](https://platform.nvidia.com/en-us/nim/api-keys/)          | OpenAIProvider    |
| **Anthropic**              | anthropic       | claude                       | ANTHROPIC_API_KEY  | [Get Anthropic API Key](https://console.anthropic.com/settings/keys)           | AnthropicProvider |
| **Ollama**                 | ollama          | -                            |                    | [Ollama Documentation](https://github.com/ollama/ollama/blob/main/docs/api.md) | OpenAIProvider    |

## Getting started

TODO: List prerequisites and provide or point to information on how to
start using the package.

## Usage

TODO: Include short and useful examples for package users. Add longer examples
to `/example` folder. 

```dart
const like = 'sample';
```

## Additional information

TODO: Tell users more about the package: where to find more information, how to 
contribute to the package, how to file issues, what response they can expect 
from the package authors, and more.
