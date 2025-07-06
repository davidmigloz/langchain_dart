# Exception Transparency Test Console

This is a test console project that demonstrates the exception transparency lint rule in action.

## Purpose

This project contains simple, clear examples of both good and bad exception handling patterns to verify that the custom lint rule correctly identifies exception swallowing violations.

## File Structure

- `lib/good_examples.dart` - ✅ Examples that should NOT trigger the lint rule
- `lib/bad_examples.dart` - ❌ Examples that SHOULD trigger the lint rule  
- `bin/main.dart` - Simple console application entry point

## Usage

1. **Install dependencies:**
   ```bash
   dart pub get
   ```

2. **Run the lint rule:**
   ```bash
   dart run custom_lint
   ```

3. **Run standard analysis:**
   ```bash
   dart analyze
   ```

4. **Run the console app:**
   ```bash
   dart run
   ```

## Expected Results

When you run `dart run custom_lint`, you should see warnings for:

### Bad Examples (Should be flagged):
- Empty catch blocks
- Logging without rethrow
- Creating default/fallback values
- Silent failure patterns
- toString() fallbacks
- Empty list/map fallbacks

### Good Examples (Should NOT be flagged):
- Tool error handling with `{'error': message}` format
- Proper rethrow after logging
- Exception transformation
- Retry logic with attempt tracking
- Cleanup operations with rethrow

## Testing the Rule

This project serves as a comprehensive test to ensure the exception transparency lint rule works correctly in practice, detecting real exception swallowing patterns while allowing legitimate error handling strategies.