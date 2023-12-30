import 'package:webview_test/src/domain/models/models.dart';

abstract interface class WebViewRepository {
  Future<void> setCookie(SetWebViewCookieRequest request);
}
