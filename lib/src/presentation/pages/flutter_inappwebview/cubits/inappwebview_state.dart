part of 'inappwebview_cubit.dart';

@freezed
class InAppWebViewState with _$InAppWebViewState {
  const factory InAppWebViewState({
    required Uri currentUrl,
  }) = _InAppWebViewState;
}
