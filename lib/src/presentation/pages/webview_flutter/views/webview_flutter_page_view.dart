import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:functional_widget_annotation/functional_widget_annotation.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:webview_test/src/presentation/hooks/hooks.dart';
import 'package:webview_test/src/presentation/pages/pages.dart';
import 'package:webview_test/src/utils/extensions/string_extension.dart';
import 'package:webview_test/src/utils/utils.dart';

part 'webview_flutter_page_view.g.dart';

class WebViewFlutterPageView extends StatelessWidget {
  const WebViewFlutterPageView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('webview_flutter'),
      ),
      body: const SafeArea(child: _Body()),
    );
  }
}

@hwidget
Widget __body(BuildContext context) {
  final url = useUrl();

  final controller = useMemoized(
    () {
      return WebViewController()..loadRequest(url.toUri());
    },
    [url],
  );

  final onNavigationDelegate = useCallback(
    (NavigationRequest request) async {
      if (url.isDealsplus && !request.url.isDealsplus) {
        await WebViewFlutterPage(url: Uri.encodeComponent(request.url))
            .push<void>(context);
        return NavigationDecision.prevent;
      }
      return NavigationDecision.navigate;
    },
    [url, controller],
  );

  useEffect(
    () {
      controller.setNavigationDelegate(
        NavigationDelegate(onNavigationRequest: onNavigationDelegate),
      );
      return null;
    },
    [controller, onNavigationDelegate],
  );

  return WebViewWidget(controller: controller);
}
