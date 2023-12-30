import 'package:freezed_annotation/freezed_annotation.dart';

part 'set_web_view_cookie_request.freezed.dart';

@freezed
class SetWebViewCookieRequest with _$SetWebViewCookieRequest {
  const factory SetWebViewCookieRequest({
    required Uri url,
    required String key,
    required String value,
  }) = _SetWebViewCookieRequest;
}
