## 0.2.2+2

 - **FIX**: Batch sequential tool responses in GoogleAI & Firebase VertexAI ([#757](https://github.com/davidmigloz/langchain_dart/issues/757)). ([8ff44486](https://github.com/davidmigloz/langchain_dart/commit/8ff4448665d26b49c1e1077d0822703e7d853d39))

## 0.2.2+1

 - **BUILD**: Update dependencies ([#751](https://github.com/davidmigloz/langchain_dart/issues/751)). ([250a3c6](https://github.com/davidmigloz/langchain_dart/commit/250a3c6a6c1815703a61a142ba839c0392a31015))

## 0.2.2

 - **FEAT**: Update dependencies (requires Dart 3.6.0) ([#709](https://github.com/davidmigloz/langchain_dart/issues/709)). ([9e3467f7](https://github.com/davidmigloz/langchain_dart/commit/9e3467f7caabe051a43c0eb3c1110bc4a9b77b81))
 - **REFACTOR**: Fix linter issues ([#708](https://github.com/davidmigloz/langchain_dart/issues/708)). ([652e7c64](https://github.com/davidmigloz/langchain_dart/commit/652e7c64776d92d309cbd708d9e477fc2ee1391c))
 - **REFACTOR**: Migrate firebase_vertexai dep to 1.4.0 ([#663](https://github.com/davidmigloz/langchain_dart/issues/663)). ([4fca38c5](https://github.com/davidmigloz/langchain_dart/commit/4fca38c5599c4c5a058ece1a7d9c4e276b716432))
 - **FIX**: Fix linter issues ([#656](https://github.com/davidmigloz/langchain_dart/issues/656)). ([88a79c65](https://github.com/davidmigloz/langchain_dart/commit/88a79c65aad23bcf5859e58a7375a4b686cf02ef))

## 0.2.1+4

 - **REFACTOR**: Add new lint rules and fix issues ([#621](https://github.com/davidmigloz/langchain_dart/issues/621)). ([60b10e00](https://github.com/davidmigloz/langchain_dart/commit/60b10e008acf55ebab90789ad08d2449a44b69d8))

## 0.2.1+3

 - **FIX**: UUID 'Namespace' can't be assigned to the parameter type 'String?' ([#566](https://github.com/davidmigloz/langchain_dart/issues/566)). ([1e93a595](https://github.com/davidmigloz/langchain_dart/commit/1e93a595f2f166da2cae3f7cfcdbb28892abf9b5))

## 0.2.1+2

 - **DOCS**: Update Google's models in documentation ([#551](https://github.com/davidmigloz/langchain_dart/issues/551)). ([1da543f7](https://github.com/davidmigloz/langchain_dart/commit/1da543f7ab90eb39b599a6fdd0cc52e2cbc1460d))

## 0.2.1+1

 - Update a dependency to the latest release.

## 0.2.1

 - **FEAT**: Implement additive options merging for cascade bind calls ([#500](https://github.com/davidmigloz/langchain_dart/issues/500)). ([8691eb21](https://github.com/davidmigloz/langchain_dart/commit/8691eb21d5d2ffbf853997cbc0eaa29a56c6ca43))
 - **REFACTOR**: Remove default model from the language model options ([#498](https://github.com/davidmigloz/langchain_dart/issues/498)). ([44363e43](https://github.com/davidmigloz/langchain_dart/commit/44363e435778282ed27bc1b2771cf8b25abc7560))
 - **REFACTOR**: Depend on exact versions for internal 1st party dependencies ([#484](https://github.com/davidmigloz/langchain_dart/issues/484)). ([244e5e8f](https://github.com/davidmigloz/langchain_dart/commit/244e5e8f30e0d9a642fe01a804cc0de5e807e13d))

## 0.2.0

> Note: `ChatFirebaseVertexAI` now uses `gemini-1.5-flash` model by default. 

 - **BREAKING** **FEAT**: Update ChatFirebaseVertexAI default model to gemini-1.5-flash ([#458](https://github.com/davidmigloz/langchain_dart/issues/458)). ([d3c96c52](https://github.com/davidmigloz/langchain_dart/commit/d3c96c52e95e889ba6955e3de80a83978b27618b))
 - **FEAT**: Add support for ChatToolChoiceRequired ([#474](https://github.com/davidmigloz/langchain_dart/issues/474)). ([bf324f36](https://github.com/davidmigloz/langchain_dart/commit/bf324f36f645c53458d5891f8285991cd50f2649))
 - **FEAT**: Support response MIME type in ChatFirebaseVertexAI ([#461](https://github.com/davidmigloz/langchain_dart/issues/461)) ([#463](https://github.com/davidmigloz/langchain_dart/issues/463)). ([c3452721](https://github.com/davidmigloz/langchain_dart/commit/c3452721c78ba3071ed2510a243f9c824a291c34))
 - **FEAT**: Add support for Firebase Auth in ChatFirebaseVertexAI ([#460](https://github.com/davidmigloz/langchain_dart/issues/460)). ([6d137290](https://github.com/davidmigloz/langchain_dart/commit/6d137290ca0f56c9fcc725e6211e838a3e3c6d16))
 - **FEAT**: Add support for usage metadata in ChatFirebaseVertexAI ([#457](https://github.com/davidmigloz/langchain_dart/issues/457)). ([2587f9e2](https://github.com/davidmigloz/langchain_dart/commit/2587f9e2bcbcc2bf5e2295dce409e92a89bf3c44))
 - **REFACTOR**: Simplify how tools are passed to the internal Firebase client ([#459](https://github.com/davidmigloz/langchain_dart/issues/459)). ([7f772396](https://github.com/davidmigloz/langchain_dart/commit/7f77239601fb216a01ec9d25680ec4d3dc4b97c7))

## 0.1.0+3

 - Update a dependency to the latest release.

## 0.1.0+2

 - Update a dependency to the latest release.

## 0.1.0+1

 - **DOCS**: Fix lint issues in langchain_firebase example. ([f85a6ad7](https://github.com/davidmigloz/langchain_dart/commit/f85a6ad755e00c513bd4349663e33d40be8a696c))

## 0.1.0

 - **FEAT**: Add support for ChatFirebaseVertexAI ([#422](https://github.com/davidmigloz/langchain_dart/issues/422)). ([8d0786bc](https://github.com/davidmigloz/langchain_dart/commit/8d0786bc6228ce86de962d30e9c2cc9728a08f3f))
 - **DOCS**: Add Gemini 1.5 Flash to models list ([#423](https://github.com/davidmigloz/langchain_dart/issues/423)). ([40f4c9de](https://github.com/davidmigloz/langchain_dart/commit/40f4c9de9c25804e298fd481c80f8c52d53302fb))

## 0.0.1-dev.1

- Bootstrap `langchain_firebase` package.
