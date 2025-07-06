# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

This is a custom Dart lint package that enforces "Exception Transparency" principles. The package detects and flags exception swallowing patterns where try-catch blocks hide exceptions instead of letting them bubble up. It's built using the custom_lint_builder framework.

## Core Architecture

- **Main entry point**: `lib/exception_transparency_lint.dart` - Creates the plugin and registers lint rules
- **Rule implementation**: `lib/src/exception_swallowing_rule.dart` - Contains the `ExceptionSwallowingRule` with AST analysis logic
- **Testing**: `test/exception_swallowing_rule_test.dart` - Unit tests for the lint rule

The rule uses three AST visitor classes to detect patterns:
- `_LoggingDetector` - Finds logging method calls
- `_ToolErrorDetector` - Identifies legitimate error handling patterns  
- `_RetryLogicDetector` - Detects retry logic patterns

## Development Commands

**Run tests:**
```bash
dart test
```

**Run the linter on target code:**
```bash
dart run custom_lint
```

**Analyze this package:**
```bash
dart analyze
```

**Get dependencies:**
```bash
dart pub get
```

## Exception Transparency Principle

The core principle: Never hide exceptions with try-catch blocks unless there's a specific fix we can apply. Exceptions reveal problems that either we need to fix or users need to fix, but swallowing them makes diagnosis impossible.

**Legitimate patterns the rule allows:**
- Proper cleanup with rethrow/throw
- Exception transformation (catching one type, throwing another)
- Retry logic with `Future.delayed` or increment patterns

**Patterns that get flagged:**
- Empty catch blocks
- Logging exceptions without rethrowing
- Creating default/fallback values instead of failing
- Any catch block that doesn't rethrow, throw, or handle legitimate retry patterns

## Testing Strategy

Tests use AST parsing to analyze code snippets and verify the rule correctly identifies violations. The `_analyzeCode` helper function parses code and checks if the rule flags it as problematic.