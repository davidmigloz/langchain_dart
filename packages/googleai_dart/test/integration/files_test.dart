// ignore_for_file: avoid_print

import 'dart:io' as io;
import 'package:googleai_dart/googleai_dart.dart';
import 'package:test/test.dart';

/// Integration tests for file operations.
///
/// These tests require a real API key set in the GEMINI_API_KEY
/// environment variable. If the key is not present, all tests are skipped.
void main() {
  String? apiKey;
  GoogleAIClient? client;
  String? uploadedFileName;

  setUpAll(() {
    apiKey = io.Platform.environment['GEMINI_API_KEY'];
    if (apiKey == null || apiKey!.isEmpty) {
      print(
        '⚠️  GEMINI_API_KEY not set. Integration tests will be skipped.\n'
        '   To run these tests, export GEMINI_API_KEY=your_api_key',
      );
    } else {
      client = GoogleAIClient(
        config: GoogleAIConfig(authProvider: ApiKeyProvider(apiKey!)),
      );
    }
  });

  tearDownAll(() async {
    // Clean up: delete the uploaded file
    if (uploadedFileName != null && client != null) {
      try {
        await client!.files.delete(name: uploadedFileName!);
        print('✅ Cleaned up uploaded file: $uploadedFileName');
      } catch (e) {
        print('⚠️  Failed to clean up file: $e');
      }
    }
    client?.close();
  });

  group('File Operations - Integration', () {
    test('uploads a file using filePath', () async {
      if (apiKey == null) {
        markTestSkipped('API key not available');
        return;
      }

      // Create a temporary test file
      final tempDir = io.Directory.systemTemp;
      final testFile = io.File('${tempDir.path}/test_image.txt')
        ..writeAsStringSync('This is a test file for Google AI API');

      try {
        final file = await client!.files.upload(
          filePath: testFile.path,
          mimeType: 'text/plain',
          displayName: 'Test File',
        );

        // Store for cleanup
        uploadedFileName = file.name;

        expect(file, isNotNull);
        expect(file.name, isNotEmpty);
        expect(file.displayName, equals('Test File'));
        expect(file.mimeType, equals('text/plain'));
        expect(file.state, isNotNull);
        expect(file.uri, isNotEmpty);
        expect(file.createTime, isNotNull);
        expect(file.updateTime, isNotNull);
        expect(file.expirationTime, isNotNull);

        print('✅ Uploaded file using filePath: ${file.name}');
        print('   Display Name: ${file.displayName}');
        print('   MIME Type: ${file.mimeType}');
        print('   State: ${file.state}');
        print('   Size: ${file.sizeBytes} bytes');
      } finally {
        // Clean up test file
        if (testFile.existsSync()) {
          testFile.deleteSync();
        }
      }
    });

    test('uploads a file using bytes', () async {
      if (apiKey == null) {
        markTestSkipped('API key not available');
        return;
      }

      // Clean up previous file first
      if (uploadedFileName != null) {
        try {
          await client!.files.delete(name: uploadedFileName!);
        } catch (_) {
          // Ignore errors
        }
      }

      // Create a temporary test file and read as bytes
      final tempDir = io.Directory.systemTemp;
      final testFile = io.File('${tempDir.path}/test_image_bytes.txt')
        ..writeAsStringSync('This is a test file uploaded as bytes');

      try {
        final bytes = testFile.readAsBytesSync();

        final file = await client!.files.upload(
          bytes: bytes,
          fileName: 'test_image_bytes.txt',
          mimeType: 'text/plain',
          displayName: 'Test File (Bytes)',
        );

        // Store for cleanup
        uploadedFileName = file.name;

        expect(file, isNotNull);
        expect(file.name, isNotEmpty);
        expect(file.displayName, equals('Test File (Bytes)'));
        expect(file.mimeType, equals('text/plain'));
        expect(file.state, isNotNull);
        expect(file.uri, isNotEmpty);
        expect(file.createTime, isNotNull);
        expect(file.updateTime, isNotNull);
        expect(file.expirationTime, isNotNull);

        print('✅ Uploaded file using bytes: ${file.name}');
        print('   Display Name: ${file.displayName}');
        print('   MIME Type: ${file.mimeType}');
        print('   State: ${file.state}');
        print('   Size: ${file.sizeBytes} bytes');
      } finally {
        // Clean up test file
        if (testFile.existsSync()) {
          testFile.deleteSync();
        }
      }
    });

    test('lists files', () async {
      if (apiKey == null || uploadedFileName == null) {
        markTestSkipped('API key or uploaded file not available');
        return;
      }

      final response = await client!.files.list(pageSize: 10);

      expect(response, isNotNull);
      expect(response.files, isNotNull);
      expect(response.files, isNotEmpty);

      // Verify our uploaded file is in the list
      final ourFile = response.files.firstWhere(
        (f) => f.name == uploadedFileName,
        orElse: () => throw Exception('Uploaded file not found in list'),
      );

      expect(ourFile, isNotNull);
      print('✅ Listed ${response.files.length} files');
      print('   Found our file: ${ourFile.name}');
    });

    test('gets file metadata', () async {
      if (apiKey == null || uploadedFileName == null) {
        markTestSkipped('API key or uploaded file not available');
        return;
      }

      final file = await client!.files.get(name: uploadedFileName!);

      expect(file, isNotNull);
      expect(file.name, equals(uploadedFileName));
      expect(file.displayName, equals('Test File (Bytes)'));
      expect(file.mimeType, equals('text/plain'));
      expect(file.state, isNotNull);
      expect(file.uri, isNotEmpty);

      print('✅ Retrieved file metadata: ${file.name}');
      print('   State: ${file.state}');
      print('   Created: ${file.createTime}');
      print('   Updated: ${file.updateTime}');
      print('   Expires: ${file.expirationTime}');

      // Check for new fields
      if (file.downloadUri != null) {
        print('   Download URI: ${file.downloadUri}');
      }
      if (file.source != null) {
        print('   Source: ${file.source}');
      }
    });

    test('deletes file', () async {
      if (apiKey == null || uploadedFileName == null) {
        markTestSkipped('API key or uploaded file not available');
        return;
      }

      // Delete the file
      await client!.files.delete(name: uploadedFileName!);
      print('✅ Deleted file: $uploadedFileName');

      // Try to get the file - should fail
      try {
        await client!.files.get(name: uploadedFileName!);
        fail('Expected file to be deleted');
      } catch (e) {
        // Expected to fail
        expect(e, isA<GoogleAIException>());
        print('   Confirmed deletion: File not found');
      }

      // Clear the name so tearDownAll doesn't try to delete it again
      uploadedFileName = null;
    });
  });
}
