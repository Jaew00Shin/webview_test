import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:go_router/go_router.dart';
import 'package:webview_test/src/presentation/blocs/blocs.dart';
import 'package:webview_test/src/presentation/hooks/hooks.dart';
import 'package:webview_test/src/presentation/pages/flutter_inappwebview/hooks/hooks.dart';
import 'package:webview_test/src/utils/utils.dart';

class FlutterInAppWebViewPageView extends HookWidget {
  const FlutterInAppWebViewPageView({super.key});

  @override
  Widget build(BuildContext context) {
    final url = useUrl();
    final windowId =
        GoRouterState.of(context).uri.queryParameters['window-id']?.toInt();
    final UseInAppWebView(
      :onCreateWindow,
      :onWebViewCreated,
      :canPop,
      :onUpdateVisitedHistory
    ) = useInAppWebView();
    final pushPage = usePushPage();
    final detailUrl = context
        .select<ExternalStoreCubit, Uri?>((cubit) => cubit.state.detailUrl);

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => context.pop(),
          icon: const Icon(Icons.arrow_back_ios),
        ),
        actions: [
          IconButton(
            onPressed: () => pushPage('${getDpWebUrl()}/nike-coupons'),
            icon: const Text('nike'),
          ),
          IconButton(
            onPressed: () => pushPage('${getDpWebUrl()}/walmart-coupons'),
            icon: const Text('walmart'),
          ),
        ],
      ),
      body: SafeArea(
        child: PopScope(
          canPop: canPop,
          child: InAppWebView(
            windowId: windowId,
            initialUrlRequest:
                url != null ? URLRequest(url: WebUri.uri(url)) : null,
            onCreateWindow: onCreateWindow,
            onWebViewCreated: onWebViewCreated,
            onUpdateVisitedHistory: onUpdateVisitedHistory,
            initialSettings: InAppWebViewSettings(
              supportMultipleWindows: true,
              javaScriptCanOpenWindowsAutomatically: true,
            ),
          ),
        ),
      ),
      floatingActionButton: detailUrl != null
          ? FloatingActionButton(
              onPressed: () => pushPage(detailUrl.toString()),
            )
          : null,
    );
  }
}
