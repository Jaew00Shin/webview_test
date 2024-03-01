import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:webview_test/src/application/config/config.dart';
import 'package:webview_test/src/presentation/pages/flutter_inappwebview/cubits/cubits.dart';
import 'package:webview_test/src/presentation/pages/flutter_inappwebview/views/views.dart';
import 'package:webview_test/src/utils/utils.dart';

class FlutterInAppWebViewPage extends GoRouteData {
  const FlutterInAppWebViewPage({
    this.url,
    this.windowId,
  });

  final String? url;
  final int? windowId;

  static const String path = 'flutter_inappwebview';

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return BlocProvider<InAppWebViewCubit>(
      key: ObjectKey([url, windowId]),
      create: (BuildContext context) {
        final cubit = getIt<InAppWebViewCubit>(
          param1: InAppWebViewState(
            currentUrl: url != null ? Uri.decodeComponent(url!).toUri() : null,
          ),
        );
        if (url != null) {
          cubit.onCookieInitialized();
        }

        return cubit;
      },
      child: MultiBlocListener(
        listeners: [
          BlocListener<InAppWebViewCubit, InAppWebViewState>(
            listenWhen: (prev, curr) =>
                prev.currentUrl == null && curr.currentUrl != null,
            listener: (context, state) async {
              await context.read<InAppWebViewCubit>().onCookieInitialized();
            },
          ),
          BlocListener<InAppWebViewCubit, InAppWebViewState>(
            listenWhen: (prev, curr) =>
                prev.currentUrl != curr.currentUrl && curr.currentUrl != null,
            listener: (context, state) async {
              ScaffoldMessenger.of(context).hideCurrentSnackBar();
              if (state.currentUrl == null) return;

              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(state.currentUrl.toString()),
                  duration: const Duration(days: 10),
                ),
              );
            },
          ),
        ],
        child: const FlutterInAppWebViewPageView(),
      ),
    );
  }
}
