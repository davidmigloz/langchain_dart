# Data connection

Many LLM applications require user-specific data that is not part of the model's
training set. LangChain gives you the building blocks to load, transform, store
and query your data via:

- [Document loaders](/modules/data_connection/document_loaders/document_loaders.md):
  load documents from many different sources.
- [Document transformers](/modules/data_connection/document_transformers/document_transformers.md):
  split documents, drop redundant documents, and more.
- [Text embedding models](/modules/data_connection/text_embedding/text_embedding.md):
  take unstructured text and turn it into a list of floating point numbers.
- [Vector stores](/modules/data_connection/vector_stores/vector_stores.md):
  Store and search over embedded data.
- [Retrievers](/modules/data_connection/retrievers/retrievers.md): Query your
  data.

![data connection diagram](img/data_connection.jpg)
*Image
source: [LangChain docs](https://python.langchain.com/docs/modules/data_connection/)*

