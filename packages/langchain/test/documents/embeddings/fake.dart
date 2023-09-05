import 'package:langchain/langchain.dart';
import 'package:test/test.dart';

void main() async {
  group('FakeEmbeddings tests', () {
    test('embedQuery: should return an embedding with correct size', () async {
      final embeddings = FakeEmbeddings();
      final actual = await embeddings.embedQuery('test');
      expect(actual.length, equals(10));
    });

    test('Embeds a document with the same embedding vector for the same text',
        () async {
      final embeddings = FakeEmbeddings(size: 3);
      const document1 = Document(pageContent: 'This is a document.');
      const document2 = Document(pageContent: 'This is a document.');

      final embedding1 = (await embeddings.embedDocuments([document1])).first;
      final embedding2 = (await embeddings.embedDocuments([document2])).first;

      expect(embedding1[0], embedding2[0]);
      expect(embedding1[1], embedding2[1]);
      expect(embedding1[2], embedding2[2]);
    });

    test('Embeds a query with the same embedding vector for the same text',
        () async {
      final embeddings = FakeEmbeddings(size: 3);
      const query1 = 'This is a query.';
      const query2 = 'This is a query.';

      final embedding1 = await embeddings.embedQuery(query1);
      final embedding2 = await embeddings.embedQuery(query2);

      expect(embedding1[0], embedding2[0]);
      expect(embedding1[1], embedding2[1]);
      expect(embedding1[2], embedding2[2]);
    });

    test('Embeds a query with different embedding vector for different text',
        () async {
      final embeddings = FakeEmbeddings(size: 3);
      const query1 = 'This is a query.';
      const query2 = 'Totally different text.';

      final embedding1 = await embeddings.embedQuery(query1);
      final embedding2 = await embeddings.embedQuery(query2);

      expect(embedding1[0], isNot(embedding2[0]));
      expect(embedding1[1], isNot(embedding2[1]));
      expect(embedding1[2], isNot(embedding2[2]));
    });

    test('If deterministic is false, embeddings are different', () async {
      final embeddings = FakeEmbeddings(size: 3, deterministic: false);
      const document1 = Document(pageContent: 'This is a document.');
      const document2 = Document(pageContent: 'This is a document.');

      final embedding1 = (await embeddings.embedDocuments([document1])).first;
      final embedding2 = (await embeddings.embedDocuments([document2])).first;

      expect(embedding1[0], isNot(embedding2[0]));
      expect(embedding1[1], isNot(embedding2[1]));
      expect(embedding1[2], isNot(embedding2[2]));
    });
  });
}
