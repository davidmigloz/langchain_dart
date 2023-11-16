/// Data loader interface.
abstract interface class DataLoader<T> {
  /// Loads data from the given [uris].
  Future<T> call(final List<String> uris);
}

/// For now, only base64 encoded images are supported.
typedef Loadable = List<String>;
