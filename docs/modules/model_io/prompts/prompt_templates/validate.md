# Validate template

By default, `PromptTemplate` will validate the template string by checking whether the 
`inputVariables` match the variables defined in `template`. You can disable this behavior by 
setting `validateTemplate` to `false`.

```dart
const template = 'I am learning langchain because {reason}.';

final promptTemplate = PromptTemplate(
  inputVariables: const {'reason', 'foo'},
  template: template,
);
// -> 'Exception: Invalid template: 1 variables found, but 2 expected.}'

final promptTemplate1 = PromptTemplate(
  inputVariables: const {'reason', 'foo'},
  template: template,
  validateTemplate: false,
);
// -> No exception
```