import 'package:webview_test/src/application/apps/apps.dart';
import 'package:webview_test/src/application/bootstrap.dart';

void main() async =>
    bootstrap(() => const MainApp(), environment: 'production');
