# Web page

Use `WebBaseLoader` to load data from web pages.

It uses [http](https://pub.dev/packages/http) to fetch the web page content.
And [beautiful_soup_dart](https://pub.dev/packages/beautiful_soup_dart) to
parse the HTML content.

```dart
final loader = WebBaseLoader('https://en.wikipedia.org/wiki/Wikipedia');
final documents = await loader.load();
```
