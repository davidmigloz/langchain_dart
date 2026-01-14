# Partial prompt templates

Like other methods, it can make sense to "partial" a prompt template - eg pass
in a subset of the required values, as to create a new prompt template which
expects only the remaining subset of values.

LangChain supports this in two ways:

- Partial formatting with string values.
- Partial formatting with functions that return string values.

These two different ways support different use cases. In the examples below, we
go over the motivations for both use cases as well as how to do it in LangChain.

## Partial With Strings

One common use case for wanting to partial a prompt template is if you get some
of the variables before others. For example, suppose you have a prompt template
that requires two variables, foo and baz. If you get the foo value early on in
the chain, but the baz value later, it can be annoying to wait until you have
both variables in the same place to pass them to the prompt template. Instead,
you can partial the prompt template with the foo value, and then pass the
partialed prompt template along and just use that. Below is an example of doing
this:

```dart

final prompt = PromptTemplate.fromTemplate('{foo}{bar}');
final partialPrompt = prompt.partial({'foo': 'foo'});

final res = partialPrompt.format({'bar': 'baz'});

print(res);
// -> 'foobaz'
```

You can also just initialize the prompt with the partialed variables.

```dart

final prompt = PromptTemplate.fromTemplate(
  '{foo}{bar}',
  partialVariables: const {'foo': 'foo'},
);
final res = prompt.format({'bar': 'baz'});

print(res);
// -> 'foobaz'
```

## Partial With Functions

This functionality is still not implemented in LangChain.dart.
You can follow the progress of this feature
in [this issue](https://github.com/davidmigloz/langchain_dart/issues/51).
