import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:webview_test/src/presentation/pages/webview_flutter/views/views.dart';

class WebViewFlutterPage extends GoRouteData {
  const WebViewFlutterPage({
    required this.url,
  });

  final String url;

  static const String path = 'webview_flutter';

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const WebViewFlutterPageView();
  }
}
