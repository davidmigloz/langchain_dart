export 'http_client_stub.dart'
    if (dart.library.io) 'http_client_io.dart'
    if (dart.library.js) 'http_client_html.dart'
    if (dart.library.html) 'http_client_html.dart';
