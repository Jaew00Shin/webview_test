import 'package:webview_test/src/utils/functions/url.dart';

extension UriX on Uri {
  bool get isDealsplus => Uri.parse(getDpWebUrl()).host == host;
}
