import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';

String useUrl() {
  final context = useContext();
  final encodedUrl = GoRouterState.of(context).uri.queryParameters['url']!;
  return Uri.decodeComponent(encodedUrl);
}
