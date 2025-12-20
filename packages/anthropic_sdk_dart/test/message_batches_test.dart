import 'package:anthropic_sdk_dart/anthropic_sdk_dart.dart';
import 'package:test/test.dart';

void main() {
  group('ListMessageBatchesResponse tests', () {
    test('deserializes with all fields', () {
      final json = {
        'data': [
          {
            'id': 'batch_123',
            'created_at': '2024-01-15T10:00:00Z',
            'expires_at': '2024-01-16T10:00:00Z',
            'processing_status': 'in_progress',
            'request_counts': {
              'processing': 5,
              'succeeded': 10,
              'errored': 1,
              'canceled': 0,
              'expired': 0,
            },
            'results_url': 'https://example.com/results.jsonl',
            'type': 'message_batch',
          },
        ],
        'has_more': true,
        'first_id': 'batch_123',
        'last_id': 'batch_123',
      };
      final response = ListMessageBatchesResponse.fromJson(json);
      expect(response.data, hasLength(1));
      expect(response.data.first.id, 'batch_123');
      expect(
        response.data.first.processingStatus,
        MessageBatchProcessingStatus.inProgress,
      );
      expect(response.data.first.requestCounts.processing, 5);
      expect(response.data.first.requestCounts.succeeded, 10);
      expect(
        response.data.first.resultsUrl,
        'https://example.com/results.jsonl',
      );
      expect(response.hasMore, isTrue);
      expect(response.firstId, 'batch_123');
      expect(response.lastId, 'batch_123');
    });

    test('deserializes with required fields only', () {
      final json = {'data': <Map<String, dynamic>>[], 'has_more': false};
      final response = ListMessageBatchesResponse.fromJson(json);
      expect(response.data, isEmpty);
      expect(response.hasMore, isFalse);
      expect(response.firstId, isNull);
      expect(response.lastId, isNull);
    });

    test('deserializes with multiple batches', () {
      final json = {
        'data': [
          {
            'id': 'batch_001',
            'created_at': '2024-01-15T10:00:00Z',
            'expires_at': '2024-01-16T10:00:00Z',
            'processing_status': 'ended',
            'request_counts': {
              'processing': 0,
              'succeeded': 100,
              'errored': 0,
              'canceled': 0,
              'expired': 0,
            },
            'type': 'message_batch',
          },
          {
            'id': 'batch_002',
            'created_at': '2024-01-15T11:00:00Z',
            'expires_at': '2024-01-16T11:00:00Z',
            'processing_status': 'canceling',
            'request_counts': {
              'processing': 50,
              'succeeded': 30,
              'errored': 5,
              'canceled': 10,
              'expired': 5,
            },
            'type': 'message_batch',
          },
        ],
        'has_more': true,
        'first_id': 'batch_001',
        'last_id': 'batch_002',
      };
      final response = ListMessageBatchesResponse.fromJson(json);
      expect(response.data, hasLength(2));
      expect(response.data[0].id, 'batch_001');
      expect(
        response.data[0].processingStatus,
        MessageBatchProcessingStatus.ended,
      );
      expect(response.data[1].id, 'batch_002');
      expect(
        response.data[1].processingStatus,
        MessageBatchProcessingStatus.canceling,
      );
      expect(response.firstId, 'batch_001');
      expect(response.lastId, 'batch_002');
    });

    test('serializes correctly', () {
      final response = ListMessageBatchesResponse(
        data: const [
          MessageBatch(
            id: 'batch_abc',
            createdAt: '2024-01-15T10:00:00Z',
            expiresAt: '2024-01-16T10:00:00Z',
            processingStatus: MessageBatchProcessingStatus.inProgress,
            requestCounts: MessageBatchRequestCounts(
              processing: 5,
              succeeded: 0,
              errored: 0,
              canceled: 0,
              expired: 0,
            ),
            type: MessageBatchType.messageBatch,
          ),
        ],
        hasMore: false,
        firstId: 'batch_abc',
        lastId: 'batch_abc',
      );
      final json = response.toJson();
      expect(json['data'], hasLength(1));
      expect((json['data'] as List).first['id'], 'batch_abc');
      expect(json['has_more'], false);
      expect(json['first_id'], 'batch_abc');
      expect(json['last_id'], 'batch_abc');
    });

    test('serializes with null optional fields excluded', () {
      final response = ListMessageBatchesResponse(
        data: const [],
        hasMore: false,
      );
      final json = response.toJson();
      expect(json.containsKey('first_id'), isFalse);
      expect(json.containsKey('last_id'), isFalse);
    });

    test('round-trip serialization works', () {
      final original = ListMessageBatchesResponse(
        data: const [
          MessageBatch(
            id: 'batch_xyz',
            createdAt: '2024-01-15T10:00:00Z',
            expiresAt: '2024-01-16T10:00:00Z',
            processingStatus: MessageBatchProcessingStatus.ended,
            requestCounts: MessageBatchRequestCounts(
              processing: 0,
              succeeded: 50,
              errored: 5,
              canceled: 2,
              expired: 3,
            ),
            resultsUrl: 'https://example.com/results.jsonl',
            type: MessageBatchType.messageBatch,
          ),
        ],
        hasMore: true,
        firstId: 'batch_xyz',
        lastId: 'batch_xyz',
      );
      final json = original.toJson();
      final restored = ListMessageBatchesResponse.fromJson(json);
      expect(restored.data, hasLength(1));
      expect(restored.data.first.id, original.data.first.id);
      expect(
        restored.data.first.processingStatus,
        original.data.first.processingStatus,
      );
      expect(
        restored.data.first.requestCounts.succeeded,
        original.data.first.requestCounts.succeeded,
      );
      expect(restored.hasMore, original.hasMore);
      expect(restored.firstId, original.firstId);
      expect(restored.lastId, original.lastId);
    });
  });

  group('MessageBatchProcessingStatus tests', () {
    test('has correct number of values', () {
      expect(MessageBatchProcessingStatus.values, hasLength(3));
    });

    test('all values are present', () {
      expect(
        MessageBatchProcessingStatus.values,
        containsAll([
          MessageBatchProcessingStatus.inProgress,
          MessageBatchProcessingStatus.canceling,
          MessageBatchProcessingStatus.ended,
        ]),
      );
    });
  });

  group('DeleteMessageBatchResponse tests', () {
    test('deserializes correctly', () {
      final json = {'id': 'batch_abc123', 'type': 'message_batch_deleted'};
      final response = DeleteMessageBatchResponse.fromJson(json);
      expect(response.id, 'batch_abc123');
      expect(response.type, DeleteMessageBatchResponseType.messageBatchDeleted);
    });

    test('serializes correctly', () {
      const response = DeleteMessageBatchResponse(
        id: 'batch_xyz789',
        type: DeleteMessageBatchResponseType.messageBatchDeleted,
      );
      final json = response.toJson();
      expect(json['id'], 'batch_xyz789');
      expect(json['type'], 'message_batch_deleted');
    });

    test('round-trip serialization works', () {
      const original = DeleteMessageBatchResponse(
        id: 'batch_roundtrip',
        type: DeleteMessageBatchResponseType.messageBatchDeleted,
      );
      final json = original.toJson();
      final restored = DeleteMessageBatchResponse.fromJson(json);
      expect(restored.id, original.id);
      expect(restored.type, original.type);
    });

    test('DeleteMessageBatchResponseType enum has correct value', () {
      expect(DeleteMessageBatchResponseType.values, hasLength(1));
      expect(
        DeleteMessageBatchResponseType.values,
        contains(DeleteMessageBatchResponseType.messageBatchDeleted),
      );
    });
  });
}
