# Sequential

The next step after calling a language model is make a series of calls to a
language model. This is particularly useful when you want to take the output
from one call and use it as the input to another.

In this notebook we will walk through some examples for how to do this, using
sequential chains. Sequential chains allow you to connect multiple chains and
compose them into pipelines that execute some specific scenario.

## Types of Sequential Chains

There are two types of sequential chains:

- `SimpleSequentialChain`: the simplest form of sequential chains, where each
  step has a singular input/output, and the output of one step is the input to
  the next.
- `SequentialChain`: a more general form of sequential chains, allowing for
  multiple inputs/outputs.

### SimpleSequentialChain

Let's see how we can use a `SimpleSequentialChain`:

```dart
final openAiApiKey = Platform.environment['OPENAI_API_KEY'];
final llm = ChatOpenAI(apiKey: openAiApiKey);

// This is an LLMChain to write a synopsis given a title of a play
const synopsisTemplate = '''
You are a playwright. Given the title of play, it is your job to write a synopsis for that title.

Title: {title}
Playwright: This is a synopsis for the above play:''';
final synopsisPromptTemplate = PromptTemplate.fromTemplate(synopsisTemplate);
final synopsisChain = LLMChain(llm: llm, prompt: synopsisPromptTemplate);

// This is an LLMChain to write a review of a play given a synopsis
const reviewTemplate = '''
You are a play critic from the New York Times. Given the synopsis of play, it is your job to write a review for that play.

Play Synopsis:
{synopsis}
Review from a New York Times play critic of the above play:''';
final reviewPromptTemplate = PromptTemplate.fromTemplate(reviewTemplate);
final reviewChain = LLMChain(llm: llm, prompt: reviewPromptTemplate);

// This is the overall chain where we run these two chains in sequence
final overallChain = SimpleSequentialChain(chains: [synopsisChain, reviewChain]);
final review = await overallChain.run('Tragedy at sunset on the beach');
print(review);
```

> In "Tragedy at Sunset on the Beach," playwright delivers a riveting and 
> emotionally charged drama that captivates the audience from start to finish. 
> Set against the breathtaking backdrop of a tranquil beach at dusk, this play 
> explores the complexities of the human experience with depth and nuance...

### Sequential Chain

Of course, not all sequential chains will be as simple as passing a single
string as an argument and getting a single string as output for all steps in the
chain. In this next example, we will experiment with more complex chains that
involve multiple inputs, and where there also multiple final outputs.

Of particular importance is how we name the input/output variable names. In the
above example we didn't have to think about that because we were just passing
the output of one chain directly as input to the next, but here we do have worry
about that because we have multiple inputs.

```dart
final openAiApiKey = Platform.environment['OPENAI_API_KEY'];
final llm = ChatOpenAI(apiKey: openAiApiKey);

// This is an LLMChain to write a synopsis given a title of a play
const synopsisTemplate = '''
You are a playwright. Given the title of play, it is your job to write a synopsis for that title.

Title: {title}
Era: {era}
Playwright: This is a synopsis for the above play:''';
final synopsisPromptTemplate = PromptTemplate.fromTemplate(synopsisTemplate);
final synopsisChain = LLMChain(
  llm: llm,
  prompt: synopsisPromptTemplate,
  outputKey: 'synopsis',
);

// This is an LLMChain to write a review of a play given a synopsis
const reviewTemplate = '''
You are a play critic from the New York Times. Given the synopsis of play, it is your job to write a review for that play.

Play Synopsis:
{synopsis}
Review from a New York Times play critic of the above play:''';
final reviewPromptTemplate = PromptTemplate.fromTemplate(reviewTemplate);
final reviewChain = LLMChain(
  llm: llm,
  prompt: reviewPromptTemplate,
  outputKey: 'review',
);

// This is the overall chain where we run these two chains in sequence
final overallChain = SequentialChain(chains: [synopsisChain, reviewChain]);
final review = await overallChain.run({
  'title': 'Tragedy at sunset on the beach',
  'era': 'Victorian England',
});
print(review);
```

> Tragedy at Sunset on the Beach: A Captivating Tale of Love and Sacrifice
> 
> In the enchanting coastal town of Victorian England, Tragedy at Sunset on the 
> Beach transports its audience to a world where societal expectations and 
> forbidden love collide. This tragic play, set against the backdrop of a 
> breathtaking sunset on the beach, delves into the complexities of a society 
> bound by rigid rules and the heart-wrenching consequences of defying them...

## Memory in Sequential Chains

