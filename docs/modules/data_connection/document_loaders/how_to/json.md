# JSON

Use `JsonLoader` to load data from a JSON file.

This loader reads a JSON file located at `filePath` and extracts
`Document`s based on the provided JSON path schema `jpSchema`.
Each `Document` represents a matching JSON object or value found in the
file.

```dart
final loader = JsonLoader(
  'path/to/file.json',
  jpSchema: '$..yourJsonPath',
);
final documents = await loader.load();
```

Documentation related to JSON path schemas:
- https://pub.dev/packages/json_path
- https://goessner.net/articles/JsonPath

## Metadata builder

If you want to customize the metadata for each `Document`, you can provide
a `metadataBuilder` function that takes in the JSON object extracted by the
`jpSchema` and the default file metadata and returns a map of the updated
metadata.
