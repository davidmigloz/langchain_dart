# OpenAI-Compatible LLM Providers

This document lists popular OpenAI-compatible LLM providers, their base URLs, API key names (for use in environment variables or config), and where to obtain API keys.

| Provider               | Base URL                                                  | API Key Name         | Default Model                                       | Get API Key                                                           |
| ---------------------- | --------------------------------------------------------- | -------------------- | --------------------------------------------------- | --------------------------------------------------------------------- |
| **Cohere**             | `https://api.cohere.ai/compatibility/v1`                  | `COHERE_API_KEY`     | `command-r-plus`                                    | [Cohere API Keys](https://dashboard.cohere.com/api-keys)              |
| **Fireworks AI**       | `https://api.fireworks.ai/inference/v1`                   | `FIREWORKS_API_KEY`  | `accounts/fireworks/models/llama-v3p1-70b-instruct` | [Fireworks API Keys](https://app.fireworks.ai/api-keys)               |
| **Gemini (Google AI)** | `https://generativelanguage.googleapis.com/v1beta/openai` | `GEMINI_API_KEY`     | `gemini-2.0-flash`                                  | [Google AI Studio API Keys](https://makersuite.google.com/app/apikey) |
| **Groq**               | `https://api.groq.com/openai/v1`                          | `GROQ_API_KEY`       | `llama3-70b-8192`                                   | [Groq API Keys](https://console.groq.com/keys)                        |
| **Lambda**             | `https://api.lambda.ai/v1`                                | `LAMBDA_API_KEY`     | `llama3.2-3b-instruct`                              | [Lambda API Keys](https://cloud.lambda.ai/api-keys/cloud-api)         |
| **Mistral AI**         | `https://api.mistral.ai/v1`                               | `MISTRAL_API_KEY`    | `mistral-small-latest`                              | [Mistral API Keys](https://console.mistral.ai/api-keys)               |
| **NVIDIA NIM**         | `https://integrate.api.nvidia.com/v1`                     | `NVIDIA_API_KEY`     | `nvidia/nemotron-mini-4b-instruct`                  | [NVIDIA NIM](https://build.nvidia.com/)                               |
| **OpenAI**             | `https://api.openai.com/v1`                               | `OPENAI_API_KEY`     | `gpt-4o-mini`                                       | [OpenAI API Keys](https://platform.openai.com/api-keys)               |
| **OpenRouter**         | `https://openrouter.ai/api/v1`                            | `OPENROUTER_API_KEY` | `google/gemini-2.5-flash`                           | [OpenRouter API Keys](https://openrouter.ai/keys)                     |
| **Together AI**        | `https://api.together.xyz/v1`                             | `TOGETHER_API_KEY`   | `mistralai/Mixtral-8x7B-Instruct-v0.1`              | [Together API Keys](https://api.together.ai/)                         |

**Notes:**
- All providers use the OpenAI-compatible `/chat/completions` endpoint and the `Authorization: Bearer <API_KEY>` header.
- Some providers may require you to specify a model name in your request payload.
- For Gemini, use your Google AI Studio API key and the special base URL as shown above. See the [official Gemini OpenAI compatibility docs](https://ai.google.dev/gemini-api/docs/openai) for details.
- For a more comprehensive and up-to-date list, see [cheahjs/free-llm-api-resources](https://github.com/cheahjs/free-llm-api-resources). 