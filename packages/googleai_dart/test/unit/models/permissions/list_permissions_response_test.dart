// ignore_for_file: avoid_dynamic_calls

import 'package:googleai_dart/googleai_dart.dart';
import 'package:test/test.dart';

void main() {
  group('ListPermissionsResponse', () {
    group('fromJson', () {
      test('creates response with permissions and next page token', () {
        final json = {
          'permissions': [
            {
              'name': 'tunedModels/model1/permissions/perm1',
              'granteeType': 'USER',
              'emailAddress': 'user1@example.com',
              'role': 'OWNER',
            },
            {
              'name': 'tunedModels/model1/permissions/perm2',
              'granteeType': 'GROUP',
              'emailAddress': 'group@example.com',
              'role': 'WRITER',
            },
          ],
          'nextPageToken': 'token-abc-123',
        };

        final response = ListPermissionsResponse.fromJson(json);

        expect(response.permissions, hasLength(2));
        expect(
          response.permissions![0].name,
          'tunedModels/model1/permissions/perm1',
        );
        expect(response.permissions![0].granteeType, GranteeType.user);
        expect(
          response.permissions![1].name,
          'tunedModels/model1/permissions/perm2',
        );
        expect(response.permissions![1].role, PermissionRole.writer);
        expect(response.nextPageToken, 'token-abc-123');
      });

      test('creates response with empty permissions list', () {
        final json = {'permissions': <Map<String, dynamic>>[]};

        final response = ListPermissionsResponse.fromJson(json);

        expect(response.permissions, isEmpty);
        expect(response.nextPageToken, isNull);
      });

      test('creates response with no permissions field', () {
        final json = <String, dynamic>{};

        final response = ListPermissionsResponse.fromJson(json);

        expect(response.permissions, isNull);
        expect(response.nextPageToken, isNull);
      });

      test('creates response without next page token', () {
        final json = {
          'permissions': [
            {
              'name': 'corpora/corpus1/permissions/perm1',
              'granteeType': 'EVERYONE',
              'role': 'READER',
            },
          ],
        };

        final response = ListPermissionsResponse.fromJson(json);

        expect(response.permissions, hasLength(1));
        expect(response.nextPageToken, isNull);
      });
    });

    group('toJson', () {
      test('converts response with all fields to JSON', () {
        const response = ListPermissionsResponse(
          permissions: [
            Permission(
              name: 'tunedModels/test/permissions/p1',
              granteeType: GranteeType.user,
              emailAddress: 'test@example.com',
              role: PermissionRole.reader,
            ),
          ],
          nextPageToken: 'next-page-token',
        );

        final json = response.toJson();

        expect(json['permissions'], hasLength(1));
        expect(
          json['permissions'][0]['name'],
          'tunedModels/test/permissions/p1',
        );
        expect(json['nextPageToken'], 'next-page-token');
      });

      test('converts response with minimal fields to JSON', () {
        const response = ListPermissionsResponse();

        final json = response.toJson();

        expect(json.containsKey('permissions'), false);
        expect(json.containsKey('nextPageToken'), false);
      });

      test('omits null fields from JSON', () {
        const response = ListPermissionsResponse(
          permissions: [
            Permission(name: 'test/permissions/1', role: PermissionRole.owner),
          ],
        );

        final json = response.toJson();

        expect(json.containsKey('permissions'), true);
        expect(json.containsKey('nextPageToken'), false);
      });
    });

    group('equality', () {
      test('equal responses have same hash code', () {
        const resp1 = ListPermissionsResponse(
          permissions: [
            Permission(name: 'test/p1', role: PermissionRole.reader),
          ],
          nextPageToken: 'token123',
        );
        const resp2 = ListPermissionsResponse(
          permissions: [
            Permission(name: 'test/p1', role: PermissionRole.reader),
          ],
          nextPageToken: 'token123',
        );

        expect(resp1, equals(resp2));
        expect(resp1.hashCode, equals(resp2.hashCode));
      });
    });
  });
}
