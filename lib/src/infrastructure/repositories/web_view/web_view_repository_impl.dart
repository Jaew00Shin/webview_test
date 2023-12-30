import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:injectable/injectable.dart';
import 'package:webview_test/src/domain/models/requests/web_view/set_web_view_cookie_request.dart';
import 'package:webview_test/src/domain/repositories/repositories.dart';

@LazySingleton(as: WebViewRepository)
class WebViewRepositoryImpl implements WebViewRepository {
  WebViewRepositoryImpl();

  final _cookieManager = CookieManager.instance();

  @override
  Future<void> setCookie(SetWebViewCookieRequest request) async {
    await _cookieManager.setCookie(
      url: WebUri(request.url.toString()),
      name: request.key,
      value: request.value,
    );
  }
}
