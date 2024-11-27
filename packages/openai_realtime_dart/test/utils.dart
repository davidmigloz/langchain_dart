import 'dart:async';
import 'dart:io';
import 'dart:typed_data';

/// Reads an audio file and returns its content as a Uint8List
Future<Uint8List> readSampleAudioFile(String fileName) async {
  final file = File('./test/samples/$fileName');
  return file.readAsBytes();
}
