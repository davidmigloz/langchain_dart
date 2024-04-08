// ignore_for_file: avoid_print
import 'dart:io';

import 'package:langchain/langchain.dart';
import 'package:langchain_openai/langchain_openai.dart';

void main(final List<String> arguments) async {
  await _multipleChains1();
  await _multipleChains2();
  await _branchingAndMerging();
}

Future<void> _multipleChains1() async {
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
}

Future<void> _multipleChains2() async {
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

  final modelParser = model | const StringOutputParser();

  final colorGenerator = Runnable.getMapFromInput('attribute') |
      promptTemplate1 |
      Runnable.fromMap({
        'color': modelParser,
      });
  final colorToFruit = promptTemplate2 | modelParser;
  final colorToCountry = promptTemplate3 | modelParser;
  final questionGenerator = colorGenerator |
      Runnable.fromMap({
        'fruit': colorToFruit,
        'country': colorToCountry,
      }) |
      promptTemplate4 |
      modelParser;

  final res = await questionGenerator.invoke('warm');
  print(res);
// The color of Apple is typically depicted as silver or gray for their logo
// and products. The flag of Armenia consists of three horizontal stripes of
// red, blue, and orange from top to bottom.
}

Future<void> _branchingAndMerging() async {
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
        AIChatMessagePromptTemplate.fromTemplate('{original_response}'),
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
  // To overcome dependency on a strong product owner, organizations can invest
  // in training and supporting the product owner role, ensuring they have the
  // necessary skills, knowledge, and availability to effectively manage the
  // product backlog. Collaboration between the product owner and the
  // development team is crucial to ensure alignment and timely decision-making.
  //
  // To manage the increased time and resource requirements, teams can optimize
  // the Scrum ceremonies and ensure they are conducted efficiently. This
  // includes keeping meetings focused and concise, setting clear agendas, and
  // leveraging tools and technologies to streamline communication and
  // collaboration.
  //
  // While Scrum is primarily designed for software development, organizations
  // can explore adapting its principles to non-development tasks by tailoring
  // and modifying the framework to suit the specific needs and nature of the
  // project. This may involve adjusting the timeframes, deliverables, and
  // ceremonies to align with the requirements of non-development projects.
  //
  // To control scope creep, teams should establish robust change management
  // processes and ensure that any additions or modifications to the project
  // scope are properly evaluated, prioritized, and communicated to all
  // stakeholders. Regular communication and alignment between the product
  // owner, development team, and stakeholders are crucial in managing scope
  // effectively.
  //
  // To mitigate risks associated with team collaboration and communication,
  // organizations can invest in training and fostering a culture of open
  // communication, collaboration, and conflict resolution. Regular
  // team-building activities and clear communication channels can help foster
  // effective collaboration and address any conflicts that may arise.
  //
  // To address potential team dynamics and conflicts, it is important to
  // foster a culture of trust, respect, and shared accountability within the
  // team. Clear roles and responsibilities, effective communication, and a
  // supportive team environment are key to minimizing conflicts and ensuring
  // productive collaboration.
  //
  // To overcome resistance to change and address the learning curve,
  // organizations should invest in comprehensive training and provide ongoing
  // support and guidance to team members and stakeholders. By educating and
  // involving everyone in the Scrum framework, organizations can facilitate a
  // smooth transition and foster a positive mindset towards change.
  //
  // In conclusion, while Scrum has its challenges, addressing these potential
  // cons through proactive measures can help maximize the benefits and
  // effectiveness of the framework. By continuously improving and adapting
  // Scrum practices, teams can overcome these challenges and achieve
  // successful project outcomes.
}
