import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:webview_test/src/presentation/pages/flutter_inappwebview/flutter_inappwebview_page.dart';
import 'package:webview_test/src/presentation/pages/home/views/views.dart';
import 'package:webview_test/src/presentation/pages/pages.dart';

part 'home_page.g.dart';

@TypedGoRoute<HomePage>(
  path: HomePage.path,
  routes: [
    TypedGoRoute<WebViewFlutterPage>(
      path: WebViewFlutterPage.path,
    ),
    TypedGoRoute<FlutterInAppWebViewPage>(
      path: FlutterInAppWebViewPage.path,
    ),
  ],
)
class HomePage extends GoRouteData {
  const HomePage();

  static const String path = '/';

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const HomePageView();
  }
}
