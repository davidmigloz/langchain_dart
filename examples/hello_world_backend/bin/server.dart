// ignore_for_file: avoid_print
import 'dart:io';

import 'package:shelf/shelf.dart';
import 'package:shelf/shelf_io.dart' as io;

import 'api.dart';

Future<void> main() async {
  final port = int.parse(Platform.environment['PORT'] ?? '8080');
  final api = Api();
  final handler =
      const Pipeline().addMiddleware(logRequests()).addHandler(api.handler);
  final server = await io.serve(handler, InternetAddress.anyIPv4, port);
  print('Serving at http://${server.address.host}:${server.port}');
}
