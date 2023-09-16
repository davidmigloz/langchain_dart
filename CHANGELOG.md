# Change Log

All notable changes to this project will be documented in this file following 
[Conventional Commits](https://conventionalcommits.org) specification.

Check out the #announcements channel in the [LangChain.dart Discord](https://discord.gg/x4qbhqecVR) 
server for more details about each release.

## 2023-09-17

### Changes

---

Packages with breaking changes:

 - There are no breaking changes in this release.

Packages with other changes:

 - [`langchain` - `v0.0.13`](#langchain---v0013)
 - [`langchain_openai` - `v0.0.13`](#langchain_openai---v0013)
 - [`langchain_pinecone` - `v0.0.3`](#langchain_pinecone---v003)
 - [`langchain_chroma` - `v0.0.4`](#langchain_chroma---v004)
 - [`langchain_google` - `v0.0.8`](#langchain_google---v008)

---

#### `langchain` - `v0.0.13`

 - Check out the [LangChain Expression Language documentation](https://langchaindart.com/#/expression_language/interface) for more details

 - **FEAT**(output-parsers): Add support for JsonOutputFunctionsParser ([#165](https://github.com/davidmigloz/langchain_dart/issues/165)). ([66c8e644](https://github.com/davidmigloz/langchain_dart/commit/66c8e64410d1dbf8b75e5734cb0cbb0e43dc0615))
 - **FEAT**(output-parsers): Add support for StringOutputParser ([#164](https://github.com/davidmigloz/langchain_dart/issues/164)). ([ee29e99a](https://github.com/davidmigloz/langchain_dart/commit/ee29e99a410c3cc6a7ae263fea1cde283f904edf))
 - **FEAT**: Implement LangChain Expression Language (LCEL) ([#163](https://github.com/davidmigloz/langchain_dart/issues/163)). ([85ea41af](https://github.com/davidmigloz/langchain_dart/commit/85ea41af9f5e2ff42bba620a60f765ca0f67c86c))
 - **FEAT**(chains): Support custom doc prompt in StuffDocumentsQAChain ([#157](https://github.com/davidmigloz/langchain_dart/issues/157)). ([faa9d2d7](https://github.com/davidmigloz/langchain_dart/commit/faa9d2d768c2a70f17247d5703dd1d821af08240))

#### `langchain_openai` - `v0.0.13`

 - **FEAT**: Implement LangChain Expression Language (LCEL) ([#163](https://github.com/davidmigloz/langchain_dart/issues/163)). ([85ea41af](https://github.com/davidmigloz/langchain_dart/commit/85ea41af9f5e2ff42bba620a60f765ca0f67c86c))

#### `langchain_pinecone` - `v0.0.3`

 - **FIX**(vector-stores): Update pinecone client version ([#160](https://github.com/davidmigloz/langchain_dart/issues/160)). ([d15cc576](https://github.com/davidmigloz/langchain_dart/commit/d15cc5761563476fe7b5d66effd42ded077dbbbc))

#### `langchain_chroma` - `v0.0.4`

 - Updated `langchain` dependency

#### `langchain_google` - `v0.0.8`

 - Updated `langchain` dependency


## 2023-09-08

### Changes

---

Packages with breaking changes:

 - There are no breaking changes in this release.

Packages with other changes:

 - [`langchain_google` - `v0.0.7+1`](#langchain_google---v0071)
 - [`langchain_pinecone` - `v0.0.2+1`](#langchain_pinecone---v0021)
 - [`vertex_ai` - `v0.0.7+1`](#vertex_ai---v0071)

---

#### `langchain_google` - `v0.0.7+1`

 - **REFACTOR**(vertex_ai): Require `http.Client` instead of `AuthClient` ([#156](https://github.com/davidmigloz/langchain_dart/issues/156)). ([0f7fee7f](https://github.com/davidmigloz/langchain_dart/commit/0f7fee7f0780e5b650ec50307a7fda65e242e822))

#### `langchain_pinecone` - `v0.0.2+1`

 - **REFACTOR**(vertex_ai): Require `http.Client` instead of `AuthClient` ([#156](https://github.com/davidmigloz/langchain_dart/issues/156)). ([0f7fee7f](https://github.com/davidmigloz/langchain_dart/commit/0f7fee7f0780e5b650ec50307a7fda65e242e822))

#### `vertex_ai` - `v0.0.7+1`

 - **REFACTOR**(vertex_ai): Require `http.Client` instead of `AuthClient` ([#156](https://github.com/davidmigloz/langchain_dart/issues/156)). ([0f7fee7f](https://github.com/davidmigloz/langchain_dart/commit/0f7fee7f0780e5b650ec50307a7fda65e242e822))


## 2023-09-05

### Changes

---

Packages with breaking changes:

 - [`langchain` - `v0.0.12`](#langchain---v0012)
 - [`langchain_google` - `v0.0.7`](#langchain_google---v007)
 - [`langchain_openai` - `v0.0.12`](#langchain_openai---v0012)

Packages with other changes:

 - [`langchain_pinecone` - `v0.0.2`](#langchain_pinecone---v002)
 - [`langchain_chroma` - `v0.0.3`](#langchain_chroma---v003)
 - [`vertex_ai` - `v0.0.7`](#vertex_ai---v007)
 - [`chromadb` - `v0.0.3`](#chromadb---v003)

---

#### `langchain` - `v0.0.12`

 - **BREAKING** **REFACTOR**(embeddings): Change embedDocuments input to `List<Document>` ([#153](https://github.com/davidmigloz/langchain_dart/issues/153)). ([1b5d6fbf](https://github.com/davidmigloz/langchain_dart/commit/1b5d6fbf20bcbb7734581f91d66eff3a86731fec))
 - **DOCS**: Acknowledge sponsors in readme. ([092d94c8](https://github.com/davidmigloz/langchain_dart/commit/092d94c8ac166cf47f1ddab748b61d440f4b8585))
 - **DOCS**: Add topics to pubspecs. ([8c1d6297](https://github.com/davidmigloz/langchain_dart/commit/8c1d62970710cc326fd5930101918aaf16b18f74))

#### `langchain_google` - `v0.0.7`

 - **BREAKING** **FEAT**(llms): Add default and call options in VertexAI and ChatVertexAI ([#155](https://github.com/davidmigloz/langchain_dart/issues/155)). ([fe1b12ea](https://github.com/davidmigloz/langchain_dart/commit/fe1b12ea282cd587f9dc78bd959741781ebb6d35))
 - **BREAKING** **REFACTOR**(embeddings): Change embedDocuments input to `List<Document>` ([#153](https://github.com/davidmigloz/langchain_dart/issues/153)). ([1b5d6fbf](https://github.com/davidmigloz/langchain_dart/commit/1b5d6fbf20bcbb7734581f91d66eff3a86731fec))
 - **FEAT**(embeddings): Support document title in VertexAIEmbeddings ([#154](https://github.com/davidmigloz/langchain_dart/issues/154)). ([6b763731](https://github.com/davidmigloz/langchain_dart/commit/6b76373139bb50e8d0e59b3f63b54f6adae3d498))
 - **FEAT**(embeddings): Support task type in VertexAIEmbeddings ([#151](https://github.com/davidmigloz/langchain_dart/issues/151)). ([8a2199e2](https://github.com/davidmigloz/langchain_dart/commit/8a2199e26a945f7d2ad8d3da3ca14e083172f6f1))
 - **DOCS**: Add topics to pubspecs. ([8c1d6297](https://github.com/davidmigloz/langchain_dart/commit/8c1d62970710cc326fd5930101918aaf16b18f74))

#### `langchain_openai` - `v0.0.12`

 - **BREAKING** **REFACTOR**(embeddings): Change embedDocuments input to `List<Document>` ([#153](https://github.com/davidmigloz/langchain_dart/issues/153)). ([1b5d6fbf](https://github.com/davidmigloz/langchain_dart/commit/1b5d6fbf20bcbb7734581f91d66eff3a86731fec))
 - **DOCS**: Add topics to pubspecs. ([8c1d6297](https://github.com/davidmigloz/langchain_dart/commit/8c1d62970710cc326fd5930101918aaf16b18f74))

#### `langchain_pinecone` - `v0.0.2`

 - **DOCS**: Add topics to pubspecs. ([8c1d6297](https://github.com/davidmigloz/langchain_dart/commit/8c1d62970710cc326fd5930101918aaf16b18f74))
 - **DOCS**: Update changelog. ([df784ff1](https://github.com/davidmigloz/langchain_dart/commit/df784ff108584b0732ec9455f1531636256e9c4e))

#### `langchain_chroma` - `v0.0.3`

 - **DOCS**: Add topics to pubspecs. ([8c1d6297](https://github.com/davidmigloz/langchain_dart/commit/8c1d62970710cc326fd5930101918aaf16b18f74))

#### `vertex_ai` - `v0.0.7`

 - **FEAT**(vertex_ai): Add support for stopSequence and candidateCount ([#150](https://github.com/davidmigloz/langchain_dart/issues/150)). ([eab7d968](https://github.com/davidmigloz/langchain_dart/commit/eab7d968f464db58a04f3453b4470ad3859536aa))
 - **FEAT**(vertex_ai): Support task type and title in embeddings models ([#149](https://github.com/davidmigloz/langchain_dart/issues/149)). ([421d36bd](https://github.com/davidmigloz/langchain_dart/commit/421d36bdfe1ad8c4776811f6e1f0d3bf8c316ee3))
 - **FIX**(vertex_ai): Fix typo in stop sequences field deserialization ([#152](https://github.com/davidmigloz/langchain_dart/issues/152)). ([4f7161da](https://github.com/davidmigloz/langchain_dart/commit/4f7161da55309bcbd5a62c21ba2a7fa703c4eb09))
 - **DOCS**: Add topics to pubspecs. ([8c1d6297](https://github.com/davidmigloz/langchain_dart/commit/8c1d62970710cc326fd5930101918aaf16b18f74))

#### `chromadb` - `v0.0.3`

 - **DOCS**: Add topics to pubspecs. ([8c1d6297](https://github.com/davidmigloz/langchain_dart/commit/8c1d62970710cc326fd5930101918aaf16b18f74))


## 2023-08-31

### Changes

---

New packages:

- [`langchain_pinecone` - `v0.0.1`](#langchain_pinecone---v001)
 
Packages with breaking changes:

 - [`langchain` - `v0.0.11`](#langchain---v0011)

Packages with other changes:

 - [`langchain_google` - `v0.0.6`](#langchain_google---v006)
 - [`langchain_openai` - `v0.0.11`](#langchain_openai---v0011)
 - [`langchain_chroma` - `v0.0.2`](#langchain_chroma---v002)
 - [`vertex_ai` - `v0.0.6`](#vertex_ai---v006)
 - [`chromadb` - `v0.0.2`](#chromadb---v002)

---

#### `langchain` - `v0.0.11`

 - **DOCS**: Update readme. ([e1b5b295](https://github.com/davidmigloz/langchain_dart/commit/e1b5b2958bdf2b787c8b49aeeb6690c33c225943))
 - **BREAKING** **REFACTOR**(vector-stores): Remove addDocuments from VectorStoreRetriever ([#146](https://github.com/davidmigloz/langchain_dart/issues/146)). ([d32a5fd9](https://github.com/davidmigloz/langchain_dart/commit/d32a5fd94645d10deee5a35f0d83501f93be7308))
 - **BREAKING** **REFACTOR**(memory): Rename VectorStoreRetrieverMemory and require vector store ([#145](https://github.com/davidmigloz/langchain_dart/issues/145)). ([67af3195](https://github.com/davidmigloz/langchain_dart/commit/67af319595755ec3c3834ceabaf4086cfa32ad8c))

#### `langchain_pinecone` - `v0.0.1`

 - **DOCS**: Update readme. ([e1b5b295](https://github.com/davidmigloz/langchain_dart/commit/e1b5b2958bdf2b787c8b49aeeb6690c33c225943))
 - **DOCS**: Update packages example. ([4f8488fc](https://github.com/davidmigloz/langchain_dart/commit/4f8488fcb324e31b9d8dece7d1999333d7982253))
 - **FEAT**(vector-stores): Add support for Pinecone VectorStore ([#37](https://github.com/davidmigloz/langchain_dart/issues/37)). ([e43eef97](https://github.com/davidmigloz/langchain_dart/commit/e43eef979c329fc72a3eed72d818992287838a80))

#### `langchain_google` - `v0.0.6`

 - **DOCS**: Update packages example. ([4f8488fc](https://github.com/davidmigloz/langchain_dart/commit/4f8488fcb324e31b9d8dece7d1999333d7982253))

#### `langchain_openai` - `v0.0.11`

 - **FEAT**(llms): Add ability to specify user in OpenAI and ChatOpenAI ([#143](https://github.com/davidmigloz/langchain_dart/issues/143)). ([457ab54e](https://github.com/davidmigloz/langchain_dart/commit/457ab54e45afd5aa382e284806dc73cfe0905c09))
 - **DOCS**: Update packages example. ([4f8488fc](https://github.com/davidmigloz/langchain_dart/commit/4f8488fcb324e31b9d8dece7d1999333d7982253))

#### `langchain_chroma` - `v0.0.2`

 - **DOCS**: Update readme. ([e1b5b295](https://github.com/davidmigloz/langchain_dart/commit/e1b5b2958bdf2b787c8b49aeeb6690c33c225943))
 - **DOCS**: Update packages example. ([4f8488fc](https://github.com/davidmigloz/langchain_dart/commit/4f8488fcb324e31b9d8dece7d1999333d7982253))

#### `vertex_ai` - `v0.0.6`

 - **FIX**(vertex_ai): typecast exception when null publicationDate ([#148](https://github.com/davidmigloz/langchain_dart/issues/148)). ([d4afc131](https://github.com/davidmigloz/langchain_dart/commit/d4afc1315f7fc041a7730346942891bb966f8d14))
 - **DOCS**: Update packages example. ([4f8488fc](https://github.com/davidmigloz/langchain_dart/commit/4f8488fcb324e31b9d8dece7d1999333d7982253))

#### `chromadb` - `v0.0.2`

 - **REFACTOR**(chromadb): Update generated Chroma API client ([#142](https://github.com/davidmigloz/langchain_dart/issues/142)). ([4f0e7379](https://github.com/davidmigloz/langchain_dart/commit/4f0e7379f4408fe03a6433e3bdb6ebbe2262cbbc))


## 2023-08-27

### Changes

---

Packages with changes:

- [`langchain` - `v0.0.10`](#langchain---v0010)
- [`langchain_google` - `v0.0.5`](#langchain_google---v005)
- [`langchain_openai` - `v0.0.10`](#langchain_openai---v0010)
- [`vertex_ai` - `v0.0.5`](#vertex_ai---v005)

New packages:

- [`langchain_chroma` - `v0.0.1`](#langchain_chroma---v001)
- [`chromadb` - `v0.0.1`](#chromadb---v001)

---

#### `langchain` - `v0.0.10`

- **DOCS**: Update readme. ([b61eda5b](https://github.com/davidmigloz/langchain_dart/commit/b61eda5ba506b4602592511c6a9be1e7aae5bf57))

#### `langchain_google` - `v0.0.5`

- **DOCS**: Fix typos. ([282cfa24](https://github.com/davidmigloz/langchain_dart/commit/282cfa24caa7b91ce28db6b1997af4c2c3ecf3e4))
- **DOCS**: Update readme. ([b61eda5b](https://github.com/davidmigloz/langchain_dart/commit/b61eda5ba506b4602592511c6a9be1e7aae5bf57))

#### `langchain_openai` - `v0.0.10`

- **DOCS**: Update readme. ([b61eda5b](https://github.com/davidmigloz/langchain_dart/commit/b61eda5ba506b4602592511c6a9be1e7aae5bf57))

#### `langchain_chroma` - `v0.0.1`

- **FEAT**(vector-stores): Add support for Chroma VectorStore ([#139](https://github.com/davidmigloz/langchain_dart/issues/139)). ([098783b4](https://github.com/davidmigloz/langchain_dart/commit/098783b4895ab30bb61d07355a0b587ff76b9175))

#### `vertex_ai` - `v0.0.5`

- **DOCS**: Fix typos. ([282cfa24](https://github.com/davidmigloz/langchain_dart/commit/282cfa24caa7b91ce28db6b1997af4c2c3ecf3e4))
- **DOCS**: Update readme. ([b61eda5b](https://github.com/davidmigloz/langchain_dart/commit/b61eda5ba506b4602592511c6a9be1e7aae5bf57))

#### `chromadb` - `v0.0.1`

- **FEAT**(chromadb): Add Chroma embedding database API client ([#140](https://github.com/davidmigloz/langchain_dart/issues/140)). ([5fdcbc52](https://github.com/davidmigloz/langchain_dart/commit/5fdcbc528c1bbac1114a89433cf72bd8870fa4eb))


## 2023-08-23

### Changes

---

Packages with breaking changes:

 - There are no breaking changes in this release.

Packages with other changes:

 - [`langchain` - `v0.0.9`](#langchain---v009)
 - [`langchain_google` - `v0.0.4`](#langchain_google---v004)
 - [`langchain_openai` - `v0.0.9`](#langchain_openai---v009)
 - [`vertex_ai` - `v0.0.4`](#vertex_ai---v004)

---

#### `langchain` - `v0.0.9`

 - **FEAT**(vector-stores): Support filtering in MemoryVectorStore ([#137](https://github.com/davidmigloz/langchain_dart/issues/137)). ([84da480f](https://github.com/davidmigloz/langchain_dart/commit/84da480f6820a81f092756f0194deb77c4cda151))
 - **FEAT**(vector-stores): Support filtering in VertexAI Matching Engine ([#136](https://github.com/davidmigloz/langchain_dart/issues/136)). ([768c6987](https://github.com/davidmigloz/langchain_dart/commit/768c6987de5b36b60090a1fe94f49483da11b885))
 - **FEAT**(vector-stores): Allow to pass vector search config ([#135](https://github.com/davidmigloz/langchain_dart/issues/135)). ([5b8fa5a3](https://github.com/davidmigloz/langchain_dart/commit/5b8fa5a3fcaf785615016be1d5da0a003178cfa9))
 - **DOCS**: Fix API documentation errors ([#138](https://github.com/davidmigloz/langchain_dart/issues/138)). ([1aa38fce](https://github.com/davidmigloz/langchain_dart/commit/1aa38fce17eed7f325e7872d03096740256d57be))

#### `langchain_google` - `v0.0.4`

 - **FEAT**(vector-stores): Support filtering in VertexAI Matching Engine ([#136](https://github.com/davidmigloz/langchain_dart/issues/136)). ([768c6987](https://github.com/davidmigloz/langchain_dart/commit/768c6987de5b36b60090a1fe94f49483da11b885))
 - **FEAT**(vector-stores): Allow to pass vector search config ([#135](https://github.com/davidmigloz/langchain_dart/issues/135)). ([5b8fa5a3](https://github.com/davidmigloz/langchain_dart/commit/5b8fa5a3fcaf785615016be1d5da0a003178cfa9))
 - **DOCS**: Fix API documentation errors ([#138](https://github.com/davidmigloz/langchain_dart/issues/138)). ([1aa38fce](https://github.com/davidmigloz/langchain_dart/commit/1aa38fce17eed7f325e7872d03096740256d57be))

#### `langchain_openai` - `v0.0.9`

 - **DOCS**: Update changelog. ([b211ab47](https://github.com/davidmigloz/langchain_dart/commit/b211ab4739b8feb17d00089ecca548716766272d))

#### `vertex_ai` - `v0.0.4`

 - **DOCS**: Fix API documentation errors ([#138](https://github.com/davidmigloz/langchain_dart/issues/138)). ([1aa38fce](https://github.com/davidmigloz/langchain_dart/commit/1aa38fce17eed7f325e7872d03096740256d57be))


## 2023-08-20

### Changes

---

Packages with changes:

 - [`langchain_openai` - `v0.0.8+1`](#langchain_openai---v0081)

---

#### `langchain_openai` - `v0.0.8+1`

 - **FIX**(agents): OpenAIFunctionsAgent wrong prompt order with no memory ([#134](https://github.com/davidmigloz/langchain_dart/issues/134)). ([8c9dcf22](https://github.com/davidmigloz/langchain_dart/commit/8c9dcf22e5fb0229bb98e5fd22492845d44bc531))


## 2023-08-19

### Changes

---

Packages with changes:

 - [`langchain` - `v0.0.8`](#langchain---v008)
 - [`langchain_google` - `v0.0.3`](#langchain_google---v003)
 - [`langchain_openai` - `v0.0.8`](#langchain_openai---v008)
 - [`vertex_ai` - `v0.0.3`](#vertex_ai---v003)

---

#### `langchain` - `v0.0.8`

 - **REFACTOR**(memory): Rename store folder to chat_message_history ([#126](https://github.com/davidmigloz/langchain_dart/issues/126)). ([fa54c7e2](https://github.com/davidmigloz/langchain_dart/commit/fa54c7e22410182848b1936b64e85d9cf709eaeb))
 - **REFACTOR**: Fix Dart 3.1.0 linter issues ([#125](https://github.com/davidmigloz/langchain_dart/issues/125)). ([cc32f3f1](https://github.com/davidmigloz/langchain_dart/commit/cc32f3f13240c28cf174a9dbffc7d61bc061f843))
 - **FEAT**(storage): Add support for LocalFileStore ([#132](https://github.com/davidmigloz/langchain_dart/issues/132)). ([2c508dce](https://github.com/davidmigloz/langchain_dart/commit/2c508dcea4959dbe755ee713de43dc20c9680640))
 - **FEAT**(embeddings): Add support for CacheBackedEmbeddings ([#131](https://github.com/davidmigloz/langchain_dart/issues/131)). ([27d8b777](https://github.com/davidmigloz/langchain_dart/commit/27d8b777b4da360e57f32de6e1e1fc09ea6b6333))
 - **FEAT**(embeddings): Add FakeEmbeddings testing model ([#130](https://github.com/davidmigloz/langchain_dart/issues/130)). ([f06920d7](https://github.com/davidmigloz/langchain_dart/commit/f06920d792d1083876b040744213d78c9b11bd4c))
 - **FEAT**(storage): Add support for EncoderBackedStore ([#129](https://github.com/davidmigloz/langchain_dart/issues/129)). ([85bb3191](https://github.com/davidmigloz/langchain_dart/commit/85bb31918308f7a956afd0f991a78cf65e6dcd8d))
 - **FEAT**(storage): Add support for InMemoryStore ([#128](https://github.com/davidmigloz/langchain_dart/issues/128)). ([699c0904](https://github.com/davidmigloz/langchain_dart/commit/699c09045fec3f91666f7ee264525cec8b16f910))
 - **FEAT**(doc-stores): Add support for InMemoryDocStore ([#127](https://github.com/davidmigloz/langchain_dart/issues/127)). ([d9d7268d](https://github.com/davidmigloz/langchain_dart/commit/d9d7268ddcd9e346f67e1278127e25ee467ea99c))
 - **FEAT**(stores): Initial vectors, ids, and delete in MemoryVectorStore ([#123](https://github.com/davidmigloz/langchain_dart/issues/123)). ([f87a738d](https://github.com/davidmigloz/langchain_dart/commit/f87a738d6e9c78aabcbd95014dd4fac2d6c58817))

#### `langchain_google` - `v0.0.3`

 - **FEAT**(vector-stores): Infeer queryRootUrl in VertexAIMatchingEngine ([#133](https://github.com/davidmigloz/langchain_dart/issues/133)). ([c5353368](https://github.com/davidmigloz/langchain_dart/commit/c5353368d1455756554f6640d33d0b3752476eb9))

#### `langchain_openai` - `v0.0.8`

 - **REFACTOR**: Fix Dart 3.1.0 linter issues ([#125](https://github.com/davidmigloz/langchain_dart/issues/125)). ([cc32f3f1](https://github.com/davidmigloz/langchain_dart/commit/cc32f3f13240c28cf174a9dbffc7d61bc061f843))

#### `vertex_ai` - `v0.0.3`

 - **REFACTOR**: Fix Dart 3.1.0 linter issues ([#125](https://github.com/davidmigloz/langchain_dart/issues/125)). ([cc32f3f1](https://github.com/davidmigloz/langchain_dart/commit/cc32f3f13240c28cf174a9dbffc7d61bc061f843))


## 2023-08-16

### Changes

---

Packages with changes:

 - [`langchain` - `v0.0.7+1`](#langchain---v0071)
 - [`langchain_openai` - `v0.0.7+1`](#langchain_openai---v0071)
 - [`langchain_google` - `v0.0.2+2`](#langchain_google---v0022)

Packages with dependency updates only:

> Packages listed below depend on other packages in this workspace that have had changes. Their versions have been incremented to bump the minimum dependency versions of the packages they depend upon in this project.

 - `langchain_openai` - `v0.0.7+1`
 - `langchain_google` - `v0.0.2+2`

---

#### `langchain` - `v0.0.7+1`

 - **FIX**(doc-transformers): Text splitters were not preserving docs IDs ([#122](https://github.com/davidmigloz/langchain_dart/issues/122)). ([a9d7f098](https://github.com/davidmigloz/langchain_dart/commit/a9d7f098e650329fe43f35e2f0e11a1f61778e4f))


## 2023-08-16

### Changes

---

Packages with changes:

 - [`langchain_google` - `v0.0.2+1`](#langchain_google---v0021)
 - [`vertex_ai` - `v0.0.2+1`](#vertex_ai---v0021)

---

#### `langchain_google` - `v0.0.2+1`

 - **DOCS**: Add VertexAI Matching Engine sample setup script ([#121](https://github.com/davidmigloz/langchain_dart/issues/121)). ([ed2e1549](https://github.com/davidmigloz/langchain_dart/commit/ed2e1549ca1d6bb0223231bcbe0c1c4a6a198402))

#### `vertex_ai` - `v0.0.2+1`

 - **FIX**(vertex_ai): approximateNeighborsCount deserialization issue ([#120](https://github.com/davidmigloz/langchain_dart/issues/120)). ([f3381208](https://github.com/davidmigloz/langchain_dart/commit/f33812082191d3105d692f1d6bf461069df14750))
 - **DOCS**: Update readme. ([81f67c5e](https://github.com/davidmigloz/langchain_dart/commit/81f67c5e2f5963df9756d3245dd263b2060af173))


## 2023-08-16

### Changes

---

Packages with changes:

 - [`langchain` - `v0.0.7`](#langchain---v007)
 - [`langchain_google` - `v0.0.2`](#langchain_google---v002)
 - [`langchain_openai` - `v0.0.7`](#langchain_openai---v007)
 - [`vertex_ai` - `v0.0.2`](#vertex_ai---v002)

---

#### `langchain` - `v0.0.7`

 - **FEAT**(stores): Integrate Vertex AI Matching Engine vector store ([#103](https://github.com/davidmigloz/langchain_dart/issues/103)). ([289c3eef](https://github.com/davidmigloz/langchain_dart/commit/289c3eef722206ac9dea0c968c036ad3289d10be))

#### `langchain_google` - `v0.0.2`

 - **FEAT**(stores): Integrate Vertex AI Matching Engine vector store ([#103](https://github.com/davidmigloz/langchain_dart/issues/103)). ([289c3eef](https://github.com/davidmigloz/langchain_dart/commit/289c3eef722206ac9dea0c968c036ad3289d10be))

#### `langchain_openai` - `v0.0.7`

 - Updated `langchain` dependency

#### `vertex_ai` - `v0.0.2`

 - **FEAT**(vertex_ai): Add GCP Vertex AI Matching Engine client ([#116](https://github.com/davidmigloz/langchain_dart/issues/116)). ([2c1bbfcc](https://github.com/davidmigloz/langchain_dart/commit/2c1bbfcca22a4ddfb40bcb28e8ec8cbca865a9a5))


## 2023-08-13

### Changes

---

Packages with changes:

 - [`langchain` - `v0.0.6`](#langchain---v006)
 - [`langchain_openai` - `v0.0.6`](#langchain_openai---v006)

New packages:

 - [`langchain_google` - `v0.0.1`](#langchain_google---v001)
 - [`vertex_ai` - `v0.0.1`](#vertex_ai---v001)

---

#### `langchain` - `v0.0.6`

 - **REFACTOR**: Always await or explicitly discard Futures ([#106](https://github.com/davidmigloz/langchain_dart/issues/106)). ([989e93db](https://github.com/davidmigloz/langchain_dart/commit/989e93dbf6b5d61f053550219d88842156aeb492))
 - **FIX**(chains): Fix OpenAIQAWithSourcesChain returning empty strings ([#113](https://github.com/davidmigloz/langchain_dart/issues/113)). ([6181ff8d](https://github.com/davidmigloz/langchain_dart/commit/6181ff8df77653d38cd84cb066776c04c0ff74ad))
 - **FIX**(stores): VectorStore k variable was ignored ([#110](https://github.com/davidmigloz/langchain_dart/issues/110)). ([80e61eb7](https://github.com/davidmigloz/langchain_dart/commit/80e61eb7a11757f4e541ce5ba6033fb11b1b01f0))

#### `langchain_openai` - `v0.0.6`

 - **REFACTOR**: Always await or explicitly discard Futures ([#106](https://github.com/davidmigloz/langchain_dart/issues/106)). ([989e93db](https://github.com/davidmigloz/langchain_dart/commit/989e93dbf6b5d61f053550219d88842156aeb492))
 - **FIX**(chains): Fix OpenAIQAWithSourcesChain returning empty strings ([#113](https://github.com/davidmigloz/langchain_dart/issues/113)). ([6181ff8d](https://github.com/davidmigloz/langchain_dart/commit/6181ff8df77653d38cd84cb066776c04c0ff74ad))

#### `langchain_google` - `v0.0.1`

 - **FEAT**(llms): Integrate Google Vertex AI PaLM Text model ([#98](https://github.com/davidmigloz/langchain_dart/issues/98)). ([b2746c23](https://github.com/davidmigloz/langchain_dart/commit/b2746c235d68045ba20afd1f2be7c24dcccb5f24))
 - **FEAT**(chat-models): Integrate Google Vertex AI PaLM Chat Model ([#99](https://github.com/davidmigloz/langchain_dart/issues/99)). ([3897595d](https://github.com/davidmigloz/langchain_dart/commit/3897595db597d5957ef80ae7a1de35c5f41265b8))
 - **FEAT**(embeddings): Integrate Google Vertex AI PaLM Embeddings ([#100](https://github.com/davidmigloz/langchain_dart/issues/100)). ([d777eccc](https://github.com/davidmigloz/langchain_dart/commit/d777eccc0c81c58b322f28e6e3c4a8763f3f84b7))

#### `vertex_ai` - `v0.0.1`

 - **REFACTOR**(vertex-ai): Move Vertex AI client to its own package ([#111](https://github.com/davidmigloz/langchain_dart/issues/111)). ([d8aea156](https://github.com/davidmigloz/langchain_dart/commit/d8aea15633f1a9fb0df35cf9cc44bbc93ad46cd8))

## 2023-08-09

### Changes

---

Packages with changes:

 - [`langchain` - `v0.0.5+1`](#langchain---v0051)
 - [`langchain_openai` - `v0.0.5+1`](#langchain_openai---v0051)

---

#### `langchain` - `v0.0.5+1`

 - **FIX**(llms): OpenAIOptions class not exported ([#104](https://github.com/davidmigloz/langchain_dart/issues/104)). ([e50efc3d](https://github.com/davidmigloz/langchain_dart/commit/e50efc3ddf0b13ece43298b2e3fee531e944601d))
 - **DOCS**(chains): Improve RetrievalQAChain API documentation ([#95](https://github.com/davidmigloz/langchain_dart/issues/95)). ([e6d0a9d3](https://github.com/davidmigloz/langchain_dart/commit/e6d0a9d3abd65704883452e50b40344428f9580d))

#### `langchain_openai` - `v0.0.5+1`

 - **FIX**(chat-models): ChatOpenAIOptions class not exported ([#105](https://github.com/davidmigloz/langchain_dart/issues/105)). ([dfd77076](https://github.com/davidmigloz/langchain_dart/commit/dfd77076dfb60cd71aed3654f78c562ce0bc88bf))
 - **FIX**(llms): OpenAIOptions class not exported ([#104](https://github.com/davidmigloz/langchain_dart/issues/104)). ([e50efc3d](https://github.com/davidmigloz/langchain_dart/commit/e50efc3ddf0b13ece43298b2e3fee531e944601d))


## 2023-08-06

### Changes

---

Packages with changes:

 - [`langchain` - `v0.0.5`](#langchain---v005)
 - [`langchain_openai` - `v0.0.5`](#langchain_openai---v005)

---

#### `langchain` - `v0.0.5`

 - **FIX**(chains): Suff and MapReduce docs chains don't handle chat messages ([#92](https://github.com/davidmigloz/langchain_dart/issues/92)). ([19182ca1](https://github.com/davidmigloz/langchain_dart/commit/19182ca1921e53fc2cb0fa61d96d602aacf830f3))
 - **FEAT**(agents): Update AgentExecutor constructor to use agent's tools ([#89](https://github.com/davidmigloz/langchain_dart/issues/89)). ([3af56a45](https://github.com/davidmigloz/langchain_dart/commit/3af56a45930fff84b11f6bec29c50502a490c2b4))
 - **FEAT**(prompts): Add MessagePlaceholder ([#87](https://github.com/davidmigloz/langchain_dart/issues/87)). ([23ee95b6](https://github.com/davidmigloz/langchain_dart/commit/23ee95b6cb0bb15701a141adc41ee1b826684ad0))
 - **DOCS**: Update CONTRIBUTING.md. ([5f2b9264](https://github.com/davidmigloz/langchain_dart/commit/5f2b92641ae1f20fcc8803c977428b81e3f525bd))
 - **DOCS**(prompts): Fix typo in MessagePlaceholder API docs ([#90](https://github.com/davidmigloz/langchain_dart/issues/90)). ([f53e1a2b](https://github.com/davidmigloz/langchain_dart/commit/f53e1a2b9dc81c89a66a368758cfd1ec7df4c0f9))

#### `langchain_openai` - `v0.0.5`

 - **FIX**(agents): FunctionChatMessage not saved properly in memory ([#88](https://github.com/davidmigloz/langchain_dart/issues/88)). ([d7b763de](https://github.com/davidmigloz/langchain_dart/commit/d7b763ded1abd59a964afd781558b3559a65d9ec))
 - **FEAT**(agents): Update AgentExecutor constructor to use agent's tools ([#89](https://github.com/davidmigloz/langchain_dart/issues/89)). ([3af56a45](https://github.com/davidmigloz/langchain_dart/commit/3af56a45930fff84b11f6bec29c50502a490c2b4))
 - **DOCS**(agents): Add example of using memory in OpenAIFunctionsAgent ([#91](https://github.com/davidmigloz/langchain_dart/issues/91)). ([898d5350](https://github.com/davidmigloz/langchain_dart/commit/898d53502713ec2fd1ecc93e76e7f941123b81a5))


## 2023-08-05

### Changes

---

Packages with changes:

 - [`langchain` - `v0.0.4`](#langchain---v004)
 - [`langchain_openai` - `v0.0.4`](#langchain_openai---v004)

---

#### `langchain` - `v0.0.4`

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

#### `langchain_openai` - `v0.0.4`

 - **FIX**(agents): systemChatMessage was ignored in OpenAIFunctionsAgent ([#86](https://github.com/davidmigloz/langchain_dart/issues/86)). ([cfe1e009](https://github.com/davidmigloz/langchain_dart/commit/cfe1e00972d481f83b9dc9e225a32b7077aa5fd4))
 - **FEAT**(agents): Support LLMChain in OpenAIFunctionsAgent and memory. ([bd4a1cb9](https://github.com/davidmigloz/langchain_dart/commit/bd4a1cb9101ba385ce9613f9aa0b7e5474380f32))
 - **FEAT**(chains): Return ChatMessage when LLMChain used with ChatModel. ([bb5f4d23](https://github.com/davidmigloz/langchain_dart/commit/bb5f4d2325ae1f615159f2ffd11cc8ec4e87ed3c))


## 2023-07-28

### Changes

---

Packages with changes:

 - [`langchain` - `v0.0.3`](#langchain---v003)
 - [`langchain_openai` - `v0.0.3`](#langchain_openai---v003)

---

#### `langchain` - `v0.0.3`

 - **FIX**: Loaders tests. ([f0498300](https://github.com/davidmigloz/langchain_dart/commit/f049830057fc1b8ff315469afd1512aa13ceb459))
 - **FEAT**: Update internal dependencies (including http to 1.1.0). ([8f3e8bc8](https://github.com/davidmigloz/langchain_dart/commit/8f3e8bc811df5c8bdba2c7e33b6c53ea0c2edad4))
 - **FEAT**: Add support for VectorStoreRetrieverMemory ([#54](https://github.com/davidmigloz/langchain_dart/issues/54)). ([72cd1b10](https://github.com/davidmigloz/langchain_dart/commit/72cd1b100ad88e7213ec12d432674ec4666ce172))

#### `langchain_openai` - `v0.0.3`

 - **FEAT**: Update internal dependencies (including http to 1.1.0). ([8f3e8bc8](https://github.com/davidmigloz/langchain_dart/commit/8f3e8bc811df5c8bdba2c7e33b6c53ea0c2edad4))


## 2023-07-23

### Changes

---

Packages with changes:

 - [`langchain` - `v0.0.2`](#langchain---v002)
 - [`langchain_openai` - `v0.0.2`](#langchain_openai---v002)

---

#### `langchain` - `v0.0.2`

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

#### `langchain_openai` - `v0.0.2`

 - **FIX**: OpenAIQAWithSourcesChain throws exception. ([45c6cb9d](https://github.com/davidmigloz/langchain_dart/commit/45c6cb9d32be670902dd2fe4cb92597765590d85))
 - **FEAT**: Support estimating the number of tokens for a given prompt ([#3](https://github.com/davidmigloz/langchain_dart/issues/3)). ([e22f22c8](https://github.com/davidmigloz/langchain_dart/commit/e22f22c89f188a019b96a7c0003dbd26471bebb7))


## 2023-07-02

### Changes

#### `langchain` - `v0.0.1`

 - Initial public release. 

Check out the announcement post for all the details: 
https://blog.langchaindart.com/introducing-langchain-dart-6b1d34fc41ef
- `v0.0.1`

 - Initial public release. 

Check out the announcement post for all the details: 
https://blog.langchaindart.com/introducing-langchain-dart-6b1d34fc41ef
- `v0.0.1`

 - Initial public release. 

Check out the announcement post for all the details: 
https://blog.langchaindart.com/introducing-langchain-dart-6b1d34fc41ef
- `v0.0.1`

 - Initial public release. 

Check out the announcement post for all the details: 
https://blog.langchaindart.com/introducing-langchain-dart-6b1d34fc41ef
