// ignore_for_file: public_member_api_docs
import 'package:chrome_extension/tabs.dart';

/// Query Chrome tabs based on given parameters
Future<List<Tab>> query(final ParameterQueryTabs parameterQueryTabs) async {
  final chromeTabs = await chrome.tabs.query(
    QueryInfo(
      active: parameterQueryTabs.active,
      lastFocusedWindow: parameterQueryTabs.lastFocusedWindow,
    ),
  );

  return chromeTabs
      .map((chromeTab) => Tab(chromeTab.url ?? ''))
      .toList(growable: false);
}

/// Chrome tab representation in Dart
class Tab {
  final String url;

  Tab(this.url);
}

/// Parameters for querying tabs
class ParameterQueryTabs {
  final bool active;
  final bool lastFocusedWindow;

  ParameterQueryTabs({required this.active, required this.lastFocusedWindow});
}
