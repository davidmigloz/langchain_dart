import 'package:langchain/langchain.dart';
import 'package:test/test.dart';

void main() {
  group('SummarizeChain tests', () {
    test('Test SummarizeChain.stuff', () async {
      final llm = FakeHandlerLLM(
        handler: (final prompt, final options, final callCount) {
          switch (callCount) {
            case 1:
              expect(
                prompt,
                'Write a concise summary of the following:\n\n\n"Hello 1!\n\nHello 2!"\n\n\nCONCISE SUMMARY:',
              );
              return 'Hello 12!';
            default:
              throw TestFailure('Unexpected call count: $callCount');
          }
        },
      );

      final stuffSummarizeChain = SummarizeChain.stuff(llm: llm);

      const docs = [
        Document(pageContent: 'Hello 1!'),
        Document(pageContent: 'Hello 2!'),
      ];
      final res = await stuffSummarizeChain.call({
        SummarizeChain.defaultInputKey: docs,
      });

      expect(res[SummarizeChain.defaultOutputKey], 'Hello 12!');
    });

    test('Test SummarizeChain.mapReduce', () async {
      final llm = FakeHandlerLLM(
        handler: (final prompt, final options, final callCount) {
          switch (callCount) {
            case 1:
              expect(
                prompt,
                'Write a concise summary of the following:\n\n\n"Hello 1!"\n\n\nCONCISE SUMMARY:',
              );
              return '1';
            case 2:
              expect(
                prompt,
                'Write a concise summary of the following:\n\n\n"Hello 2!"\n\n\nCONCISE SUMMARY:',
              );
              return '2';
            case 3:
              expect(
                prompt,
                'Write a concise summary of the following:\n\n\n"Hello 3!"\n\n\nCONCISE SUMMARY:',
              );
              return '3';
            case 4:
              expect(
                prompt,
                'Write a concise summary of the following:\n\n\n"1\n\n2\n\n3"\n\n\nCONCISE SUMMARY:',
              );
              return 'Hello 123!';
            default:
              throw TestFailure('Unexpected call count: $callCount');
          }
        },
      );

      final mapReduceSummarizeChain = SummarizeChain.mapReduce(llm: llm);

      const docs = [
        Document(pageContent: 'Hello 1!'),
        Document(pageContent: 'Hello 2!'),
        Document(pageContent: 'Hello 3!'),
      ];
      final res = await mapReduceSummarizeChain.call({
        SummarizeChain.defaultInputKey: docs,
      });

      expect(res[SummarizeChain.defaultOutputKey], 'Hello 123!');
    });
  });
}
