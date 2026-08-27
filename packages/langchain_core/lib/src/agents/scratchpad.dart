import 'package:collection/collection.dart';

import '../chat_models/types.dart';
import 'types.dart';

/// Builds the ordered chat transcript for tool-agent intermediate steps.
///
/// Parallel actions from one planning iteration contain the same assistant
/// [AgentAction.messageLog]. When their logs match, this helper emits that log
/// once followed by every tool result. Steps without an [AgentStep.iteration],
/// or custom steps with inconsistent logs, retain the legacy per-step layout.
List<ChatMessage> buildToolAgentScratchpad(
  final List<AgentStep> intermediateSteps,
) {
  final messages = <ChatMessage>[];
  var index = 0;
  while (index < intermediateSteps.length) {
    final step = intermediateSteps[index];
    final iteration = step.iteration;
    if (iteration == null) {
      _appendLegacyStep(messages, step);
      index += 1;
      continue;
    }

    var end = index + 1;
    while (end < intermediateSteps.length &&
        intermediateSteps[end].iteration == iteration) {
      end += 1;
    }
    final group = intermediateSteps.sublist(index, end);
    const equality = DeepCollectionEquality();
    final sharedLog = group.first.action.messageLog;
    final logsMatch = group.every(
      (candidate) => equality.equals(candidate.action.messageLog, sharedLog),
    );

    if (logsMatch) {
      messages
        ..addAll(sharedLog)
        ..addAll(group.map(_toolResultMessage));
    } else {
      for (final candidate in group) {
        _appendLegacyStep(messages, candidate);
      }
    }
    index = end;
  }
  return messages;
}

void _appendLegacyStep(final List<ChatMessage> messages, final AgentStep step) {
  messages
    ..addAll(step.action.messageLog)
    ..add(_toolResultMessage(step));
}

ToolChatMessage _toolResultMessage(final AgentStep step) => ToolChatMessage(
  toolCallId: step.action.id,
  content: step.observation,
  name: step.action.tool,
);
