# Agents

Some applications require a flexible chain of calls to LLMs and other tools
based on user input. The **Agent** interface provides the flexibility for such
applications. An agent has access to a suite of tools, and determines which ones
to use depending on the user input. Agents can use multiple tools, and use the
output of one tool as the input to the next.

There are two main types of agents:

- **Action agents:** at each time-step, decide on the next action using the
  outputs of all previous actions.
- **Plan-and-execute agents:** decide on the full sequence of actions up front,
  then execute them all without updating the plan.

Action agents are suitable for small tasks, while plan-and-execute agents are
better for complex or long-running tasks that require maintaining long-term
objectives and focus. Often the best approach is to combine the dynamism of an
action agent with the planning abilities of a plan-and-execute agent by letting
the plan-and-execute agent use action agents to execute plans.

For a full list of agent types see
[agent types](/modules/agents/agent_types/agent_types.md). Additional
abstractions involved in agents are:

- **Tools:** the actions an agent can take. What tools you give an agent highly
  depend on what you want the agent to do.
- **Toolkits:** wrappers around collections of tools that can be used together a
  specific use case. For example, in order for an agent to interact with a SQL
  database it will likely need one tool to execute queries and another to
  inspect tables.

## Action agents

At a high-level an action agent:

1. Receives user input.
2. Decides which tool, if any, to use and the tool input.
3. Calls the tool and records the output (also known as an "observation").
4. Decides the next step using the history of tools, tool inputs, and
   observations.
5. Repeats 3-4 until it determines it can respond directly to the user.
6. Action agents are wrapped in agent executors, which are responsible for
   calling the agent, getting back an action and action input, calling the tool
   that the action references with the generated input, getting the output of
   the tool, and then passing all that information back into the agent to get
   the next action it should take.

Although an agent can be constructed in many ways, it typically involves these
components:

- **Prompt template:** responsible for taking the user input and previous steps
  and constructing a prompt to send to the language model.
- **Language model:** takes the prompt with use input and action history and
  decides what to do next.
- **Output parser:** takes the output of the language model and parses it into
  the next action or a final answer.

## Plan-and-execute agents

At a high-level a plan-and-execute agent:

1. Receives user input.
2. Plans the full sequence of steps to take.
3. Executes the steps in order, passing the outputs of past steps as inputs to
   future steps.

The most typical implementation is to have the planner be a language model,
and the executor be an action agent.

## Get started

First, let's load the language model we're going to use to control the agent.

```dart
final llm = ChatOpenAI(
  apiKey: openAiKey,
  defaultOptions: const ChatOpenAIOptions(temperature: 0),
);
```

Next, let's load some tools to use. In this case, we're going to use a
calculator.

```dart
final tool = CalculatorTool();
final tools = [tool];
```

Finally, let's initialize an agent with the tools, the language model, and the
type of agent we want to use.

```dart
final agent = OpenAIToolsAgent.fromLLMAndTools(llm: llm, tools: tools);
```

Now let's create the agent executor and test it out!

```dart
final executor = AgentExecutor(agent: agent);
final res = await executor.run('What is 40 raised to the 0.43 power? ');
print(res); // -> '40 raised to the power of 0.43 is approximately 4.8852' 
```
