## 0.2.3+3

 - **DOCS**: Update CHANGELOG.md. ([d0d46534](https://github.com/davidmigloz/langchain_dart/commit/d0d46534565d6f52d819d62329e8917e00bc7030))

## 0.2.3+2

 - Update a dependency to the latest release.

## 0.2.3+1

 - **REFACTOR**: Remove tiktoken in favour of countTokens API on VertexAI ([#307](https://github.com/davidmigloz/langchain_dart/issues/307)). ([8158572b](https://github.com/davidmigloz/langchain_dart/commit/8158572b15c0525b9caa9bc71fbbbee6ab4458fe))

## 0.2.3

 - **REFACTOR**: Use cl100k_base encoding model when no tokenizer is available ([#295](https://github.com/davidmigloz/langchain_dart/issues/295)). ([ca908e80](https://github.com/davidmigloz/langchain_dart/commit/ca908e8011a168a74240310c78abb3c590654a49))
 - **REFACTOR**: Make all LLM options fields nullable and add copyWith ([#284](https://github.com/davidmigloz/langchain_dart/issues/284)). ([57eceb9b](https://github.com/davidmigloz/langchain_dart/commit/57eceb9b47da42cf19f64ddd88bfbd2c9676fd5e))
 - **REFACTOR**: Migrate tokenizer to langchain_tiktoken package ([#285](https://github.com/davidmigloz/langchain_dart/issues/285)). ([6a3b6466](https://github.com/davidmigloz/langchain_dart/commit/6a3b6466e3e4cfddda2f506adbf2eb563814d02f))
 - **FEAT**: Update internal dependencies ([#291](https://github.com/davidmigloz/langchain_dart/issues/291)). ([69621cc6](https://github.com/davidmigloz/langchain_dart/commit/69621cc61659980d046518ee20ce055e806cba1f))

## 0.2.2+1

 - Update a dependency to the latest release.

## 0.2.2

 - Update a dependency to the latest release.

## 0.2.1+2

 - Update a dependency to the latest release.

## 0.2.1+1

 - **DOCS**: Update langchain_google README. ([5b2acfa1](https://github.com/davidmigloz/langchain_dart/commit/5b2acfa1667e63774526cb10e9adf53ff8c79530))

## 0.2.1

 - **FEAT**: Add support for ChatGoogleGenerativeAI wrapper (Gemini API) ([#270](https://github.com/davidmigloz/langchain_dart/issues/270)). ([5d006c12](https://github.com/davidmigloz/langchain_dart/commit/5d006c121172192765b1a76582588c05b779e9c0))

## 0.2.0+1

 - Update a dependency to the latest release.

## 0.2.0

> Note: This release has breaking changes.
> 
> Migration guides:
> - [`VertexAI`](https://github.com/davidmigloz/langchain_dart/issues/241)
> - [`ChatVertexAI`](https://github.com/davidmigloz/langchain_dart/issues/242)

 - **BREAKING** **FEAT**: Move all model config options to VertexAIOptions ([#241](https://github.com/davidmigloz/langchain_dart/issues/241)). ([a714882a](https://github.com/davidmigloz/langchain_dart/commit/a714882a3026c7f381b6853d6b61506060b0775e))
 - **BREAKING** **FEAT**: Move all model config options to ChatVertexAIOptions ([#242](https://github.com/davidmigloz/langchain_dart/issues/242)). ([89bef8a2](https://github.com/davidmigloz/langchain_dart/commit/89bef8a22fb0b74ffd9d7a4028c64b2d94d38578))
 - **FEAT**: Allow to mutate default options ([#256](https://github.com/davidmigloz/langchain_dart/issues/256)). ([cb5e4058](https://github.com/davidmigloz/langchain_dart/commit/cb5e4058fb89f33c8495ac22fb240ce92daa683c))

## 0.1.0+4

 - Update a dependency to the latest release.

## 0.1.0+3

 - Update a dependency to the latest release.

## 0.1.0+2

 - Update a dependency to the latest release.

## 0.1.0+1

 - **DOCS**: Add public_member_api_docs lint rule and document missing APIs ([#223](https://github.com/davidmigloz/langchain_dart/issues/223)). ([52380433](https://github.com/davidmigloz/langchain_dart/commit/523804331783970870b023946c016be6c0797920))

## 0.1.0

> Note: This release has breaking changes.  
> [Migration guide](https://github.com/davidmigloz/langchain_dart/issues/220)

 - **BREAKING** **FEAT**: Add multi-modal messages support with OpenAI Vision ([#220](https://github.com/davidmigloz/langchain_dart/issues/220)). ([6da2e069](https://github.com/davidmigloz/langchain_dart/commit/6da2e069932782eed8c27da45c56b4c290373fac))

## 0.0.10+1

 - **DOCS**: Update vector stores documentation. ([dad60d24](https://github.com/davidmigloz/langchain_dart/commit/dad60d247fac157f2980f73c14ac88e9a0894fba))

## 0.0.10

 - **FEAT**: Add result id in ChatVertexAI generations ([#195](https://github.com/davidmigloz/langchain_dart/issues/195)). ([a5bea6d3](https://github.com/davidmigloz/langchain_dart/commit/a5bea6d3aefbb53ed55d3abda0f51f5878445b72))

## 0.0.9

> Note: This release has breaking changes.

 - **DOCS**: Update changelog. ([d45d624a](https://github.com/davidmigloz/langchain_dart/commit/d45d624a0ba12e53c4e78a29750cad30d66c61c5))
 - **BREAKING** **FEAT**: Update uuid internal dependency to 4.x.x ([#173](https://github.com/davidmigloz/langchain_dart/issues/173)). ([b01f4afe](https://github.com/davidmigloz/langchain_dart/commit/b01f4afea6cfcdf8a0aa6e1b11d3057efa6e5fc0))

## 0.0.8

 - Updated `langchain` dependency

## 0.0.7+1

 - **REFACTOR**: Require `http.Client` instead of `AuthClient` ([#156](https://github.com/davidmigloz/langchain_dart/issues/156)). ([0f7fee7f](https://github.com/davidmigloz/langchain_dart/commit/0f7fee7f0780e5b650ec50307a7fda65e242e822))

## 0.0.7

> Note: This release has breaking changes.

 - **FEAT**: Support document title in VertexAIEmbeddings ([#154](https://github.com/davidmigloz/langchain_dart/issues/154)). ([6b763731](https://github.com/davidmigloz/langchain_dart/commit/6b76373139bb50e8d0e59b3f63b54f6adae3d498))
 - **FEAT**: Support task type in VertexAIEmbeddings ([#151](https://github.com/davidmigloz/langchain_dart/issues/151)). ([8a2199e2](https://github.com/davidmigloz/langchain_dart/commit/8a2199e26a945f7d2ad8d3da3ca14e083172f6f1))
 - **DOCS**: Fix invalid package topics. ([f81b833a](https://github.com/davidmigloz/langchain_dart/commit/f81b833aae33e0a945ef4450da12344886224bae))
 - **DOCS**: Add topics to pubspecs. ([8c1d6297](https://github.com/davidmigloz/langchain_dart/commit/8c1d62970710cc326fd5930101918aaf16b18f74))
 - **BREAKING** **REFACTOR**: Change embedDocuments input to `List<Document>` ([#153](https://github.com/davidmigloz/langchain_dart/issues/153)). ([1b5d6fbf](https://github.com/davidmigloz/langchain_dart/commit/1b5d6fbf20bcbb7734581f91d66eff3a86731fec))
 - **BREAKING** **FEAT**: Add default and call options in VertexAI and ChatVertexAI ([#155](https://github.com/davidmigloz/langchain_dart/issues/155)). ([fe1b12ea](https://github.com/davidmigloz/langchain_dart/commit/fe1b12ea282cd587f9dc78bd959741781ebb6d35))

## 0.0.6

 - **DOCS**: Update packages example. ([4f8488fc](https://github.com/davidmigloz/langchain_dart/commit/4f8488fcb324e31b9d8dece7d1999333d7982253))

## 0.0.5

 - **FEAT**: Add support for Chroma VectorStore ([#139](https://github.com/davidmigloz/langchain_dart/issues/139)). ([098783b4](https://github.com/davidmigloz/langchain_dart/commit/098783b4895ab30bb61d07355a0b587ff76b9175))
 - **DOCS**: Fix typos. ([282cfa24](https://github.com/davidmigloz/langchain_dart/commit/282cfa24caa7b91ce28db6b1997af4c2c3ecf3e4))
 - **DOCS**: Update readme. ([b61eda5b](https://github.com/davidmigloz/langchain_dart/commit/b61eda5ba506b4602592511c6a9be1e7aae5bf57))

## 0.0.4

 - **FEAT**: Support filtering in VertexAI Matching Engine ([#136](https://github.com/davidmigloz/langchain_dart/issues/136)). ([768c6987](https://github.com/davidmigloz/langchain_dart/commit/768c6987de5b36b60090a1fe94f49483da11b885))
 - **FEAT**: Allow to pass vector search config ([#135](https://github.com/davidmigloz/langchain_dart/issues/135)). ([5b8fa5a3](https://github.com/davidmigloz/langchain_dart/commit/5b8fa5a3fcaf785615016be1d5da0a003178cfa9))
 - **DOCS**: Fix API documentation errors ([#138](https://github.com/davidmigloz/langchain_dart/issues/138)). ([1aa38fce](https://github.com/davidmigloz/langchain_dart/commit/1aa38fce17eed7f325e7872d03096740256d57be))

## 0.0.3

 - **FEAT**: Infer queryRootUrl in VertexAIMatchingEngine ([#133](https://github.com/davidmigloz/langchain_dart/issues/133)). ([c5353368](https://github.com/davidmigloz/langchain_dart/commit/c5353368d1455756554f6640d33d0b3752476eb9))

## 0.0.2+2

 - Update a dependency to the latest release.

## 0.0.2+1

 - **DOCS**: Add VertexAI Matching Engine sample setup script ([#121](https://github.com/davidmigloz/langchain_dart/issues/121)). ([ed2e1549](https://github.com/davidmigloz/langchain_dart/commit/ed2e1549ca1d6bb0223231bcbe0c1c4a6a198402))

## 0.0.2

 - **FEAT**: Integrate Vertex AI Matching Engine vector store ([#103](https://github.com/davidmigloz/langchain_dart/issues/103)). ([289c3eef](https://github.com/davidmigloz/langchain_dart/commit/289c3eef722206ac9dea0c968c036ad3289d10be))
 - **DOCS**: Update readme. ([a64860ce](https://github.com/davidmigloz/langchain_dart/commit/a64860ceda8fe926b720086cf7c86df2b02abf35))

## 0.0.1

 - **REFACTOR**: Move Vertex AI client to its own package ([#111](https://github.com/davidmigloz/langchain_dart/issues/111)). ([d8aea156](https://github.com/davidmigloz/langchain_dart/commit/d8aea15633f1a9fb0df35cf9cc44bbc93ad46cd8))
 - **FEAT**: Integrate Google Vertex AI PaLM Embeddings ([#100](https://github.com/davidmigloz/langchain_dart/issues/100)). ([d777eccc](https://github.com/davidmigloz/langchain_dart/commit/d777eccc0c81c58b322f28e6e3c4a8763f3f84b7))
 - **FEAT**: Integrate Google Vertex AI PaLM Chat Model ([#99](https://github.com/davidmigloz/langchain_dart/issues/99)). ([3897595d](https://github.com/davidmigloz/langchain_dart/commit/3897595db597d5957ef80ae7a1de35c5f41265b8))
 - **FEAT**: Integrate Google Vertex AI PaLM Text model ([#98](https://github.com/davidmigloz/langchain_dart/issues/98)). ([b2746c23](https://github.com/davidmigloz/langchain_dart/commit/b2746c235d68045ba20afd1f2be7c24dcccb5f24))
 - **FEAT**: Add GCP Vertex AI Model Garden API client ([#109](https://github.com/davidmigloz/langchain_dart/issues/109)). ([5b9bb063](https://github.com/davidmigloz/langchain_dart/commit/5b9bb063a03fb290305fbc0bec502a3c93077583))

## 0.0.1-dev.1

- Bootstrap project.
