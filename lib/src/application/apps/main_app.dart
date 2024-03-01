import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:webview_test/src/application/config/config.dart';
import 'package:webview_test/src/presentation/blocs/blocs.dart';
import 'package:webview_test/src/presentation/pages/pages.dart';

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ExternalStoreCubit>(
      create: (context) => getIt<ExternalStoreCubit>(),
      child: MaterialApp.router(
        routerConfig: GoRouter(
          routes: $appRoutes,
          debugLogDiagnostics: true,
        ),
      ),
    );
  }
}
