import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:webview_test/src/presentation/pages/pages.dart';

typedef OnCreateWindow = Future<bool> Function(
  InAppWebViewController controller,
  CreateWindowAction createWindowAction,
);

OnCreateWindow useOnCreateWindow() {
  final context = useContext();
  final onCreateWindow = useCallback((
    InAppWebViewController controller,
    CreateWindowAction createWindowAction,
  ) async {
    final url = createWindowAction.request.url;
    if (url != null) {
      await FlutterInAppWebViewPage(
        url: Uri.encodeComponent(url.uriValue.toString()),
        windowId: createWindowAction.windowId,
      ).push<void>(context);
    }

    return true;
  });

  return onCreateWindow;
}
