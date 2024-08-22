// ignore_for_file: public_member_api_docs
@JS('chrome')
library;

import 'package:js/js.dart';

@JS('tabs.query')
external Future<List<Tab>> query(final ParameterQueryTabs parameterQueryTabs);

@JS()
class Tab {
  external String get url;

  external factory Tab(final String url);
}

@JS()
@anonymous
class ParameterQueryTabs {
  external factory ParameterQueryTabs({
    final bool active,
    final bool lastFocusedWindow,
  });

  external bool get active;

  external bool get lastFocusedWindow;
}
