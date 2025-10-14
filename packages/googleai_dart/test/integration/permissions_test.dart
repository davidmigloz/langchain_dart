// ignore_for_file: avoid_print

import 'dart:io';
import 'package:googleai_dart/googleai_dart.dart';
import 'package:test/test.dart';

/// Integration tests for permissions API.
///
/// These tests require a real API key set in the GEMINI_API_KEY
/// environment variable. If the key is not present, all tests are skipped.
///
/// Note: These tests use tuned models as the parent resource for permissions.
/// Creating/testing permissions requires appropriate access rights.
void main() {
  String? apiKey;
  GoogleAIClient? client;

  setUpAll(() {
    apiKey = Platform.environment['GEMINI_API_KEY'];
    if (apiKey == null || apiKey!.isEmpty) {
      print(
        '⚠️  GEMINI_API_KEY not set. Integration tests will be skipped.\n'
        '   To run these tests, export GEMINI_API_KEY=your_api_key',
      );
    } else {
      client = GoogleAIClient(
        config: GoogleAIConfig(
          authProvider: ApiKeyProvider(apiKey!),
        ),
      );
    }
  });

  tearDownAll(() {
    client?.close();
  });

  group('Permissions API - Integration', () {
    test('creates and retrieves a permission', () {
      if (apiKey == null) {
        markTestSkipped('API key not available');
        return;
      }

      // Note: This test requires a tuned model to exist and appropriate permissions
      // In a real scenario, you would create a tuned model first or use an existing one

      // For demo purposes, we'll skip if we don't have a tuned model
      // This is a placeholder test structure
      try {
        // Example: Create a permission for a hypothetical tuned model
        // const permission = Permission(
        //   granteeType: GranteeType.user,
        //   emailAddress: 'test@example.com',
        //   role: PermissionRole.reader,
        // );
        //
        // final created = await client!.createPermission(
        //   parent: 'tunedModels/my-model',
        //   permission: permission,
        // );
        //
        // expect(created.name, isNotNull);
        // expect(created.granteeType, GranteeType.user);
        // expect(created.role, PermissionRole.reader);

        // Skip this test as it requires pre-existing resources
        markTestSkipped('Requires existing tuned model or corpus');
      } catch (e) {
        // Expected if we don't have appropriate resources
        markTestSkipped('Requires existing resources: $e');
      }
    });

    test('lists permissions for a resource', () {
      if (apiKey == null) {
        markTestSkipped('API key not available');
        return;
      }

      try {
        // Example: List permissions for a resource
        // final response = await client!.listPermissions(
        //   parent: 'tunedModels/my-model',
        //   pageSize: 10,
        // );
        //
        // expect(response, isNotNull);
        // expect(response.permissions, isNotNull);

        markTestSkipped('Requires existing tuned model or corpus');
      } catch (e) {
        markTestSkipped('Requires existing resources: $e');
      }
    });

    test('gets a specific permission', () {
      if (apiKey == null) {
        markTestSkipped('API key not available');
        return;
      }

      try {
        // Example: Get a specific permission
        // final permission = await client!.getPermission(
        //   name: 'tunedModels/my-model/permissions/permission-id',
        // );
        //
        // expect(permission, isNotNull);
        // expect(permission.name, isNotNull);

        markTestSkipped('Requires existing permission');
      } catch (e) {
        markTestSkipped('Requires existing resources: $e');
      }
    });

    test('updates a permission', () {
      if (apiKey == null) {
        markTestSkipped('API key not available');
        return;
      }

      try {
        // Example: Update a permission
        // const updated = Permission(
        //   role: PermissionRole.writer,
        // );
        //
        // final result = await client!.updatePermission(
        //   name: 'tunedModels/my-model/permissions/permission-id',
        //   permission: updated,
        // );
        //
        // expect(result.role, PermissionRole.writer);

        markTestSkipped('Requires existing permission');
      } catch (e) {
        markTestSkipped('Requires existing resources: $e');
      }
    });

    test('deletes a permission', () {
      if (apiKey == null) {
        markTestSkipped('API key not available');
        return;
      }

      try {
        // Example: Delete a permission
        // await client!.deletePermission(
        //   name: 'tunedModels/my-model/permissions/permission-id',
        // );

        markTestSkipped('Requires existing permission');
      } catch (e) {
        markTestSkipped('Requires existing resources: $e');
      }
    });

    test('transfers ownership of a resource', () {
      if (apiKey == null) {
        markTestSkipped('API key not available');
        return;
      }

      try {
        // Example: Transfer ownership
        // final result = await client!.transferOwnership(
        //   name: 'tunedModels/my-model',
        //   emailAddress: 'newowner@example.com',
        // );
        //
        // expect(result, isNotNull);
        // expect(result.role, PermissionRole.owner);

        markTestSkipped(
          'Requires existing resource and appropriate permissions',
        );
      } catch (e) {
        markTestSkipped('Requires existing resources: $e');
      }
    });

    // Comprehensive workflow test (commented out - requires setup)
    test('complete permission management workflow', () {
      if (apiKey == null) {
        markTestSkipped('API key not available');
        return;
      }

      // This test demonstrates a complete workflow:
      // 1. Create a resource (tuned model or corpus)
      // 2. Grant permissions to users/groups
      // 3. List permissions
      // 4. Update permissions
      // 5. Revoke permissions
      // 6. Clean up

      markTestSkipped('Requires resource creation and appropriate permissions');

      // Example workflow:
      // 1. Create a tuned model or corpus first
      // 2. Grant reader permission to a user
      // const readerPermission = Permission(
      //   granteeType: GranteeType.user,
      //   emailAddress: 'reader@example.com',
      //   role: PermissionRole.reader,
      // );
      // final created = await client!.createPermission(
      //   parent: 'tunedModels/test-model',
      //   permission: readerPermission,
      // );
      //
      // 3. Grant everyone read access
      // const everyonePermission = Permission(
      //   granteeType: GranteeType.everyone,
      //   role: PermissionRole.reader,
      // );
      // await client!.createPermission(
      //   parent: 'tunedModels/test-model',
      //   permission: everyonePermission,
      // );
      //
      // 4. List all permissions
      // final listResponse = await client!.listPermissions(
      //   parent: 'tunedModels/test-model',
      // );
      // expect(listResponse.permissions, hasLength(greaterThanOrEqualTo(2)));
      //
      // 5. Upgrade user to writer
      // const writerPermission = Permission(
      //   role: PermissionRole.writer,
      // );
      // await client!.updatePermission(
      //   name: created.name!,
      //   permission: writerPermission,
      // );
      //
      // 6. Revoke permission
      // await client!.deletePermission(name: created.name!);
      //
      // 7. Transfer ownership
      // await client!.transferOwnership(
      //   name: 'tunedModels/test-model',
      //   emailAddress: 'newowner@example.com',
      // );
    });
  });
}
