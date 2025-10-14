import 'package:googleai_dart/src/models/permissions/permission_role.dart';
import 'package:test/test.dart';

void main() {
  group('PermissionRole', () {
    test('permissionRoleFromString converts all roles correctly', () {
      expect(permissionRoleFromString('OWNER'), PermissionRole.owner);
      expect(permissionRoleFromString('WRITER'), PermissionRole.writer);
      expect(permissionRoleFromString('READER'), PermissionRole.reader);
      expect(
        permissionRoleFromString('ROLE_UNSPECIFIED'),
        PermissionRole.unspecified,
      );
      expect(permissionRoleFromString('UNKNOWN'), PermissionRole.unspecified);
      expect(permissionRoleFromString(null), PermissionRole.unspecified);
    });

    test('permissionRoleToString converts all roles correctly', () {
      expect(permissionRoleToString(PermissionRole.owner), 'OWNER');
      expect(permissionRoleToString(PermissionRole.writer), 'WRITER');
      expect(permissionRoleToString(PermissionRole.reader), 'READER');
      expect(
        permissionRoleToString(PermissionRole.unspecified),
        'ROLE_UNSPECIFIED',
      );
    });

    test('role conversion is case-insensitive', () {
      expect(permissionRoleFromString('owner'), PermissionRole.owner);
      expect(permissionRoleFromString('Writer'), PermissionRole.writer);
      expect(permissionRoleFromString('READER'), PermissionRole.reader);
    });
  });
}
