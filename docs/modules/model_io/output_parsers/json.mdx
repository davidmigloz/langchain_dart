# JSON output parser

The `JsonOutputParser` takes the output of the previous `Runnable` in the chain, converts it to a string, and then parses it as a JSON Map. 

This is useful for extracting structured data from the output of the model. Or to use the output of one model as the input for the prompt template of another model.

A lot of model providers support JSON mode, which ensures the model will respond with valid JSON.

## Usage

In the following example, we use GPT-4 Turbo with JSON mode enabled to output a list of countries and their populations. We then use the `JsonOutputParser` to parse the JSON output into a Dart Map.

```dart
final promptTemplate = ChatPromptTemplate.fromTemplate(
  'Output a list of the countries {countries} and their '
      'populations in JSON format. Use a dict with an outer key of '
      '"countries" which contains a list of countries. '
      'Each country should have the key "name" and "population"',
);
final model = ChatOpenAI(
  apiKey: openAiApiKey,
  defaultOptions: ChatOpenAIOptions(
    model: 'gpt-4-turbo',
    responseFormat: ChatOpenAIResponseFormat.jsonObject,
  ),
);
final parser = JsonOutputParser<ChatResult>();

final chain = promptTemplate.pipe(model).pipe(parser);

final res = await chain.invoke({
  'countries': ['France', 'Spain', 'Japan'].join(', '),
});
print(res);
// {countries: [{name: France, population: 67413000}, {name: Spain, population: 47350000}, {name: Japan, population: 125584838}]}
```

The `JsonOutputParser` also supports streaming. It converts the incomplete JSON chunks being emitted to valid JSON Maps incrementally.

If we just stream the output of the model without using the `JsonOutputParser`, we would get something like this:

```dart
final noJsonParser = promptTemplate.pipe(model).pipe(StringOutputParser());
final stream1 = noJsonParser.stream({
  'countries': ['France', 'Spain', 'Japan'].join(', '),
});
await stream1.forEach((final chunk) => print('$chunk|'));
// |
// {
// |
// |
// "|
// countries|
// ":|
// [
// |
// |
// {
// |
// |
// "|
// name|
// ":|
// "|
// France|
// ...
```

Which is not very useful, as we cannot parse those chunks into a valid JSON Map. However, if we use the `JsonOutputParser`, we get valid incremental JSON Maps: 

```dart
final withJsonParser = promptTemplate.pipe(model).pipe(JsonOutputParser());
final stream2 = withJsonParser.stream({
  'countries': ['France', 'Spain', 'Japan'].join(', '),
});
await stream2.forEach((final chunk) => print('$chunk|'));
// {}|
// {countries: []}|
// {countries: [{name: France}]}|
// {countries: [{name: France, population: 67390000}, {}]}|
// {countries: [{name: France, population: 67390000}, {name: Spain}]}|
// {countries: [{name: France, population: 67390000}, {name: Spain, population: 47350000}]}|
// {countries: [{name: France, population: 67390000}, {name: Spain, population: 47350000}, {name: Japan}]}|
// {countries: [{name: France, population: 67390000}, {name: Spain, population: 47350000}, {name: Japan, population: 125360000}]}|
```
