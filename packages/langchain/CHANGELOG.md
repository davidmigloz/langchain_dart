## 0.0.4

 - **REFACTOR**(memory): Extract default memory key and prefixes to constants. ([750fd01a](https://github.com/davidmigloz/langchain_dart/commit/750fd01a74f94042cbc26684d6651b531fb0a93c))
 - **FIX**(agents): systemChatMessage was ignored in OpenAIFunctionsAgent ([#86](https://github.com/davidmigloz/langchain_dart/issues/86)). ([cfe1e009](https://github.com/davidmigloz/langchain_dart/commit/cfe1e00972d481f83b9dc9e225a32b7077aa5fd4))
 - **FIX**(agents): Allow to add memory to an agent executor ([#80](https://github.com/davidmigloz/langchain_dart/issues/80)). ([8110464c](https://github.com/davidmigloz/langchain_dart/commit/8110464c4b4ad53f3b1826722df76943d0d66621))
 - **FEAT**(memory): Add ConversationSummaryMemory ([#27](https://github.com/davidmigloz/langchain_dart/issues/27)). ([f631d9e5](https://github.com/davidmigloz/langchain_dart/commit/f631d9e529d99319afe671b5aff441436e43ea31))
 - **FEAT**(agents): Support LLMChain in OpenAIFunctionsAgent and memory. ([bd4a1cb9](https://github.com/davidmigloz/langchain_dart/commit/bd4a1cb9101ba385ce9613f9aa0b7e5474380f32))
 - **FEAT**(chains): Return ChatMessage when LLMChain used with ChatModel. ([bb5f4d23](https://github.com/davidmigloz/langchain_dart/commit/bb5f4d2325ae1f615159f2ffd11cc8ec4e87ed3c))
 - **FEAT**(chat-models): Add FakeChatModel for testing purposes. ([659783a6](https://github.com/davidmigloz/langchain_dart/commit/659783a6ccad9fc3046040f38c39805743ffdff1))
 - **FEAT**(memory): Add support for ConversationTokenBufferMemory ([#26](https://github.com/davidmigloz/langchain_dart/issues/26)). ([8113d1c0](https://github.com/davidmigloz/langchain_dart/commit/8113d1c0dc742ce9f6c49018c4b012cd3823fac1))
 - **FEAT**: Improve SummarizeChain.mapReduce summaryMaxTokens name and docs. ([0be06e02](https://github.com/davidmigloz/langchain_dart/commit/0be06e02f280de54a2790d150fac142d9fbe4222))
 - **FEAT**(doc-loaders): Add support for CsvLoader ([#77](https://github.com/davidmigloz/langchain_dart/issues/77)). ([41d24e76](https://github.com/davidmigloz/langchain_dart/commit/41d24e7632a77b08234951c0e6bf911530dff56a))
 - **FEAT**(memory): Add ConversationBufferWindowMemory ([#25](https://github.com/davidmigloz/langchain_dart/issues/25)). ([9c271f7e](https://github.com/davidmigloz/langchain_dart/commit/9c271f7e7a31bc59c122a895daf238a0bb5ac7d0))

## 0.0.3

 - **FIX**: Loaders tests. ([f0498300](https://github.com/davidmigloz/langchain_dart/commit/f049830057fc1b8ff315469afd1512aa13ceb459))
 - **FEAT**: Update internal dependencies (including http to 1.1.0). ([8f3e8bc8](https://github.com/davidmigloz/langchain_dart/commit/8f3e8bc811df5c8bdba2c7e33b6c53ea0c2edad4))
 - **FEAT**: Add support for VectorStoreRetrieverMemory ([#54](https://github.com/davidmigloz/langchain_dart/issues/54)). ([72cd1b10](https://github.com/davidmigloz/langchain_dart/commit/72cd1b100ad88e7213ec12d432674ec4666ce172))

## 0.0.2

 - **FIX**: OpenAIQAWithSourcesChain throws exception. ([45c6cb9d](https://github.com/davidmigloz/langchain_dart/commit/45c6cb9d32be670902dd2fe4cb92597765590d85))
 - **FEAT**: Add support for SummarizeChain ([#58](https://github.com/davidmigloz/langchain_dart/issues/58)). ([9499fc04](https://github.com/davidmigloz/langchain_dart/commit/9499fc047ae8be7e7b9dfb0d0ef8678b84245f5d))
 - **FEAT**: Add support for SequentialChain class ([#30](https://github.com/davidmigloz/langchain_dart/issues/30)). ([381a6768](https://github.com/davidmigloz/langchain_dart/commit/381a676812992370da61ced0e59de5fadf0ef164))
 - **FEAT**: Add support for WebBaseLoader ([#74](https://github.com/davidmigloz/langchain_dart/issues/74)). ([0b5bf4b0](https://github.com/davidmigloz/langchain_dart/commit/0b5bf4b0fb2cf6e1a7be116920e9512233e7e613))
 - **FEAT**: Add Support for JsonLoader ([#72](https://github.com/davidmigloz/langchain_dart/issues/72)). ([2457a973](https://github.com/davidmigloz/langchain_dart/commit/2457a9735aacc2aeffcca2710ce0afc7be2f6f09))
 - **FEAT**: Add support for MapReduceDocumentsChain ([#59](https://github.com/davidmigloz/langchain_dart/issues/59)). ([9f2190c4](https://github.com/davidmigloz/langchain_dart/commit/9f2190c4d5f45378f91eaa02d52d8305f7da254e))
 - **FEAT**: Add support for ReduceDocumentsChain ([#70](https://github.com/davidmigloz/langchain_dart/issues/70)). ([34cf10bd](https://github.com/davidmigloz/langchain_dart/commit/34cf10bd485618bff4cddb5b29a1b46ac9f3a9fa))
 - **FEAT**: Support estimating the number of tokens for a given prompt ([#3](https://github.com/davidmigloz/langchain_dart/issues/3)). ([e22f22c8](https://github.com/davidmigloz/langchain_dart/commit/e22f22c89f188a019b96a7c0003dbd26471bebb7))
 - **FEAT**: Add support for CodeTextSplitter ([#63](https://github.com/davidmigloz/langchain_dart/issues/63)). ([92a8c7da](https://github.com/davidmigloz/langchain_dart/commit/92a8c7daccda2be38a25d4bdb0235c2f397225a2))
 - **FEAT**: Add support for RecursiveCharacterTextSplitter ([#61](https://github.com/davidmigloz/langchain_dart/issues/61)). ([697cdcbf](https://github.com/davidmigloz/langchain_dart/commit/697cdcbfef8fc45930de127cb5b7ee2eb3d7ec37))
 - **DOCS**: Document sequential chain. ([b9693a4e](https://github.com/davidmigloz/langchain_dart/commit/b9693a4e2dfcc6bfc74025ebb935865be942b266))
 - **DOCS**: Document text, json and web loaders. ([a95b3e9f](https://github.com/davidmigloz/langchain_dart/commit/a95b3e9f843fcffce9449ea93f343df793512a09))
 - **DOCS**: Update API docs. ([7bfa6d17](https://github.com/davidmigloz/langchain_dart/commit/7bfa6d17cf57aac05906b1401ac3967c21e6f403))
 - **DOCS**: Update readme. ([dd394715](https://github.com/davidmigloz/langchain_dart/commit/dd39471557b37da0d0c2a87dea0c067463a45f45))

## 0.0.1

 - Initial public release. 

Check out the announcement post for all the details: 
https://blog.langchaindart.com/introducing-langchain-dart-6b1d34fc41ef

## 0.0.1-dev.7

- Add support for Agent class (#33).
- Add support for AgentExecutor class (#56).
- Update hello_world_flutter example with local models.

## 0.0.1-dev.6

- Add support for PipelinePromptTemplate class (#18).
- LLMChain improvements (#43).

## 0.0.1-dev.5

- Add support for TextLoader (#47).
- Add support for BaseLoader (#46).
- Add support for RetrievalQAChain class (#42).
- Add support for StuffDocumentsQAChain (#50).
- Add support for StuffDocumentsChain (#49).
- Add support for BaseCombineDocumentsChain class (#41).
- Add support for ConditionalPromptSelector (#48).
- Add support for VectorStoreRetriever class (#45).
- Add support for MemoryVectorStore class (#44).
- Add support for VectorStore class (#36).
- Add support for OpenAIEmbeddings (#38).
- Add support for CharacterTextSplitter class (#39).
- Add support for OpenAI functions (#35).
- Add support for Calculator tool (#32).
- Add support for Tool class (#31).

## 0.0.1-dev.4

- Add support for LLMChain class (#20).
- Add support for ChatMessageHistory class (#29).
- Add support for ConversationBufferMemory class (#24).
- Add support for ConversationChain (#21).
- Add support for SimpleMemory class (#23).

## 0.0.1-dev.3

- Add support for ChatPromptTemplate class (#8).

## 0.0.1-dev.2

- Add support for LLMs - `BaseLLM` class (#14).
- Add support for Chat models - `BaseChatModel` class (#10).
- Add support for prompt templates - `PromptTemplate` class (#7).
- Publish LangChain.dart documentation on http://langchaindart.com.

## 0.0.1-dev.1

- Bootstrap project.
