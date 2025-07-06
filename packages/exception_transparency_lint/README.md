# Exception Transparency Lint

A custom Dart lint package that detects and prevents exception swallowing
patterns that violate the Exception Transparency principle.

## What it detects

This linter identifies problematic try-catch blocks that:

1. **Empty catch blocks** - Silently ignore exceptions without any handling
2. **Log exceptions but don't rethrow** - Catches exceptions, logs them, but
   continues execution without propagating the error
3. **Create default/fallback values** - Catches exceptions and returns default
   values instead of failing (empty maps `{}`, empty lists `[]`, hardcoded strings like `'Unknown User'`)
4. **Assignment fallbacks** - Catches exceptions and assigns default values to variables
5. **toString() fallbacks** - Catches exceptions and returns the exception as a string
6. **Silent return patterns** - Any catch block that doesn't rethrow, throw, or implement legitimate retry logic

## What it allows (legitimate patterns)

- **Structured error responses** - Converting exceptions to `{'error': message}` format for API responses
- **Proper cleanup with rethrow** - Cleanup code followed by `rethrow` or `throw`
- **Exception transformation** - Catching one exception type and throwing a different one
- **Retry logic** - Patterns with `Future.delayed()` or attempt increment tracking

## Exception Transparency Principle

> "Never hide exceptions with try-catch blocks unless there's a specific fix we
> can apply in our code - exceptions are either problems we need to fix or
> problems the user needs to fix, but swallowing them makes that impossible."

## Examples

### ❌ BAD - Default Value Creation

```dart
try {
  final result = jsonDecode(data);
  return result;
} catch (e) {
  _logger.warning('JSON parsing failed: $e');
  return {}; // Creates default value instead of letting exception bubble up
}
```

### ❌ BAD - Silent Fallback

```dart
try {
  return fetchUserName();
} catch (e) {
  return 'Unknown User'; // Silent fallback - user never knows fetch failed
}
```

### ❌ BAD - Empty Catch Block

```dart
try {
  processImportantData();
} catch (e) {
  // Empty catch - silently ignores all problems
}
```

### ❌ BAD - Assignment Default

```dart
String result;
try {
  result = complexCalculation();
} catch (e) {
  result = 'default'; // Assigns default value - swallowing!
}
```

### ✅ GOOD - Exception Transformation

```dart
try {
  final result = await lowLevelOperation();
  return result;
} catch (e) {
  throw PackageSpecificException(e.toString());
}
```

### ✅ GOOD - Structured Error Response

```dart
try {
  final result = await apiCall();
  return {'success': true, 'data': result};
} catch (e) {
  return {'success': false, 'error': e.toString()};
}
```

### ✅ GOOD - Proper Rethrow

```dart
try {
  final result = jsonDecode(data);
  return result;
} catch (e) {
  _logger.warning('JSON parsing failed: $e');
  rethrow; // Let the exception bubble up after logging
}
```

## Installation

Add to your `analysis_options.yaml`:

```yaml
analyzer:
  plugins:
    - custom_lint

custom_lint:
  rules:
    - exception_swallowing
```

Add to your `dev_dependencies` in `pubspec.yaml`:

```yaml
dev_dependencies:
  custom_lint: ^0.6.7
  exception_transparency_lint:
    path: ../exception_transparency_lint
```

## Usage

Run the linter with:

```bash
dart run custom_lint
```

The rule will warn about any exception swallowing patterns found in your code
with suggestions on how to fix them.