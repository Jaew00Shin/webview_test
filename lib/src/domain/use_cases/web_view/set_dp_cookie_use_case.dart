import 'package:injectable/injectable.dart';
import 'package:webview_test/src/domain/models/models.dart';
import 'package:webview_test/src/domain/repositories/repositories.dart';
import 'package:webview_test/src/domain/use_cases/use_case.dart';

@lazySingleton
class SetDpCookieUseCase
    implements FutureUseCase<void, SetWebViewCookieRequest> {
  const SetDpCookieUseCase({required WebViewRepository webViewRepository})
      : _webViewRepository = webViewRepository;

  final WebViewRepository _webViewRepository;

  @override
  Future<void> call(SetWebViewCookieRequest request) async {
    await _webViewRepository.setCookie(request);
  }
}
