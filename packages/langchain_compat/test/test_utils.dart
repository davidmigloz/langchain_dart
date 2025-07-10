import 'package:http/http.dart' as http;

Future<bool> isOllamaAvailable() async =>
    (await http.get(
      Uri.parse('http://localhost:11434/api/version'),
    )).statusCode ==
    200;
