@TestOn('vm')
library; // Uses dart:io

import 'dart:io';

import 'package:openai_dart/openai_dart.dart';
import 'package:test/test.dart';

// https://platform.openai.com/docs/assistants/overview
void main() {
  group('OpenAI Assistants API tests',
      timeout: const Timeout(Duration(minutes: 5)), () {
    late OpenAIClient client;

    setUp(() {
      client = OpenAIClient(
        apiKey: Platform.environment['OPENAI_API_KEY'],
      );
    });

    tearDown(() {
      client.endSession();
    });

    Future<String> createAssistant() async {
      const model = 'gpt-4';
      const name = 'Math Tutor';
      const description = 'Help students with math homework';
      const instructions =
          'You are a personal math tutor. Write and run code to answer math questions.';
      final res = await client.createAssistant(
        request: const CreateAssistantRequest(
          model: CreateAssistantRequestModel.string(model),
          name: name,
          description: description,
          instructions: instructions,
          tools: [AssistantTools.codeInterpreter()],
        ),
      );
      expect(res.id, isNotNull);
      expect(res.object, AssistantObjectObject.assistant);
      expect(res.createdAt, greaterThan(0));
      expect(res.name, name);
      expect(res.description, description);
      expect(res.model, model);
      expect(res.instructions, instructions);
      expect(res.tools, hasLength(1));
      final tool = res.tools.first;
      expect(tool, const AssistantTools.codeInterpreter());
      expect(res.fileIds, isEmpty);
      expect(res.metadata, isEmpty);
      return res.id;
    }

    Future<String> createThread() async {
      final res = await client.createThread(
        request: const CreateThreadRequest(),
      );
      expect(res.id, isNotNull);
      expect(res.object, ThreadObjectObject.thread);
      expect(res.createdAt, greaterThan(0));
      expect(res.metadata, isEmpty);
      return res.id;
    }

    Future<void> addMessageToThread(final String threadId) async {
      final res = await client.createThreadMessage(
        threadId: threadId,
        request: const CreateMessageRequest(
          role: CreateMessageRequestRole.user,
          content:
              'I need to solve the equation `3x + 11 = 14`. Can you help me?',
        ),
      );
      expect(res.id, isNotNull);
      expect(res.object, MessageObjectObject.threadMessage);
      expect(res.createdAt, greaterThan(0));
      expect(res.threadId, threadId);
      expect(res.role, MessageObjectRole.user);
      expect(res.content, hasLength(1));
      expect(res.assistantId, isNull);
      expect(res.runId, isNull);
      expect(res.fileIds, hasLength(0));
      expect(res.metadata, hasLength(0));
    }

    Future<void> listMessagesInThread(final String threadId) async {
      final res = await client.listThreadMessages(
        threadId: threadId,
      );
      expect(res.object, 'list');
      expect(res.firstId, isNotNull);
      expect(res.lastId, isNotNull);
      expect(res.hasMore, isFalse);
      expect(res.data, hasLength(1));
      final msg = res.data.first;
      expect(msg.id, isNotNull);
      expect(msg.object, MessageObjectObject.threadMessage);
      expect(msg.createdAt, greaterThan(0));
      expect(msg.threadId, threadId);
      expect(msg.role, MessageObjectRole.user);
      expect(msg.content, hasLength(1));
      expect(msg.assistantId, isNull);
      expect(msg.runId, isNull);
      expect(msg.fileIds, hasLength(0));
      expect(msg.metadata, hasLength(0));
    }

    Future<String> runAssistant(
      final String assistantId,
      final String threadId,
    ) async {
      final res = await client.createThreadRun(
        threadId: threadId,
        request: CreateRunRequest(
          assistantId: assistantId,
          instructions:
              'Please address the user as Jane Doe. The user has a premium account.',
        ),
      );
      expect(res.id, isNotNull);
      expect(res.object, RunObjectObject.threadRun);
      expect(res.createdAt, greaterThan(0));
      expect(res.threadId, threadId);
      expect(res.assistantId, assistantId);
      expect(res.status, RunStatus.queued);
      expect(res.requiredAction, isNull);
      expect(res.lastError, isNull);
      expect(res.expiresAt, greaterThan(0));
      expect(res.startedAt, isNull);
      expect(res.cancelledAt, isNull);
      expect(res.failedAt, isNull);
      expect(res.completedAt, isNull);
      expect(res.model, startsWith('gpt-4'));
      expect(res.instructions, isNotEmpty);
      expect(res.tools, hasLength(1));
      expect(res.fileIds, isEmpty);
      expect(res.metadata, isEmpty);
      return res.id;
    }

    Future<void> checkRunStatus(
      final String threadId,
      final String runId,
    ) async {
      RunObject res;
      do {
        res = await client.getThreadRun(
          threadId: threadId,
          runId: runId,
        );
        expect(res.id, isNotNull);
      } while (res.status != RunStatus.completed);
      expect(res.id, runId);
      expect(res.object, RunObjectObject.threadRun);
      expect(res.createdAt, greaterThan(0));
      expect(res.threadId, threadId);
      expect(res.assistantId, isNotNull);
      expect(res.status, RunStatus.completed);
      expect(res.requiredAction, isNull);
      expect(res.lastError, isNull);
      expect(res.expiresAt, isNull);
      expect(res.startedAt, greaterThan(0));
      expect(res.cancelledAt, isNull);
      expect(res.failedAt, isNull);
      expect(res.completedAt, greaterThan(0));
      expect(res.model, startsWith('gpt-4'));
      expect(res.instructions, isNotEmpty);
      expect(res.tools, hasLength(1));
      expect(res.fileIds, isEmpty);
      expect(res.metadata, isEmpty);
      expect(res.usage?.totalTokens, greaterThan(0));
      expect(res.usage?.completionTokens, greaterThan(0));
      expect(res.usage?.promptTokens, greaterThan(0));
    }

    Future<void> checkAssistantResponse(
      final String threadId,
    ) async {
      final res = await client.listThreadMessages(threadId: threadId);
      expect(res.object, 'list');
      expect(res.firstId, isNotNull);
      expect(res.lastId, isNotNull);
      expect(res.hasMore, isFalse);
      final messages = res.data;
      expect(messages, hasLength(3));
      final userMsg = messages[2];
      expect(userMsg.role, MessageObjectRole.user);
      expect(userMsg.content, hasLength(1));
      expect(
        userMsg.content.first.text,
        'I need to solve the equation `3x + 11 = 14`. Can you help me?',
      );
      final assistantMsg1 = messages[1];
      expect(assistantMsg1.role, MessageObjectRole.assistant);
      expect(assistantMsg1.content, hasLength(1));
      expect(assistantMsg1.content.first.text, contains('Jane Doe'));
      final assistantMsg2 = messages[0];
      expect(assistantMsg2.role, MessageObjectRole.assistant);
      expect(assistantMsg2.content, hasLength(1));
      expect(assistantMsg2.content.first.text.toLowerCase(), contains('x = 1'));
    }

    Future<void> checkThreadRunSteps(
      final String threadId,
      final String runId,
    ) async {
      final res = await client.listThreadRunSteps(
        threadId: threadId,
        runId: runId,
      );
      expect(res.object, 'list');
      expect(res.firstId, isNotNull);
      expect(res.lastId, isNotNull);
      expect(res.hasMore, isFalse);

      final steps = res.data;
      expect(steps, hasLength(3));

      final step1 = steps[2];
      expect(step1.id, isNotNull);
      expect(step1.object, RunStepObjectObject.threadRunStep);
      expect(step1.createdAt, greaterThan(0));
      expect(step1.assistantId, isNotNull);
      expect(step1.threadId, threadId);
      expect(step1.runId, isNotNull);
      expect(step1.type, RunStepType.messageCreation);
      expect(step1.status, RunStepStatus.completed);
      final details = step1.stepDetails
          .mapOrNull(messageCreation: (final d) => d.messageCreation);
      expect(details?.messageId, isNotEmpty);
      expect(step1.lastError, isNull);
      expect(step1.expiredAt, isNull);
      expect(step1.cancelledAt, isNull);
      expect(step1.failedAt, isNull);
      expect(step1.completedAt, greaterThan(0));
      expect(step1.metadata, isNull);
      expect(step1.usage?.totalTokens, greaterThan(0));
      expect(step1.usage?.completionTokens, greaterThan(0));
      expect(step1.usage?.promptTokens, greaterThan(0));

      final step2 = steps[1];
      expect(step2.id, isNotNull);
      expect(step2.object, RunStepObjectObject.threadRunStep);
      expect(step2.createdAt, greaterThan(0));
      expect(step2.assistantId, isNotNull);
      expect(step2.threadId, threadId);
      expect(step2.runId, isNotNull);
      expect(step2.type, RunStepType.toolCalls);
      expect(step2.status, RunStepStatus.completed);
      final toolCalls =
          step2.stepDetails.mapOrNull(toolCalls: (final d) => d.toolCalls);
      expect(toolCalls, hasLength(1));
      final toolCall = toolCalls?.first;
      expect(toolCall?.id, isNotEmpty);
      expect(
        toolCall?.type,
        RunStepDetailsToolCallsCodeObjectType.codeInterpreter,
      );
      final codeInterpreter =
          toolCall?.mapOrNull(codeInterpreter: (final c) => c.codeInterpreter);
      expect(codeInterpreter?.input, isNotEmpty);
      expect(codeInterpreter?.outputs, hasLength(1));
      final output = codeInterpreter?.outputs.first;
      expect(
        output?.type,
        RunStepDetailsToolCallsCodeOutputLogsObjectType.logs,
      );
      final logs = output?.mapOrNull(logs: (final l) => l.logs);
      expect(double.tryParse(logs ?? ''), closeTo(1.0, 0.1));
      expect(step2.lastError, isNull);
      expect(step2.expiredAt, isNull);
      expect(step2.cancelledAt, isNull);
      expect(step2.failedAt, isNull);
      expect(step2.completedAt, greaterThan(0));
      expect(step2.metadata, isNull);
      expect(step2.usage?.totalTokens, greaterThan(0));
      expect(step2.usage?.completionTokens, greaterThan(0));
      expect(step2.usage?.promptTokens, greaterThan(0));

      final step3 = steps[0];
      expect(step3.id, isNotNull);
      expect(step3.object, RunStepObjectObject.threadRunStep);
      expect(step3.createdAt, greaterThan(0));
      expect(step3.assistantId, isNotNull);
      expect(step3.threadId, threadId);
      expect(step3.runId, isNotNull);
      expect(step3.type, RunStepType.messageCreation);
      expect(step3.status, RunStepStatus.completed);
      final details3 = step3.stepDetails
          .mapOrNull(messageCreation: (final d) => d.messageCreation);
      expect(details3?.messageId, isNotEmpty);
      expect(step3.lastError, isNull);
      expect(step3.expiredAt, isNull);
      expect(step3.cancelledAt, isNull);
      expect(step3.failedAt, isNull);
      expect(step3.completedAt, greaterThan(0));
      expect(step3.metadata, isNull);
      expect(step3.usage?.totalTokens, greaterThan(0));
      expect(step3.usage?.completionTokens, greaterThan(0));
      expect(step3.usage?.promptTokens, greaterThan(0));
    }

    Future<void> cleanUp(
      final String assistantId,
      final String threadId,
    ) async {
      await client.deleteThread(threadId: threadId);
      await client.deleteAssistant(assistantId: assistantId);
    }

    test('Test assistant', () async {
      final assistantId = await createAssistant();
      final threadId = await createThread();
      await addMessageToThread(threadId);
      await listMessagesInThread(threadId);
      final runId = await runAssistant(assistantId, threadId);
      await checkRunStatus(threadId, runId);
      await checkAssistantResponse(threadId);
      await checkThreadRunSteps(threadId, runId);
      await cleanUp(assistantId, threadId);
    });
  });
}
