import 'package:beautiful_soup_dart/beautiful_soup.dart';
import 'package:http/http.dart' as http;

import '../models/models.dart';
import 'base.dart';

/// {@template web_base_loader}
/// A document loader that loads [Document]s from web pages.
///
/// It uses [http](https://pub.dev/packages/http) to fetch the web page content.
/// And [beautiful_soup_dart](https://pub.dev/packages/beautiful_soup_dart) to
/// parse the HTML content.
///
/// Example usage:
/// ```dart
/// final loader = WebBaseLoader('https://en.wikipedia.org/wiki/Wikipedia');
/// final documents = await loader.load();
/// ```
/// {@endtemplate}
class WebBaseLoader extends BaseDocumentLoader {
  /// {@macro web_base_loader}
  const WebBaseLoader(
    this.urls, {
    this.requestHeaders,
  });

  /// The URLs to the web pages to load.
  final List<String> urls;

  /// The request headers to use when fetching the web page content.
  final Map<String, String>? requestHeaders;

  @override
  Stream<Document> lazyLoad() async* {
    for (final url in urls) {
      final doc = await _scrape(url);
      yield doc;
    }
  }

  /// 1. Fetch the HTML content from the [url].
  /// 2. Parse the HTML content using [BeautifulSoup].
  /// 3. Extract the text from the HTML content.
  /// 4. Build the [Document] with the extracted text and metadata.
  Future<Document> _scrape(final String url) async {
    final html = await _fetchUrl(url);
    final soup = BeautifulSoup(html);
    final body = soup.body!;
    body.findAll('style').forEach((final element) => element.extract());
    body.findAll('script').forEach((final element) => element.extract());
    final content = body.getText(strip: true);
    return Document(
      pageContent: content,
      metadata: _buildMetadata(url, soup),
    );
  }

  Future<String> _fetchUrl(final String url) async {
    final response = await http.get(Uri.parse(url), headers: requestHeaders);
    return response.body;
  }

  Map<String, dynamic> _buildMetadata(
    final String url,
    final BeautifulSoup soup,
  ) {
    final title = soup.title;
    final description = soup.find(
      'meta',
      attrs: {'name': 'description'},
    )?.getAttrValue('content');
    final language = soup.find('html')?.getAttrValue('lang');
    return {
      'source': url,
      if (title != null) 'title': title.text,
      if (description != null) 'description': description.trim(),
      if (language != null) 'language': language,
    };
  }
}
