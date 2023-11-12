abstract interface class DataLoader<T> {
  Future<T> call(final List<String> uris);
}

/// For now, only base64 encoded images are supported.
typedef Loadable = List<String>;
