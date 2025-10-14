import 'package:googleai_dart/src/models/permissions/grantee_type.dart';
import 'package:test/test.dart';

void main() {
  group('GranteeType', () {
    test('granteeTypeFromString converts all types correctly', () {
      expect(granteeTypeFromString('USER'), GranteeType.user);
      expect(granteeTypeFromString('GROUP'), GranteeType.group);
      expect(granteeTypeFromString('EVERYONE'), GranteeType.everyone);
      expect(
        granteeTypeFromString('GRANTEE_TYPE_UNSPECIFIED'),
        GranteeType.unspecified,
      );
      expect(granteeTypeFromString('UNKNOWN'), GranteeType.unspecified);
      expect(granteeTypeFromString(null), GranteeType.unspecified);
    });

    test('granteeTypeToString converts all types correctly', () {
      expect(granteeTypeToString(GranteeType.user), 'USER');
      expect(granteeTypeToString(GranteeType.group), 'GROUP');
      expect(granteeTypeToString(GranteeType.everyone), 'EVERYONE');
      expect(
        granteeTypeToString(GranteeType.unspecified),
        'GRANTEE_TYPE_UNSPECIFIED',
      );
    });

    test('type conversion is case-insensitive', () {
      expect(granteeTypeFromString('user'), GranteeType.user);
      expect(granteeTypeFromString('Group'), GranteeType.group);
      expect(granteeTypeFromString('EVERYONE'), GranteeType.everyone);
    });
  });
}
