# Split Markdown

LangChain.dart provides two different types of text splitters specifically designed for Markdown documents:

1. **MarkdownTextSplitter**: A basic splitter that splits markdown text along common markdown structures.
2. **MarkdownHeaderTextSplitter**: An advanced splitter that can maintain header hierarchy metadata when splitting documents.

This guide explains how to use both splitters effectively.

## MarkdownTextSplitter

The `MarkdownTextSplitter` splits Markdown documents along common Markdown-formatted structures like headings, code blocks, and horizontal lines.

```dart
import 'package:langchain/langchain.dart';

void main() {
  final text = '''
# Header 1
This is text under header 1.

## Header 2
This is text under header 2.

### Header 3
This is text under header 3.
''';

  final splitter = MarkdownTextSplitter(
    chunkSize: 100,
    chunkOverlap: 0,
  );
  
  final docs = splitter.createDocuments([text]);
  
  for (final doc in docs) {
    print('--- Document ---');
    print(doc.pageContent);
    print('--------------');
  }
}
```

The `MarkdownTextSplitter` is an extension of the `RecursiveCharacterTextSplitter` that uses markdown-specific separators to break text in a sensible way.

## MarkdownHeaderTextSplitter

The `MarkdownHeaderTextSplitter` is an advanced splitter that can split markdown documents based on headers while preserving the header hierarchy in the document metadata.

This is particularly useful for:
- Creating a hierarchical document structure based on headings
- Maintaining the context of where each chunk came from
- Enabling more sophisticated retrieval with metadata filtering

### Basic Usage

```dart
import 'package:langchain/langchain.dart';

void main() {
  const markdownDocument = '''
# My Document

## Introduction
This is an introduction to the document.

## Main Section
This is the main section with important content.

### Subsection A
This is subsection A with more specific details.

## Conclusion
This concludes the document.
''';

  // Define headers to track and their corresponding metadata keys
  final headersToSplitOn = [
    ('#', 'Header 1'),
    ('##', 'Header 2'),
    ('###', 'Header 3'),
  ];

  // Create the splitter
  final splitter = MarkdownHeaderTextSplitter(
    headersToSplitOn: headersToSplitOn,
  );

  // Split the document
  final docs = splitter.splitText(markdownDocument);

  // Print the results
  for (final doc in docs) {
    print('--- Document ---');
    print('Content: ${doc.pageContent}');
    print('Metadata: ${doc.metadata}');
    print('--------------');
  }
}
```

### Output

The output of the above code would be:

```
--- Document ---
Content: This is an introduction to the document.
Metadata: {Header 1: My Document, Header 2: Introduction}
--------------
--- Document ---
Content: This is the main section with important content.
Metadata: {Header 1: My Document, Header 2: Main Section}
--------------
--- Document ---
Content: This is subsection A with more specific details.
Metadata: {Header 1: My Document, Header 2: Main Section, Header 3: Subsection A}
--------------
--- Document ---
Content: This concludes the document.
Metadata: {Header 1: My Document, Header 2: Conclusion}
--------------
```

### Configuration Options

The `MarkdownHeaderTextSplitter` includes several configuration options:

1. **`headersToSplitOn`**: List of tuples with header indicators and metadata keys.
   ```dart
   headersToSplitOn: [
     ('#', 'Header 1'),
     ('##', 'Header 2'),
     ('###', 'Header 3'),
   ]
   ```

2. **`returnEachLine`**: If `true`, returns each line as an individual document. Default is `false`.
   ```dart
   returnEachLine: false,
   ```

3. **`stripHeaders`**: If `true`, removes the headers from the content. Default is `true`.
   ```dart
   stripHeaders: true,
   ```

### Preserving Headers

You can choose to keep the headers in the document content by setting `stripHeaders: false`:

```dart
final splitter = MarkdownHeaderTextSplitter(
  headersToSplitOn: headersToSplitOn,
  stripHeaders: false,
);
```

With this configuration, the headers will be preserved in the document content:

```
--- Document ---
Content: # My Document
## Introduction
This is an introduction to the document.
Metadata: {Header 1: My Document, Header 2: Introduction}
--------------
```

### Handling Code Blocks

The splitter intelligently handles fenced code blocks (```` ``` ```` or `~~~`) to ensure that Markdown syntax within code blocks doesn't interfere with the splitting logic.

### Handling Invisible Characters

The splitter automatically cleans up invisible/non-printable characters from the text, ensuring more reliable header detection.

## Use Cases

1. **Hierarchical Document Navigation**: Maintain the structure of complex documents
2. **Enhanced Context Retrieval**: Include header context in document chunks
3. **Metadata-Based Filtering**: Filter retrieval results based on specific headers
4. **Document Section Targeting**: Target specific sections of a document

## Comparison with Other Splitters

- **RecursiveCharacterTextSplitter**: General-purpose splitter without understanding of document structure
- **MarkdownTextSplitter**: Basic markdown awareness but no metadata preservation
- **MarkdownHeaderTextSplitter**: Full header hierarchy awareness with metadata preservation

The `MarkdownHeaderTextSplitter` is particularly valuable when working with structured Markdown documents where maintaining the document's hierarchy improves downstream tasks like retrieval or question answering.
