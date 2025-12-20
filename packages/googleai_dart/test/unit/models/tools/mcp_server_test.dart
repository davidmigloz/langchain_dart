import 'package:googleai_dart/src/models/tools/mcp_server.dart';
import 'package:googleai_dart/src/models/tools/streamable_http_transport.dart';
import 'package:test/test.dart';

void main() {
  group('McpServer', () {
    group('fromJson', () {
      test('creates McpServer with all fields', () {
        final json = {
          'name': 'my-mcp-server',
          'streamableHttpTransport': {
            'url': 'https://mcp.example.com/transport',
          },
        };

        final server = McpServer.fromJson(json);

        expect(server.name, 'my-mcp-server');
        expect(server.streamableHttpTransport, isNotNull);
        expect(
          server.streamableHttpTransport!.url,
          'https://mcp.example.com/transport',
        );
      });

      test('creates McpServer with minimal fields', () {
        final json = <String, dynamic>{};

        final server = McpServer.fromJson(json);

        expect(server.name, isNull);
        expect(server.streamableHttpTransport, isNull);
      });
    });

    group('toJson', () {
      test('converts McpServer with all fields to JSON', () {
        const server = McpServer(
          name: 'test-server',
          streamableHttpTransport: StreamableHttpTransport(
            url: 'https://test.com/mcp',
          ),
        );

        final json = server.toJson();

        expect(json['name'], 'test-server');
        expect(json['streamableHttpTransport'], isNotNull);
        expect(
          (json['streamableHttpTransport'] as Map<String, dynamic>)['url'],
          'https://test.com/mcp',
        );
      });

      test('omits null fields from JSON', () {
        const server = McpServer(name: 'simple-server');

        final json = server.toJson();

        expect(json['name'], 'simple-server');
        expect(json.containsKey('streamableHttpTransport'), false);
      });
    });

    test('round-trip conversion preserves data', () {
      const original = McpServer(
        name: 'roundtrip-server',
        streamableHttpTransport: StreamableHttpTransport(
          url: 'https://roundtrip.test/mcp',
        ),
      );

      final json = original.toJson();
      final restored = McpServer.fromJson(json);

      expect(restored.name, original.name);
      expect(
        restored.streamableHttpTransport!.url,
        original.streamableHttpTransport!.url,
      );
    });

    group('copyWith', () {
      test('creates copy with replaced values', () {
        const original = McpServer(name: 'original-name');

        final copy = original.copyWith(name: 'new-name');

        expect(copy.name, 'new-name');
      });
    });

    test('toString includes all fields', () {
      const server = McpServer(name: 'my-server');

      final str = server.toString();

      expect(str, contains('McpServer('));
      expect(str, contains('name: my-server'));
    });
  });

  group('StreamableHttpTransport', () {
    test('fromJson and toJson work correctly', () {
      final json = {'url': 'https://mcp.example.com'};

      final transport = StreamableHttpTransport.fromJson(json);
      expect(transport.url, 'https://mcp.example.com');

      final output = transport.toJson();
      expect(output['url'], 'https://mcp.example.com');
    });

    test('handles null url', () {
      final json = <String, dynamic>{};

      final transport = StreamableHttpTransport.fromJson(json);
      expect(transport.url, isNull);

      final output = transport.toJson();
      expect(output.containsKey('url'), false);
    });
  });
}
