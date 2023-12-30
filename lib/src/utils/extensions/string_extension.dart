import 'package:webview_test/src/utils/utils.dart';

extension StringX on String {
  Uri toUri() => Uri.parse(this);

  bool get isDealsplus => toUri().isDealsplus;
}
