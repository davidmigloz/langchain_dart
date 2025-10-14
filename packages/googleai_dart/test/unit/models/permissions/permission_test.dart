import 'package:googleai_dart/googleai_dart.dart';
import 'package:test/test.dart';

void main() {
  group('Permission', () {
    group('fromJson', () {
      test('creates Permission with all fields', () {
        final json = {
          'name': 'tunedModels/my-model/permissions/permission-123',
          'granteeType': 'USER',
          'emailAddress': 'user@example.com',
          'role': 'WRITER',
        };

        final permission = Permission.fromJson(json);

        expect(
          permission.name,
          'tunedModels/my-model/permissions/permission-123',
        );
        expect(permission.granteeType, GranteeType.user);
        expect(permission.emailAddress, 'user@example.com');
        expect(permission.role, PermissionRole.writer);
      });

      test('creates Permission with minimal fields', () {
        final json = <String, dynamic>{};

        final permission = Permission.fromJson(json);

        expect(permission.name, isNull);
        expect(permission.granteeType, isNull);
        expect(permission.emailAddress, isNull);
        expect(permission.role, isNull);
      });

      test('creates Permission with null fields', () {
        final json = {
          'name': null,
          'granteeType': null,
          'emailAddress': null,
          'role': null,
        };

        final permission = Permission.fromJson(json);

        expect(permission.name, isNull);
        expect(permission.granteeType, isNull);
        expect(permission.emailAddress, isNull);
        expect(permission.role, isNull);
      });

      test('parses grantee type correctly', () {
        expect(
          Permission.fromJson({'granteeType': 'USER'}).granteeType,
          GranteeType.user,
        );
        expect(
          Permission.fromJson({'granteeType': 'GROUP'}).granteeType,
          GranteeType.group,
        );
        expect(
          Permission.fromJson({'granteeType': 'EVERYONE'}).granteeType,
          GranteeType.everyone,
        );
      });

      test('parses role correctly', () {
        expect(
          Permission.fromJson({'role': 'OWNER'}).role,
          PermissionRole.owner,
        );
        expect(
          Permission.fromJson({'role': 'WRITER'}).role,
          PermissionRole.writer,
        );
        expect(
          Permission.fromJson({'role': 'READER'}).role,
          PermissionRole.reader,
        );
      });

      test('handles permission for everyone without email', () {
        final json = {
          'name': 'corpora/my-corpus/permissions/permission-456',
          'granteeType': 'EVERYONE',
          'role': 'READER',
        };

        final permission = Permission.fromJson(json);

        expect(permission.granteeType, GranteeType.everyone);
        expect(permission.emailAddress, isNull);
        expect(permission.role, PermissionRole.reader);
      });
    });

    group('toJson', () {
      test('converts Permission with all fields to JSON', () {
        const permission = Permission(
          name: 'tunedModels/my-model/permissions/permission-789',
          granteeType: GranteeType.group,
          emailAddress: 'group@example.com',
          role: PermissionRole.owner,
        );

        final json = permission.toJson();

        expect(json['name'], 'tunedModels/my-model/permissions/permission-789');
        expect(json['granteeType'], 'GROUP');
        expect(json['emailAddress'], 'group@example.com');
        expect(json['role'], 'OWNER');
      });

      test('converts Permission with minimal fields to JSON', () {
        const permission = Permission();

        final json = permission.toJson();

        expect(json.containsKey('name'), false);
        expect(json.containsKey('granteeType'), false);
        expect(json.containsKey('emailAddress'), false);
        expect(json.containsKey('role'), false);
      });

      test('omits null fields from JSON', () {
        const permission = Permission(
          name: 'corpora/my-corpus/permissions/permission-111',
          granteeType: GranteeType.everyone,
          role: PermissionRole.reader,
          // emailAddress intentionally omitted for EVERYONE
        );

        final json = permission.toJson();

        expect(json['name'], 'corpora/my-corpus/permissions/permission-111');
        expect(json['granteeType'], 'EVERYONE');
        expect(json.containsKey('emailAddress'), false);
        expect(json['role'], 'READER');
      });
    });

    group('roundtrip', () {
      test('fromJson -> toJson preserves data', () {
        final original = {
          'name': 'tunedModels/test/permissions/perm-001',
          'granteeType': 'USER',
          'emailAddress': 'test@example.com',
          'role': 'WRITER',
        };

        final permission = Permission.fromJson(original);
        final json = permission.toJson();

        expect(json['name'], original['name']);
        expect(json['granteeType'], original['granteeType']);
        expect(json['emailAddress'], original['emailAddress']);
        expect(json['role'], original['role']);
      });
    });

    group('equality', () {
      test('equal permissions have same hash code', () {
        const perm1 = Permission(
          name: 'test/permissions/1',
          granteeType: GranteeType.user,
          emailAddress: 'user@test.com',
          role: PermissionRole.reader,
        );
        const perm2 = Permission(
          name: 'test/permissions/1',
          granteeType: GranteeType.user,
          emailAddress: 'user@test.com',
          role: PermissionRole.reader,
        );

        expect(perm1, equals(perm2));
        expect(perm1.hashCode, equals(perm2.hashCode));
      });

      test('different permissions are not equal', () {
        const perm1 = Permission(
          name: 'test/permissions/1',
          role: PermissionRole.reader,
        );
        const perm2 = Permission(
          name: 'test/permissions/2',
          role: PermissionRole.writer,
        );

        expect(perm1, isNot(equals(perm2)));
      });
    });
  });
}
