# OpenAI-Compatible LLM Providers

This document lists popular OpenAI-compatible LLM providers, their base URLs, API key names (for use in environment variables or config), and where to obtain API keys.

| Provider               | Base URL                                                  | API Key Name         | Get API Key                                                  |
| ---------------------- | --------------------------------------------------------- | -------------------- | ------------------------------------------------------------ |
| **OpenAI**             | `https://api.openai.com/v1`                               | `OPENAI_API_KEY`     | [OpenAI API Keys](https://platform.openai.com/api-keys)      |
| **OpenRouter**         | `https://openrouter.ai/api/v1`                            | `OPENROUTER_API_KEY` | [OpenRouter API Keys](https://openrouter.ai/keys)            |
| **Groq**               | `https://api.groq.com/openai/v1`                          | `GROQ_API_KEY`       | [Groq API Keys](https://console.groq.com/keys)               |
| **Together AI**        | `https://api.together.xyz/v1`                             | `TOGETHER_API_KEY`   | [Together API Keys](https://api.together.ai/)                |
| **Fireworks AI**       | `https://api.fireworks.ai/inference/v1`                   | `FIREWORKS_API_KEY`  | [Fireworks API Keys](https://app.fireworks.ai/api-keys)      |
| **Mistral AI**         | `https://api.mistral.ai/v1`                               | `MISTRAL_API_KEY`    | [Mistral API Keys](https://console.mistral.ai/api-keys)      |
| **Cohere**             | `https://api.cohere.ai/v1`                                | `COHERE_API_KEY`     | [Cohere API Keys](https://dashboard.cohere.com/api-keys)     |
| **Lambda**             | `https://api.lambda.ai/v1`                                | `LAMBDA_API_KEY`     | [Lambda API Keys](https://cloud.lambda.ai/api-keys/cloud-api) |
| **Vercel AI Gateway**  | `https://ai.vercel.com/v1`                                | `VERCEL_API_KEY`     | [Vercel AI Gateway](https://vercel.com/ai/gateway)           |
| **NVIDIA NIM**         | `https://integrate.api.nvidia.com/v1`                     | `NVIDIA_API_KEY`     | [NVIDIA NIM](https://build.nvidia.com/)                      |
| **Gemini (Google AI)** | `https://generativelanguage.googleapis.com/v1beta/openai` | `GEMINI_API_KEY`     | [Google AI Studio API Keys](https://makersuite.google.com/app/apikey) |

**Notes:**
- All providers use the OpenAI-compatible `/chat/completions` endpoint and the `Authorization: Bearer <API_KEY>` header.
- Some providers may require you to specify a model name in your request payload.
- For Gemini, use your Google AI Studio API key and the special base URL as shown above. See the [official Gemini OpenAI compatibility docs](https://ai.google.dev/gemini-api/docs/openai) for details.
- For a more comprehensive and up-to-date list, see [cheahjs/free-llm-api-resources](https://github.com/cheahjs/free-llm-api-resources). 