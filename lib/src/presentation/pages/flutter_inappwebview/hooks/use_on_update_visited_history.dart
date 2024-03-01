import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:webview_test/src/presentation/blocs/blocs.dart';
import 'package:webview_test/src/presentation/pages/flutter_inappwebview/cubits/cubits.dart';
import 'package:webview_test/src/utils/utils.dart';

typedef OnUpdateVisitedHistory = void Function(
  InAppWebViewController controller,
  WebUri? url,
  // ignore: avoid_positional_boolean_parameters
  bool? isReload,
);

OnUpdateVisitedHistory useOnUpdateVisitedHistory() {
  final context = useContext();
  final updateVisitedHistory = useCallback((
    InAppWebViewController controller,
    WebUri? url,
    bool? isReload,
  ) async {
    if (url == null) return;
    final webViewCubit = context.read<InAppWebViewCubit>();
    final externalStoreCubit = context.read<ExternalStoreCubit>();

    final canGoBack = await controller.canGoBack();
    webViewCubit.onCurrentUrlChanged(
      url: url.uriValue,
      canGoBack: canGoBack,
    );

    final (:couponUrl, :couponId, :dealId) =
        extractFromLandingUrl(url.uriValue);
    if (couponUrl == null && couponId == null && dealId == null) return;

    externalStoreCubit.setState(
      couponId: couponId,
      couponUrl: couponUrl,
      dealId: dealId,
    );
  });

  return updateVisitedHistory;
}
