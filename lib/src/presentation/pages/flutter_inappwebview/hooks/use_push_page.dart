import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:webview_test/src/presentation/pages/flutter_inappwebview/flutter_inappwebview_page.dart';
import 'package:webview_test/src/presentation/pages/home/home_page.dart';

typedef PushPage = void Function(String url);

PushPage usePushPage() {
  final context = useContext();
  final pushPage = useCallback((String url) {
    FlutterInAppWebViewPage(url: Uri.encodeComponent(url)).push<void>(context);
  });

  return pushPage;
}
