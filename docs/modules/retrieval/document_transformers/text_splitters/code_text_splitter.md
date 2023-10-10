# Split code

`CodeTextSplitter` allows you to split source code. It supports multiple languages 
(see [CodeLanguage] enum). 

It tries to split along class definitions, function definitions, and control flow statements.

Here's an example of how to use it:

```dart
const code = '''
void main() {
  print("Hello, World!");
}
''';
final splitter = CodeTextSplitter(
  language: CodeLanguage.dart,
  chunkSize: 16,
  chunkOverlap: 0,
);
final chunks = splitter.splitText(code);
print(chunks);
// [
// 'void main() {',
// 'print("Hello,',
// 'World!");',
// '}',
// ]
```
