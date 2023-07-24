# Document loaders

Use document loaders to load data from a source as `Document`'s. A `Document` is
a piece of text and associated metadata. For example, there are document loaders
for loading a simple .txt file, for loading the text contents of any web page,
or even for loading a transcript of a YouTube video.

Document loaders expose two methods:

- `lazyLoad()`: returns a `Stream` of `Document`'s. This is useful for loading
  large amounts of data, as it allows you to process each `Document` as it is
  loaded, rather than waiting for the entire data set to be loaded in memory.
- `load()`: returns a list of `Document`'s. Under the hood, this method calls
  `lazyLoad()` and collects the results into a list. Use this method only with
  small data sets.

## Get started

The simplest loader reads in a file as text and places it all into one
`Document`.

```dart

const filePath = 'example.txt';
const loader = TextLoader(filePath);
final docs = await loader.load();
```
