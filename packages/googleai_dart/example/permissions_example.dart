// ignore_for_file: avoid_print

/// Demonstrates permission management for resources (tuned models, corpora).
library;

import 'package:googleai_dart/googleai_dart.dart';

void main() async {
  final client = GoogleAIClient(
    config: const GoogleAIConfig(
      authProvider: ApiKeyProvider('YOUR_API_KEY'),
    ),
  );

  try {
    print('=== Permission Management Example ===\n');

    // Note: This example assumes you have a tuned model or corpus already created.
    // Replace 'tunedModels/my-model-123' with your actual resource name.
    const resourceName = 'tunedModels/my-model-123';

    // 1. Grant reader permission to a user
    print('1. Granting reader permission to a user...');
    final readerPermission =
        await client.tunedModels.permissions(parent: resourceName).create(
              permission: const Permission(
                granteeType: GranteeType.user,
                emailAddress: 'reader@example.com',
                role: PermissionRole.reader,
              ),
            );
    print('   ✓ Permission created: ${readerPermission.name}');
    print('   Grantee: ${readerPermission.emailAddress}');
    print('   Role: ${readerPermission.role}\n');

    // 2. Grant writer permission to a group
    print('2. Granting writer permission to a group...');
    final writerPermission =
        await client.tunedModels.permissions(parent: resourceName).create(
              permission: const Permission(
                granteeType: GranteeType.group,
                emailAddress: 'editors@example.com',
                role: PermissionRole.writer,
              ),
            );
    print('   ✓ Permission created: ${writerPermission.name}');
    print('   Grantee: ${writerPermission.emailAddress}');
    print('   Role: ${writerPermission.role}\n');

    // 3. Grant public read access to everyone
    print('3. Granting public read access...');
    final everyonePermission =
        await client.tunedModels.permissions(parent: resourceName).create(
              permission: const Permission(
                granteeType: GranteeType.everyone,
                role: PermissionRole.reader,
              ),
            );
    print('   ✓ Public permission created: ${everyonePermission.name}');
    print('   Grantee: Everyone');
    print('   Role: ${everyonePermission.role}\n');

    // 4. List all permissions for the resource
    print('4. Listing all permissions...');
    final listResponse =
        await client.tunedModels.permissions(parent: resourceName).list(
              pageSize: 10,
            );
    print('   ✓ Found ${listResponse.permissions?.length ?? 0} permissions:');
    for (final perm in listResponse.permissions ?? const <Permission>[]) {
      final grantee = perm.granteeType == GranteeType.everyone
          ? 'Everyone'
          : perm.emailAddress ?? 'Unknown';
      print('     - ${perm.name}');
      print('       Grantee: $grantee (${perm.granteeType})');
      print('       Role: ${perm.role}');
    }
    if (listResponse.nextPageToken != null) {
      print('   More permissions available (use nextPageToken for pagination)');
    }
    print('');

    // 5. Get a specific permission
    print('5. Retrieving specific permission...');
    final retrievedPermission =
        await client.tunedModels.permissions(parent: resourceName).get(
              name: readerPermission.name!,
            );
    print('   ✓ Retrieved: ${retrievedPermission.name}');
    print('   Grantee: ${retrievedPermission.emailAddress}');
    print('   Role: ${retrievedPermission.role}\n');

    // 6. Update a permission (upgrade user from reader to writer)
    print('6. Upgrading user from reader to writer...');
    final updatedPermission =
        await client.tunedModels.permissions(parent: resourceName).update(
              name: readerPermission.name!,
              permission: const Permission(
                role: PermissionRole.writer,
              ),
            );
    print('   ✓ Permission updated');
    print('   New role: ${updatedPermission.role}\n');

    // 7. Revoke a permission
    print('7. Revoking group permission...');
    await client.tunedModels
        .permissions(parent: resourceName)
        .delete(name: writerPermission.name!);
    print('   ✓ Permission revoked: ${writerPermission.name}\n');

    // 8. Transfer ownership (requires owner permission)
    print('8. Transferring ownership...');
    try {
      final ownerPermission = await client.tunedModels
          .permissions(parent: resourceName)
          .transferOwnership(
            name: resourceName,
            emailAddress: 'newowner@example.com',
          );
      print('   ✓ Ownership transferred');
      print('   New owner: ${ownerPermission.emailAddress}');
      print('   Role: ${ownerPermission.role}\n');
    } catch (e) {
      print('   ⚠️  Transfer failed (requires owner permission): $e\n');
    }

    // 9. Clean up - Delete remaining permissions
    print('9. Cleaning up permissions...');
    try {
      await client.tunedModels
          .permissions(parent: resourceName)
          .delete(name: readerPermission.name!);
      print('   ✓ Deleted reader permission');
    } catch (e) {
      print('   Note: Reader permission already updated/deleted');
    }

    try {
      await client.tunedModels
          .permissions(parent: resourceName)
          .delete(name: everyonePermission.name!);
      print('   ✓ Deleted public permission');
    } catch (e) {
      print('   Note: Could not delete public permission: $e');
    }
    print('');

    print('=== Permission Roles Overview ===');
    print('• READER: Can use the resource for inference');
    print('• WRITER: Can use, update, and share the resource');
    print('• OWNER: Can use, update, share, and delete the resource');
    print('');

    print('=== Grantee Types ===');
    print('• USER: Individual user (requires email address)');
    print('• GROUP: Group of users (requires email address)');
    print('• EVERYONE: Public access (no email required)');
    print('');

    print('Example completed successfully!');
  } catch (e) {
    print('Error: $e');
    print('');
    print(
      'Note: This example requires an existing resource (tuned model or corpus).',
    );
    print(
      'Create a tuned model or corpus first, then update the resourceName.',
    );
  } finally {
    client.close();
  }
}
