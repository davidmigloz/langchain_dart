# Multiple chains

Runnables can easily be used to combine multiple Chains:

```dart
final openaiApiKey = Platform.environment['OPENAI_API_KEY'];
final model = ChatOpenAI(apiKey: openaiApiKey);
const stringOutputParser = StringOutputParser<ChatResult>();

final promptTemplate1 = ChatPromptTemplate.fromTemplate(
  'What is the city {person} is from? Only respond with the name of the city.',
);

final promptTemplate2 = ChatPromptTemplate.fromTemplate(
  'What country is the city {city} in? Respond in {language}.',
);

final cityChain = promptTemplate1 | model | stringOutputParser;
final combinedChain = Runnable.fromMap({
      'city': cityChain,
      'language': Runnable.getItemFromMap('language'),
    }) |
    promptTemplate2 |
    model |
    stringOutputParser;

final res = await combinedChain.invoke({
  'person': 'Obama',
  'language': 'Spanish',
});
print(res);
// La ciudad de Chicago se encuentra en los Estados Unidos.
```

We use a `RunnableMap` to run two chains in pararell, one that gets the name of city and another that just propagates the `language` input. Finally, the output of the `RunnableMap` is passed to the second prompt and feed into the model.

## Runnable.getItemFromMap and Runnable.passthrough

In the example above, we invoke the `combinedChain` with a `Map` and then use `Runnable.getItemFromMap` to propagate the `language` input to the second prompt. 

Another typical use case is to invoke the chain with a single String input and then use the combination of `Runnable.fromMap` and `Runnable.passthrough` to build the input for the second prompt.

Let's see another example with even more chains and a single String input:

```dart
final openaiApiKey = Platform.environment['OPENAI_API_KEY'];
final model = ChatOpenAI(apiKey: openaiApiKey);

final promptTemplate1 = ChatPromptTemplate.fromTemplate(
  'Generate a {attribute} color. '
  'Return the name of the color and nothing else:',
);
final promptTemplate2 = ChatPromptTemplate.fromTemplate(
  'What is a fruit of color: {color}. '
  'Return the name of the fruit and nothing else:',
);
final promptTemplate3 = ChatPromptTemplate.fromTemplate(
  'What is a country with a flag that has the color: {color}. '
  'Return the name of the country and nothing else:',
);
final promptTemplate4 = ChatPromptTemplate.fromTemplate(
  'What is the color of {fruit} and the flag of {country}?',
);

final modelParser = model | StringOutputParser();

final colorGenerator = Runnable.getMapFromInput('attribute') |
    promptTemplate1 |
    Runnable.fromMap({
      'color': modelParser,
    });
final colorToFruit = promptTemplate2 | modelParser;
final colorToCountry = promptTemplate3 | modelParser;
final questionGenerator = colorGenerator | Runnable.fromMap({
  'fruit': colorToFruit,
  'country': colorToCountry,
}) | promptTemplate4 | modelParser;

final res = await questionGenerator.invoke('warm');
print(res);
// The color of Apple is typically depicted as silver or gray for their logo 
// and products. The flag of Armenia consists of three horizontal stripes of 
// red, blue, and orange from top to bottom.
```

## Branching and Merging

You may want the output of one component to be processed by 2 or more other components. `RunnableMaps` let you split or fork the chain so multiple components can process the input in parallel. Later, other components can join or merge the results to synthesize a final response. This type of chain creates a computation graph that looks like the following:

```
     Input
      / \
     /   \
 Branch1 Branch2
     \   /
      \ /
    Combine
```

Let's see an example:

```dart
final openaiApiKey = Platform.environment['OPENAI_API_KEY'];
final model = ChatOpenAI(apiKey: openaiApiKey);
const stringOutputParser = StringOutputParser<ChatResult>();

final planner = Runnable.getMapFromInput() |
    ChatPromptTemplate.fromTemplate('Generate an argument about: {input}') |
    model |
    stringOutputParser |
    Runnable.getMapFromInput('base_response');

final argumentsFor = ChatPromptTemplate.fromTemplate(
      'List the pros or positive aspects of {base_response}',
    ) |
    model |
    stringOutputParser;

final argumentsAgainst = ChatPromptTemplate.fromTemplate(
      'List the cons or negative aspects of {base_response}',
    ) |
    model |
    stringOutputParser;

final finalResponder = ChatPromptTemplate.fromPromptMessages([
      AIChatMessagePromptTemplate.fromTemplate(
        '{original_response}'
      ),
      HumanChatMessagePromptTemplate.fromTemplate(
        'Pros:\n{results_1}\n\nCons:\n{results_2}',
      ),
      SystemChatMessagePromptTemplate.fromTemplate(
        'Generate a final response given the critique',
      ),
    ]) |
    model |
    stringOutputParser;

final chain = planner |
    Runnable.fromMap({
      'results_1': argumentsFor,
      'results_2': argumentsAgainst,
      'original_response': Runnable.getItemFromMap('base_response'),
    }) |
    finalResponder;

final res = await chain.invoke('Scrum');
print(res);
// While Scrum has many benefits, it is essential to acknowledge and address
// the potential cons or negative aspects that come with its implementation.
// By understanding these challenges, teams can take necessary steps to
// mitigate them and maximize the effectiveness of Scrum.
//
// To address the lack of predictability, teams can focus on improving their
// estimation techniques, conducting regular progress tracking, and adopting
// techniques like story point estimation or velocity tracking. This can
// provide stakeholders with a better understanding of project timelines and
// deliverables.
//
// ...
//
// In conclusion, while Scrum has its challenges, addressing these potential
// cons through proactive measures can help maximize the benefits and
// effectiveness of the framework. By continuously improving and adapting
// Scrum practices, teams can overcome these challenges and achieve
// successful project outcomes.
```
