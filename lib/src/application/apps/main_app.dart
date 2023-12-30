import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:webview_test/src/presentation/pages/pages.dart';

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: GoRouter(
        routes: $appRoutes,
        debugLogDiagnostics: true,
      ),
    );
  }
}
