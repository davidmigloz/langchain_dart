# Directory

Use `DirectoryLoader` to load `Document`s from multiple files in a directory with extensive customization options.

## Overview

The `DirectoryLoader` is a versatile document loader that allows you to load documents from a directory with powerful filtering, sampling, and customization capabilities. It supports multiple file types out of the box and provides extensive configuration options.

## Basic Usage

```dart
// Load all text files from a directory recursively
final loader = DirectoryLoader(
  '/path/to/documents',
  glob: '*.txt',
  recursive: true,
);
final documents = await loader.load();
```

## Constructor Parameters

### `filePath` (required)
- Type: `String`
- Description: The path to the directory containing documents to load.

### `glob`
- Type: `String`
- Default: `'*'` (all files)
- Description: A glob pattern to match files. Only files matching this pattern will be loaded.
- Examples:
  ```dart
  // Load only JSON and text files
  DirectoryLoader('/path', glob: '*.{txt,json}')
  
  // Load files starting with 'report'
  DirectoryLoader('/path', glob: 'report*')
  ```

### `recursive`
- Type: `bool`
- Default: `true`
- Description: Whether to search recursively in subdirectories.

### `exclude`
- Type: `List<String>`
- Default: `[]`
- Description: Glob patterns to exclude from loading.
- Example:
  ```dart
  DirectoryLoader(
    '/path',
    exclude: ['*.tmp', 'draft*'],
  )
  ```

### `loaderMap`
- Type: `Map<String, BaseDocumentLoader Function(String)>`
- Default: `DirectoryLoader.defaultLoaderMap`
- Description: A map to customize loaders for different file types.
- Default Supported Types:
  - `.txt`: TextLoader
  - `.json`: JsonLoader (with root schema)
  - `.csv` and `.tsv`: CsvLoader
- Example of extending loaders:
  ```dart
  final loader = DirectoryLoader(
    '/path/to/docs',
    loaderMap: {
      // Add a custom loader for XML files
      '.xml': (path) => CustomXmlLoader(path),
      
      // Combine with default loaders
      ...DirectoryLoader.defaultLoaderMap,
    },
  );
  ```

### `loadHidden`
- Type: `bool`
- Default: `false`
- Description: Whether to load hidden files.
- Platform Specific: 
  - On Unix-like systems (Linux, macOS): Identifies hidden files by names starting with '.'
  - On Windows: May not work as expected due to different hidden file conventions
  - Recommended to use platform-specific checks for comprehensive hidden file handling across different operating systems
- Example of platform-aware hidden file checking:
  ```dart
  import 'dart:io' show Platform;

  bool isHiddenFile(File file) {
    if (Platform.isWindows) {
      // Windows-specific hidden file check
      return (File(file.path).statSync().modeString().startsWith('h'));
    } else {
      // Unix-like systems
      return path.basename(file.path).startsWith('.');
    }
  }
  ```

### `sampleSize`
- Type: `int`
- Default: `0` (load all files)
- Description: Maximum number of files to load.
- Example:
  ```dart
  // Load only 10 files
  DirectoryLoader('/path', sampleSize: 10)
  ```

### `randomizeSample`
- Type: `bool`
- Default: `false`
- Description: Whether to randomize the sample of files.

### `sampleSeed`
- Type: `int?`
- Default: `null`
- Description: Seed for random sampling to ensure reproducibility.
- Example:
  ```dart
  // Consistent random sampling
  DirectoryLoader(
    '/path', 
    sampleSize: 10,
    randomizeSample: true,
    sampleSeed: 42,
  )
  ```

### `metadataBuilder`
- Type: `Map<String, dynamic> Function(File file, Map<String, dynamic> defaultMetadata)?`
- Default: `null`
- Description: A custom function to build metadata for each document.
- Example:
  ```dart
  final loader = DirectoryLoader(
    '/path',
    metadataBuilder: (file, defaultMetadata) {
      return {
        ...defaultMetadata,
        'custom_tag': 'important_document',
        'processing_date': DateTime.now().toIso8601String(),
      };
    },
  );
  ```

## Default Metadata

By default, each document receives metadata including:
- `source`: Full file path
- `name`: Filename
- `extension`: File extension
- `size`: File size in bytes
- `lastModified`: Last modification timestamp (milliseconds since epoch)

## Lazy Loading

The `DirectoryLoader` supports lazy loading through the `lazyLoad()` method, which returns a `Stream<Document>`. This is useful for processing large numbers of documents without loading everything into memory at once.

```dart
final loader = DirectoryLoader('/path/to/documents');
await for (final document in loader.lazyLoad()) {
  // Process each document as it's loaded
  print(document.pageContent);
}
```

## Error Handling

- Throws an `ArgumentError` if the blob pattern is empty

## Advanced Example

```dart
final loader = DirectoryLoader(
  '/path/to/documents',
  glob: '*.{txt,json,csv}',      // Multiple file types
  recursive: true,               // Search subdirectories
  exclude: ['temp*', '*.backup'], // Exclude temp and backup files
  loadHidden: false,             // Ignore hidden files
  sampleSize: 50,                // Load only 50 files
  randomizeSample: true,         // Randomize the sample
  sampleSeed: 123,               // Reproducible random sampling
  loaderMap: {
    // Custom loader for a specific file type
    '.json': (path) => CustomJsonLoader(path),
  },
  metadataBuilder: (file, defaultMetadata) {
    // Add custom metadata
    return {
      ...defaultMetadata,
      'category': _categorizeFile(file),
    };
  },
);

final documents = await loader.load();
```

## Best Practices

- Use `lazyLoad()` for large directories to manage memory efficiently
- Provide specific glob patterns to reduce unnecessary file processing
- Customize loaders for specialized file types
- Use `metadataBuilder` to add context-specific information to documents

## Limitations

- Relies on file system access
- Performance may vary with large directories