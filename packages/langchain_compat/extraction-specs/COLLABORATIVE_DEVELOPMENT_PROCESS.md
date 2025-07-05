# Collaborative Software Development Process

This document captures the collaborative development process discovered while
building the langchain_compat package. This process creates genuine shared
ownership through iterative design collaboration rather than just code
generation.

## Process Overview

The process consists of 8 distinct stages, each with specific goals and
communication patterns that ensure both human domain knowledge and AI
implementation capabilities are effectively leveraged.

## Stage 1: Planning & Requirements Gathering

**Goal**: Establish shared understanding and gather all requirements before any
code is written. Multiple rounds of clarification to ensure the assistant
understands the user's vision, constraints, and preferences.

**Conversation snippet**:
```
User: "I want to implement typed output support across all chat providers, look at these dartantic_ai examples"
Assistant: "I see OpenAI uses ResponseFormat.jsonSchema() and Google uses GenerationConfig..."
User: "wait. don't Anthropic, etc. have a way to pass in an output schema?"
Assistant: "Let me research the langchain_dart implementations..."
User: "Don't just assume limitations - research what's actually available"
```

## Stage 2: Initial Implementation  

**Goal**: Build working code while fixing errors iteratively. The user provides
immediate corrections when the assistant makes wrong assumptions or takes
approaches that violate project principles.

**Conversation snippet**:
```
Assistant: "I'll inject schema instructions into system prompts for Mistral..."
User: "1. of course you should use the Ollama format parameter and not those system prompt hijacking scheme you had.. jeez."
User: "2. you should NOT modify system prompts (they belong to developers)"
Assistant: "You're right, let me fix this approach completely..."
User: "we've got a problem in the OpenAIChatModel.runStream implementation"
```

## Stage 3: Creating Tests/Sample Apps

**Goal**: Build concrete examples that demonstrate the feature works as
intended. These serve as both validation and documentation of expected behavior.

**Conversation snippet**:
```
Assistant: "I'll create example/typed_output.dart to test the implementation..."
User: "Run it against all providers so we can see what works and what doesn't"
Assistant: "The example shows OpenAI and Google working, but Groq throws an error..."
User: "Perfect - that's exactly what users need to know"
```

## Stage 4: Testing & Validation

**Goal**: Verify behavior matches expectations through running the examples. The
user validates that the implementation actually works as intended and catches
any attempts to hide problems.

**Conversation snippet**:
```
Assistant: "I'll add try-catch to handle providers that don't support structured output..."
User: "no! do NOT paper over that error with an exception handler. the user needs to know loud and proud that groq doesn't support an output schema"
Assistant: "Should I add validation to prevent the error?"
User: "no. don't check. just let the exception be thrown."
User: "that is the right way to solve the problem -- in the client code."
```

## Stage 5: Principle Discovery & Documentation

**Goal**: Capture design insights and principles while context is fresh. Convert
specific decisions into general principles that can guide future development.

**Conversation snippet**:
```
User: "can you update CLAUDE.md with that principle? don't hide the exception -- it's either a problem we need to fix or a problem the user of our lib needs to fix"
Assistant: "I'll add Exception Transparency to the design principles..."
User: "a tweak -- it's ok to catch an exception if there's a fix we can apply in our code. but we can't just swallow them and move on."
```

## Stage 6: Design Documentation

**Goal**: Create comprehensive architecture docs for future reference while the
reasoning behind decisions is still fresh in both minds.

**Conversation snippet**:
```
User: "Create extraction-specs/TYPED_OUTPUT_SPEC.md documenting the architecture and implementation patterns"
Assistant: "I'll document each provider's approach and the principles we discovered..."
User: "Include why we chose tool-based for Anthropic and native schema for others"
```

## Stage 7: User-Facing Documentation Updates

**Goal**: Update README, CHANGELOG, and other user-facing documentation to
reflect the new feature and any breaking changes.

**Conversation snippet**:
```
User: "Update the README with examples of the new typed output feature"
Assistant: "Should I add it to the CHANGELOG as well?"
User: "Yes, under the next version section - it's a new feature, not breaking"
Assistant: "I'll also update the command examples in CLAUDE.md to include typed_output.dart"
```

## Stage 8: Process Reflection

**Goal**: Reflect on the collaborative process itself and capture what made it
effective for future use.

**Conversation snippet**:
```
User: "I think we've really discovered an amazing process for writing code... can you give me a summary of each stage with abbreviated, but based in reality, summary of conversations?"
User: "I find this process extremely productive and fun. and I own every LOC of the final product, even if most (all?) of the code came from you because we designed it together"
```

## Key Success Factors

1. **Iterative Design**: Multiple rounds of clarification before implementation
2. **Principle-Driven**: Discovering and documenting design principles as we go
3. **Reality-Based Testing**: Using real examples to validate behavior
4. **Transparent Collaboration**: User corrects assumptions immediately
5. **Context Preservation**: Documenting decisions while reasoning is fresh
6. **Shared Ownership**: User owns the design even when assistant writes code

## User's Key Prompting Patterns

1. **Context + Examples**: "look at these dartantic_ai examples"
2. **Direct Corrections**: "no! do NOT..." / "of course you should use..."
3. **Ownership Assertions**: "system prompts belong to developers"
4. **Problem Reports**: "we've got a problem in..."
5. **Principle Articulation**: "that is the right way to solve the problem"
6. **Documentation Requests**: "can you update CLAUDE.md with that principle?"
7. **Process Reflection**: "I think we've discovered..."

## Why This Process Works

This process creates better software because the human provides domain knowledge
and judgment while the AI provides implementation speed and thoroughness. The
result is code that truly reflects the user's intent rather than the AI's
assumptions.

The user maintains ownership through active design participation, immediate
course corrections, and principle articulation. The assistant provides rapid
implementation and comprehensive documentation while learning the user's
preferences and constraints through iteration.

This collaborative approach produces code that both parties understand and can
maintain, with clear documentation of design decisions and principles for future
reference.