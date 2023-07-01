# Document loaders

Use document loaders to load data from a source as `Document`'s. A `Document` is
a piece of text and associated metadata. For example, there are document loaders
for loading a simple .txt file, for loading the text contents of any web page,
or even for loading a transcript of a YouTube video.

Document loaders expose a "load" method for loading data as documents from a
configured source.

## Get started

The simplest loader reads in a file as text and places it all into one 
`Document`.

```dart
const filePath = 'example.txt';
const loader = TextLoader(filePath);
final docs = await loader.lazyLoad().toList();
```
