## 0.0.15+2

 - Update a dependency to the latest release.

## 0.0.15+1

 - **REFACTOR**(openai_dart): Rename ChatCompletionFunction to FunctionObject (internal) ([#206](https://github.com/davidmigloz/langchain_dart/issues/206)). ([0f06df3f](https://github.com/davidmigloz/langchain_dart/commit/0f06df3f9b32e5887976936b5fd2e6aa5a4f4f5b))

## 0.0.15

 - **FEAT**(llms): Add streaming support to OpenAI ([#196](https://github.com/davidmigloz/langchain_dart/issues/196)). ([b21fcb38](https://github.com/davidmigloz/langchain_dart/commit/b21fcb387685af8706db62caf33b24e0ccf9c73f))
 - **FEAT**(llms): Support seed and system_fingerprint in OpenAI wrapper ([#204](https://github.com/davidmigloz/langchain_dart/issues/204)). ([c31b6795](https://github.com/davidmigloz/langchain_dart/commit/c31b67959ca7ce3d42e9832669fd18de11f41984))
 - **FEAT**(chat-models): Add streaming support to ChatOpenAI ([#197](https://github.com/davidmigloz/langchain_dart/issues/197)). ([2268da78](https://github.com/davidmigloz/langchain_dart/commit/2268da783703b76422448128ea929e6fb6f805b6))
 - **FEAT**(chat-models): Support seed, system_fingerprint and JSON Mode in ChatOpenAI ([#205](https://github.com/davidmigloz/langchain_dart/issues/205)). ([3332c228](https://github.com/davidmigloz/langchain_dart/commit/3332c2281b8a345ac7a6789202cbd5ac2225296b))

## 0.0.14+1

 - **FIX**(llms): Revert OpenAI maxTokens default to 256 ([#189](https://github.com/davidmigloz/langchain_dart/issues/189)). ([ab2ce6d4](https://github.com/davidmigloz/langchain_dart/commit/ab2ce6d4231ca0e2aff7aa3d9831625b10d0524d))
 - **DOCS**: Update CHANGELOG.md. ([5ea4e532](https://github.com/davidmigloz/langchain_dart/commit/5ea4e5326e706a52d157284a281eb881e05117c5))

## 0.0.14

 - **REFACTOR**: Remove dependency on dart_openai ([#186](https://github.com/davidmigloz/langchain_dart/issues/186)). ([273cfa2e](https://github.com/davidmigloz/langchain_dart/commit/273cfa2e84421161c979ddc41168d1b38981ca04))
 - **FEAT**(chat-models): Migrate ChatOpenAI to openai_dart client ([#185](https://github.com/davidmigloz/langchain_dart/issues/185)). ([de8f487d](https://github.com/davidmigloz/langchain_dart/commit/de8f487dfddb10bee049539356a20b77b7556cad))
 - **FEAT**(llms): Migrate OpenAI to openai_dart client ([#184](https://github.com/davidmigloz/langchain_dart/issues/184)). ([6c90b371](https://github.com/davidmigloz/langchain_dart/commit/6c90b37183eb47354df91fc4870065afecaf3673))
 - **FEAT**(embeddings): Migrate OpenAIEmbeddings to openai_dart client ([#183](https://github.com/davidmigloz/langchain_dart/issues/183)). ([8f626fe8](https://github.com/davidmigloz/langchain_dart/commit/8f626fe8253f6b11fba0fcab0e143db93d3bce08))

## 0.0.13

 - **FEAT**: Implement LangChain Expression Language (LCEL) ([#163](https://github.com/davidmigloz/langchain_dart/issues/163)). ([85ea41af](https://github.com/davidmigloz/langchain_dart/commit/85ea41af9f5e2ff42bba620a60f765ca0f67c86c))

## 0.0.12

> Note: This release has breaking changes.

 - **DOCS**: Add topics to pubspecs. ([8c1d6297](https://github.com/davidmigloz/langchain_dart/commit/8c1d62970710cc326fd5930101918aaf16b18f74))
 - **BREAKING** **REFACTOR**(embeddings): Change embedDocuments input to `List<Document>` ([#153](https://github.com/davidmigloz/langchain_dart/issues/153)). ([1b5d6fbf](https://github.com/davidmigloz/langchain_dart/commit/1b5d6fbf20bcbb7734581f91d66eff3a86731fec))

## 0.0.11

 - **FEAT**(llms): Add ability to specify user in OpenAI and ChatOpenAI ([#143](https://github.com/davidmigloz/langchain_dart/issues/143)). ([457ab54e](https://github.com/davidmigloz/langchain_dart/commit/457ab54e45afd5aa382e284806dc73cfe0905c09))
 - **DOCS**: Update packages example. ([4f8488fc](https://github.com/davidmigloz/langchain_dart/commit/4f8488fcb324e31b9d8dece7d1999333d7982253))

## 0.0.10

 - **DOCS**: Update readme. ([b61eda5b](https://github.com/davidmigloz/langchain_dart/commit/b61eda5ba506b4602592511c6a9be1e7aae5bf57))

## 0.0.9

 - **DOCS**: Update changelog. ([b211ab47](https://github.com/davidmigloz/langchain_dart/commit/b211ab4739b8feb17d00089ecca548716766272d))

## 0.0.8+1

 - **FIX**(agents): OpenAIFunctionsAgent wrong prompt order with no memory ([#134](https://github.com/davidmigloz/langchain_dart/issues/134)). ([8c9dcf22](https://github.com/davidmigloz/langchain_dart/commit/8c9dcf22e5fb0229bb98e5fd22492845d44bc531))

## 0.0.8

 - **REFACTOR**: Fix Dart 3.1.0 linter issues ([#125](https://github.com/davidmigloz/langchain_dart/issues/125)). ([cc32f3f1](https://github.com/davidmigloz/langchain_dart/commit/cc32f3f13240c28cf174a9dbffc7d61bc061f843))

## 0.0.7+1

 - Update a dependency to the latest release.

## 0.0.7

- Update a dependency to the latest release.

## 0.0.6

 - **REFACTOR**: Always await or explicitly discard Futures ([#106](https://github.com/davidmigloz/langchain_dart/issues/106)). ([989e93db](https://github.com/davidmigloz/langchain_dart/commit/989e93dbf6b5d61f053550219d88842156aeb492))
 - **FIX**(chains): Fix OpenAIQAWithSourcesChain returning empty strings ([#113](https://github.com/davidmigloz/langchain_dart/issues/113)). ([6181ff8d](https://github.com/davidmigloz/langchain_dart/commit/6181ff8df77653d38cd84cb066776c04c0ff74ad))
 - **FEAT**(embeddings): Integrate Google Vertex AI PaLM Embeddings ([#100](https://github.com/davidmigloz/langchain_dart/issues/100)). ([d777eccc](https://github.com/davidmigloz/langchain_dart/commit/d777eccc0c81c58b322f28e6e3c4a8763f3f84b7))
 - **FEAT**(chat-models): Integrate Google Vertex AI PaLM Chat Model ([#99](https://github.com/davidmigloz/langchain_dart/issues/99)). ([3897595d](https://github.com/davidmigloz/langchain_dart/commit/3897595db597d5957ef80ae7a1de35c5f41265b8))
 - **FEAT**(llms): Integrate Google Vertex AI PaLM Text model ([#98](https://github.com/davidmigloz/langchain_dart/issues/98)). ([b2746c23](https://github.com/davidmigloz/langchain_dart/commit/b2746c235d68045ba20afd1f2be7c24dcccb5f24))

## 0.0.5+1

 - **FIX**(chat-models): ChatOpenAIOptions class not exported ([#105](https://github.com/davidmigloz/langchain_dart/issues/105)). ([dfd77076](https://github.com/davidmigloz/langchain_dart/commit/dfd77076dfb60cd71aed3654f78c562ce0bc88bf))
 - **FIX**(llms): OpenAIOptions class not exported ([#104](https://github.com/davidmigloz/langchain_dart/issues/104)). ([e50efc3d](https://github.com/davidmigloz/langchain_dart/commit/e50efc3ddf0b13ece43298b2e3fee531e944601d))

## 0.0.5

 - **FIX**(agents): FunctionChatMessage not saved properly in memory ([#88](https://github.com/davidmigloz/langchain_dart/issues/88)). ([d7b763de](https://github.com/davidmigloz/langchain_dart/commit/d7b763ded1abd59a964afd781558b3559a65d9ec))
 - **FEAT**(agents): Update AgentExecutor constructor to use agent's tools ([#89](https://github.com/davidmigloz/langchain_dart/issues/89)). ([3af56a45](https://github.com/davidmigloz/langchain_dart/commit/3af56a45930fff84b11f6bec29c50502a490c2b4))
 - **DOCS**(agents): Add example of using memory in OpenAIFunctionsAgent ([#91](https://github.com/davidmigloz/langchain_dart/issues/91)). ([898d5350](https://github.com/davidmigloz/langchain_dart/commit/898d53502713ec2fd1ecc93e76e7f941123b81a5))

## 0.0.4

 - **FIX**(agents): systemChatMessage was ignored in OpenAIFunctionsAgent ([#86](https://github.com/davidmigloz/langchain_dart/issues/86)). ([cfe1e009](https://github.com/davidmigloz/langchain_dart/commit/cfe1e00972d481f83b9dc9e225a32b7077aa5fd4))
 - **FEAT**(agents): Support LLMChain in OpenAIFunctionsAgent and memory. ([bd4a1cb9](https://github.com/davidmigloz/langchain_dart/commit/bd4a1cb9101ba385ce9613f9aa0b7e5474380f32))
 - **FEAT**(chains): Return ChatMessage when LLMChain used with ChatModel. ([bb5f4d23](https://github.com/davidmigloz/langchain_dart/commit/bb5f4d2325ae1f615159f2ffd11cc8ec4e87ed3c))

## 0.0.3

- **FEAT**: Update internal dependencies (including http to 1.1.0). ([8f3e8bc8](https://github.com/davidmigloz/langchain_dart/commit/8f3e8bc811df5c8bdba2c7e33b6c53ea0c2edad4))

## 0.0.2

 - **FIX**: OpenAIQAWithSourcesChain throws exception. ([45c6cb9d](https://github.com/davidmigloz/langchain_dart/commit/45c6cb9d32be670902dd2fe4cb92597765590d85))
 - **FEAT**: Support estimating the number of tokens for a given prompt ([#3](https://github.com/davidmigloz/langchain_dart/issues/3)). ([e22f22c8](https://github.com/davidmigloz/langchain_dart/commit/e22f22c89f188a019b96a7c0003dbd26471bebb7))

## 0.0.1

- Initial public release.

Check out the announcement post for all the details:
https://blog.langchaindart.com/introducing-langchain-dart-6b1d34fc41ef

## 0.0.1-dev.7

- Add support for OpenAIAgent class (#34).
- Export OpenAI Client class (allowing to define custom base URL).

## 0.0.1-dev.6

- Add support for OpenAIQAWithSourcesChain (#53).

## 0.0.1-dev.5

- Add support for OpenAIEmbeddings (#38).
- Add support for OpenAI functions (#35).

## 0.0.1-dev.4

- Improve API documentation.

## 0.0.1-dev.3

- Add support for ChatPromptTemplate class (#8).

## 0.0.1-dev.2

- Add support for OpenAI LLM (`OpenAI` class).
- Add support for OpenAI chat model (`ChatOpenAI` class).

## 0.0.1-dev.1

- Bootstrap project.
