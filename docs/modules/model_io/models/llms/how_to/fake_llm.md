# Fake LLMs

We expose some fake LLM classes that can be used for testing. This allows you 
to mock out calls to the LLM and simulate what would happen if the LLM 
responded in a certain way.

## FakeLLM

You can configure a list of responses that the LLM will return in order.

Example:
```dart
test('Test LLMChain call', () async {
  final model = FakeLLM(responses: ['Hello world!']);
  final prompt = PromptTemplate.fromTemplate('Print {foo}');
  final chain = LLMChain(prompt: prompt, llm: model);
  final res = await chain.call({'foo': 'Hello world!'});
  expect(res['text'], 'Hello world!');
  expect(res['foo'], 'Hello world!');
});
```

### FakeEchoLLM

This LLM will simply echo back the input.

Example:
```dart
const llm = FakeEchoLLM();
final result = await llm('Hello world!');
print(result);
// -> 'Hello world!'
```
