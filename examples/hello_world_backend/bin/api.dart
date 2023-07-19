// ignore_for_file: avoid_dynamic_calls
import 'dart:convert';

import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';

import 'sonnets.dart';

class Api {
  final sonnetsService = SonnetsService();

  Handler get handler {
    final router = Router()..post('/v1/sonnets', _sonnetHandler);
    return router.call;
  }

  Future<Response> _sonnetHandler(final Request request) async {
    final payload = jsonDecode(await request.readAsString());
    final topics = payload['topics'];

    final sonnet = await sonnetsService.generateSonnet(topics.cast<String>());

    return Response.ok(
      headers: {'Content-type': 'application/json'},
      jsonEncode({
        'sonnet': sonnet,
      }),
    );
  }
}
