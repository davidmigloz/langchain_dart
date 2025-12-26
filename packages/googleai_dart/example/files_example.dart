// ignore_for_file: avoid_print
/// Demonstrates file upload and management.
library;

import 'dart:io' as io;
import 'package:googleai_dart/googleai_dart.dart';

void main() async {
  final client = GoogleAIClient(
    config: const GoogleAIConfig(authProvider: ApiKeyProvider('YOUR_API_KEY')),
  );

  String? uploadedFileName;

  try {
    // Create a temporary test file
    final tempDir = io.Directory.systemTemp;
    final testFile = io.File('${tempDir.path}/example_image.txt')
      ..writeAsStringSync(
        'This is a sample file for demonstration purposes.\n'
        'It contains some text that will be uploaded to the Google AI API.',
      );

    print('📁 File Management Example\n');

    // 1. Upload a file (using file path - IO platforms only)
    print('1️⃣  Uploading file using file path...\n');

    final uploadedFile = await client.files.upload(
      filePath: testFile.path,
      mimeType: 'text/plain',
      displayName: 'Example File',
    );

    uploadedFileName = uploadedFile.name;

    // Alternative: Upload using bytes (works on all platforms including WASM)
    // final bytes = testFile.readAsBytesSync();
    // final uploadedFile = await client.files.upload(
    //   bytes: bytes,
    //   fileName: 'example_image.txt',
    //   mimeType: 'text/plain',
    //   displayName: 'Example File',
    // );

    print('✅ File uploaded successfully!');
    print('   Name: ${uploadedFile.name}');
    print('   Display Name: ${uploadedFile.displayName}');
    print('   MIME Type: ${uploadedFile.mimeType}');
    print('   Size: ${uploadedFile.sizeBytes} bytes');
    print('   State: ${uploadedFile.state}');
    print('   URI: ${uploadedFile.uri}');
    if (uploadedFile.downloadUri != null) {
      print('   Download URI: ${uploadedFile.downloadUri}');
    }
    if (uploadedFile.source != null) {
      print('   Source: ${uploadedFile.source}');
    }
    print('   Created: ${uploadedFile.createTime}');
    print('   Expires: ${uploadedFile.expirationTime}');

    // 2. List files
    print('\n2️⃣  Listing all files...\n');

    final listResponse = await client.files.list(pageSize: 10);

    print('📋 Found ${listResponse.files.length} files:');
    for (final file in listResponse.files) {
      print('   - ${file.displayName ?? file.name} (${file.mimeType})');
      print('     State: ${file.state}, Size: ${file.sizeBytes} bytes');
    }

    if (listResponse.nextPageToken != null) {
      print('\n   More files available (use nextPageToken for pagination)');
    }

    // 3. Get file metadata
    print('\n3️⃣  Getting file metadata...\n');

    final fileDetails = await client.files.get(name: uploadedFileName);

    print('📄 File Details:');
    print('   Name: ${fileDetails.name}');
    print('   Display Name: ${fileDetails.displayName}');
    print('   State: ${fileDetails.state}');
    print('   Created: ${fileDetails.createTime}');
    print('   Updated: ${fileDetails.updateTime}');
    print('   Expires: ${fileDetails.expirationTime}');

    if (fileDetails.videoMetadata != null) {
      print('   Video Duration: ${fileDetails.videoMetadata!.videoDuration}');
    }

    if (fileDetails.error != null) {
      print('   Error: ${fileDetails.error!.message}');
    }

    // 4. Wait for file to be processed (if needed)
    print('\n⏳ Waiting for file to be processed...\n');

    var currentFile = fileDetails;
    while (currentFile.state == FileState.processing) {
      await Future<void>.delayed(const Duration(seconds: 2));
      currentFile = await client.files.get(name: uploadedFileName);
      print('   State: ${currentFile.state}');
    }

    if (currentFile.state == FileState.active) {
      print('✅ File is ready for use!');
    } else if (currentFile.state == FileState.failed) {
      print('❌ File processing failed');
      if (currentFile.error != null) {
        print('   Error: ${currentFile.error!.message}');
      }
    }

    // 5. Use the file in a prompt (example)
    print('\n💡 You can now use this file in prompts:');
    print('   ```dart');
    print('   final response = await client.models.generateContent(');
    print('     model: "gemini-3-flash-preview",');
    print('     request: GenerateContentRequest(');
    print('       contents: [');
    print('         Content(');
    print('           parts: [');
    print('             TextPart("Describe this file"),');
    print('             FileData(');
    print('               fileUri: "${currentFile.uri}",');
    print('               mimeType: "${currentFile.mimeType}",');
    print('             ),');
    print('           ],');
    print('           role: "user",');
    print('         ),');
    print('       ],');
    print('     ),');
    print('   );');
    print('   ```');

    // 6. Delete the file
    print('\n4️⃣  Deleting file...\n');

    await client.files.delete(name: uploadedFileName);
    uploadedFileName = null;

    print('✅ File deleted successfully!');

    // Clean up temp file
    if (testFile.existsSync()) {
      testFile.deleteSync();
    }

    print('\n📝 Notes:');
    print('   - Files are automatically deleted after 48 hours');
    print('   - Supported file types: images, audio, video, documents');
    print('   - Maximum file size: 20MB per file');
    print('   - Use files with models that support multimodal input');
    print('\n💡 Upload Methods:');
    print(
      '   - filePath: Read from file system (IO platforms only, streaming)',
    );
    print('   - bytes: Upload from memory (all platforms including WASM)');
    print(
      '   - contentStream: Stream large files (IO platforms only, memory efficient)',
    );
  } catch (e) {
    print('❌ Error: $e');
  } finally {
    // Cleanup: delete the file if it still exists
    if (uploadedFileName != null) {
      try {
        await client.files.delete(name: uploadedFileName);
        print('\n🧹 Cleaned up uploaded file');
      } catch (e) {
        print('\n⚠️  Failed to clean up file: $e');
      }
    }
    client.close();
  }
}