Sometimes you may want to pass along some context to use in each step of the
chain or in a later part of the chain, but maintaining and chaining together the
input/output variables can quickly get messy. Using `SimpleMemory` is a
convenient way to do manage this and clean up your chains.

For example, using the previous playwright `SequentialChain`, lets say you
wanted to include some context about date, time and location of the play, and
using the generated synopsis and review, create some social media post text. You
could add these new context variables as input variables, or we can add
a `SimpleMemory` to the chain to manage this context:

```dart
final openAiApiKey = Platform.environment['OPENAI_API_KEY'];
final llm = ChatOpenAI(apiKey: openAiApiKey);

// This is an LLMChain to write a synopsis given a title of a play
const synopsisTemplate = '''
You are a playwright. Given the title of play, it is your job to write a synopsis for that title.

Title: {title}
Era: {era}
Playwright: This is a synopsis for the above play:''';
final synopsisPromptTemplate = PromptTemplate.fromTemplate(synopsisTemplate);
final synopsisChain = LLMChain(
  llm: llm,
  prompt: synopsisPromptTemplate,
  outputKey: 'synopsis',
);

// This is an LLMChain to write a review of a play given a synopsis
const reviewTemplate = '''
You are a play critic from the New York Times. Given the synopsis of play, it is your job to write a review for that play.

Play Synopsis:
{synopsis}
Review from a New York Times play critic of the above play:''';
final reviewPromptTemplate = PromptTemplate.fromTemplate(reviewTemplate);
final reviewChain = LLMChain(
  llm: llm,
  prompt: reviewPromptTemplate,
  outputKey: 'review',
);

// This is an LLMChain to write a social post
const socialTemplate = '''
You are a social media manager for a theater company.  Given the title of play, the era it is set in, the date,time and location, the synopsis of the play, and the review of the play, it is your job to write a social media post for that play.

Here is some context about the time and location of the play:
Date and Time: {time}
Location: {location}

Play Synopsis:
{synopsis}
Review from a New York Times play critic of the above play:
{review}

Social Media Post:''';
final socialPromptTemplate = PromptTemplate.fromTemplate(socialTemplate);
final socialChain = LLMChain(
  llm: llm,
  prompt: socialPromptTemplate,
  outputKey: 'social_post_text',
);

// This is the overall chain where we run these three chains in sequence
final overallChain = SequentialChain(
  memory: const SimpleMemory(
    memories: {
      'time': 'December 25th, 8pm PST',
      'location': 'Theater in the Park'
    },
  ),
  chains: [synopsisChain, reviewChain, socialChain],
);
final review = await overallChain.run({
  'title': 'Tragedy at sunset on the beach',
  'era': 'Victorian England',
});
print(review);
```

> 🌅 Don't miss out on the mesmerizing production of "Tragedy at Sunset on the 
> Beach" at Theater in the Park on December 25th at 8pm PST! 🎭✨ Transporting 
> audiences to the captivating world of a Victorian beach resort in England, 
> this gripping melodrama delves into the depths of human emotions, societal 
> constraints, and the consequences of choices made in the face of desire.
> 
> 💔 Follow the lives of three prominent families as their idyllic holiday 
> takes a dark turn. Lady Adelaide, torn between duty and love; Lord Reginald, 
> embodying societal expectations; and the enigmatic artist, Mr. Theodore, who 
> radiates charm and mystery. Witness their intricate relationships unravel 
> against the backdrop of a breathtaking sunset on the beach.
> 
> 🤫 Secrets, hidden desires, and forbidden love abound in this riveting tale. 
> The young and naive Miss Charlotte falls madly in love with a penniless poet, 
> Mr. Edmund, leading to a ticking time bomb of societal expectations and 
> fervent desires. And with the arrival of the mysterious Baron, disruption and 
> suspense only escalate, pushing the families to the brink of destruction.
> 
> ✨ "Tragedy at Sunset on the Beach" is a thought-provoking exploration of 
> love, betrayal, and the consequences of choices made. This Victorian 
> melodrama will captivate you from the moment the curtains rise, leaving you 
> breathless until the shocking climax.
> 
> ⭐️ The New York Times calls it a "mesmerizing production" that delves into 
> the complexities of human emotions, societal constraints, and the devastating 
> consequences of choices made in the face of desire.
> 
> 🎟️ Get your tickets now for an unforgettable evening of theater that will 
> leave you contemplating the power of love, societal expectations, and the 
> fragility of happiness. Don't miss out on this captivating portrayal of 
> tragedy at its most poignant. Book your seats today! #TragedyAtSunset 
> #TheaterInthePark #VictorianMelodrama
