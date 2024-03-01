import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:webview_test/src/presentation/hooks/hooks.dart';
import 'package:webview_test/src/presentation/pages/flutter_inappwebview/cubits/inappwebview_cubit.dart';
import 'package:webview_test/src/presentation/pages/flutter_inappwebview/hooks/hooks.dart';
import 'package:webview_test/src/utils/extensions/uri.dart';

class UseInAppWebView {
  const UseInAppWebView({
    required this.canPop,
    required this.onWebViewCreated,
    required this.onCreateWindow,
    required this.onUpdateVisitedHistory,
  });

  final bool canPop;
  final OnCreateWindow onCreateWindow;
  final OnWebViewCreated onWebViewCreated;
  final OnUpdateVisitedHistory onUpdateVisitedHistory;
}

UseInAppWebView useInAppWebView() {
  final context = useContext();
  final initialUrl = useUrl();
  final InAppWebViewState(:currentUrl, :canGoBack) =
      context.watch<InAppWebViewCubit>().state;

  final canPop = useState(context.canPop());
  final onWebViewCreated = useOnWebViewCreated();
  final onCreateWindow = useOnCreateWindow();
  final onUpdateVisitedHistory = useOnUpdateVisitedHistory();

  useEffect(
    () {
      canPop.value = !canGoBack &&
          (initialUrl != null &&
              currentUrl != null &&
              initialUrl.isEqual(currentUrl));
      return null;
    },
    [initialUrl, currentUrl, canGoBack],
  );

  return UseInAppWebView(
    canPop: canPop.value,
    onWebViewCreated: onWebViewCreated,
    onCreateWindow: onCreateWindow,
    onUpdateVisitedHistory: onUpdateVisitedHistory,
  );
}
