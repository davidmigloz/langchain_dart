import 'model_kind.dart';
import 'provider.dart';

/// Model metadata for provider model listing.
///
/// Returned by [Provider.listModels] for all providers. Contains the model id,
/// kind, name, description, and any extra metadata.
class ModelInfo {
  /// Creates a new [ModelInfo] instance.
  ///
  /// [name]: The unique name for the model (required). [kinds]: The set of
  /// kinds of model (required, non-empty). [displayName]: The display name of
  /// the model, if available. [description]: A description of the model, if
  /// available. [extra]: Any extra metadata returned by the provider (default:
  /// empty map).
  ModelInfo({
    required this.name,
    required this.kinds,
    this.displayName,
    this.description,
    this.extra = const {},
  }) : assert(kinds.isNotEmpty, 'kinds must not be empty');

  /// The unique name for the model (required).
  final String name;

  /// The set of kinds of model (text, embedding, rerank, etc). Must not be
  /// empty.
  final Set<ModelKind> kinds;

  /// The display name of the model, if available.
  final String? displayName;

  /// A description of the model, if available.
  final String? description;

  /// Any extra metadata returned by the provider.
  final Map<String, dynamic> extra;
}
