part of 'inappwebview_cubit.dart';

@freezed
class InAppWebViewState with _$InAppWebViewState {
  const factory InAppWebViewState({
    Uri? currentUrl,
    @Default(false) bool canGoBack,
  }) = _InAppWebViewState;
}
