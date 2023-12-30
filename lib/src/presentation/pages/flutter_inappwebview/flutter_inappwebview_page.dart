import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:webview_test/src/application/config/config.dart';
import 'package:webview_test/src/presentation/pages/flutter_inappwebview/cubits/inappwebview_cubit.dart';
import 'package:webview_test/src/presentation/pages/flutter_inappwebview/views/views.dart';
import 'package:webview_test/src/utils/extensions/string_extension.dart';
import 'package:webview_test/src/utils/utils.dart';

class FlutterInAppWebViewPage extends GoRouteData {
  const FlutterInAppWebViewPage({
    required this.url,
  });

  final String url;

  static const String path = 'flutter_inappwebview';

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return BlocProvider<InAppWebViewCubit>(
      create: (BuildContext context) => getIt<InAppWebViewCubit>(
        param1: InAppWebViewState(currentUrl: getDpWebUrl().toUri()),
      ),
      child: const FlutterInAppWebViewPageView(),
    );
  }
}
