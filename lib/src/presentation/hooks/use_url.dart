import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:webview_test/src/utils/extensions/string.dart';

Uri? useUrl() {
  final context = useContext();
  final url = useMemoized(() {
    final encodedUrl = GoRouterState.of(context).uri.queryParameters['url'];
    return encodedUrl != null ? Uri.decodeComponent(encodedUrl).toUri() : null;
  });

  return url;
}
