// ignore_for_file: avoid_dynamic_calls

import 'package:googleai_dart/src/models/prediction/media.dart';
import 'package:test/test.dart';

void main() {
  group('Media', () {
    test('fromJson creates media with video', () {
      final json = {
        'video': {'uri': 'gs://bucket/video.mp4'},
      };

      final media = Media.fromJson(json);

      expect(media.video, isNotNull);
      expect(media.video!.uri, 'gs://bucket/video.mp4');
    });

    test('fromJson creates media without video', () {
      final json = <String, dynamic>{};

      final media = Media.fromJson(json);

      expect(media.video, isNull);
    });

    test('toJson serializes media with video', () {
      const media = Media(video: Video(uri: 'gs://test.mp4'));

      final json = media.toJson();

      expect(json['video'], isNotNull);
      expect(json['video']['uri'], 'gs://test.mp4');
    });

    test('toJson omits null video', () {
      const media = Media();

      final json = media.toJson();

      expect(json.containsKey('video'), isFalse);
    });

    test('copyWith creates new instance', () {
      const original = Media(video: Video(uri: 'original.mp4'));

      final updated = original.copyWith(video: const Video(uri: 'updated.mp4'));

      expect(updated.video!.uri, 'updated.mp4');
      expect(original.video!.uri, 'original.mp4');
    });
  });

  group('Video', () {
    test('fromJson creates video with uri', () {
      final json = {'uri': 'gs://bucket/video.mp4'};

      final video = Video.fromJson(json);

      expect(video.uri, 'gs://bucket/video.mp4');
      expect(video.video, isNull);
    });

    test('fromJson creates video with base64 data', () {
      final json = {'video': 'base64EncodedVideoData=='};

      final video = Video.fromJson(json);

      expect(video.video, 'base64EncodedVideoData==');
      expect(video.uri, isNull);
    });

    test('fromJson creates video with both fields', () {
      final json = {'video': 'base64Data', 'uri': 'gs://backup.mp4'};

      final video = Video.fromJson(json);

      expect(video.video, 'base64Data');
      expect(video.uri, 'gs://backup.mp4');
    });

    test('toJson serializes video with uri', () {
      const video = Video(uri: 'gs://test.mp4');

      final json = video.toJson();

      expect(json['uri'], 'gs://test.mp4');
      expect(json.containsKey('video'), isFalse);
    });

    test('toJson serializes video with base64 data', () {
      const video = Video(video: 'base64Data==');

      final json = video.toJson();

      expect(json['video'], 'base64Data==');
      expect(json.containsKey('uri'), isFalse);
    });

    test('toJson omits null fields', () {
      const video = Video();

      final json = video.toJson();

      expect(json.containsKey('video'), isFalse);
      expect(json.containsKey('uri'), isFalse);
    });

    test('copyWith creates new instance with replaced values', () {
      const original = Video(uri: 'original.mp4', video: 'originalData');

      final updated = original.copyWith(uri: 'updated.mp4');

      expect(updated.uri, 'updated.mp4');
      expect(updated.video, 'originalData');
      expect(original.uri, 'original.mp4');
    });

    test('round-trip serialization preserves data', () {
      final original = {
        'video': 'base64VideoContent',
        'uri': 'gs://storage/path.mp4',
      };

      final video = Video.fromJson(original);
      final serialized = video.toJson();

      expect(serialized['video'], original['video']);
      expect(serialized['uri'], original['uri']);
    });
  });
}
