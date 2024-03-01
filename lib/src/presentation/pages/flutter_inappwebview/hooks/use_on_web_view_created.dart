import 'dart:io';

import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

typedef OnWebViewCreated = void Function(InAppWebViewController controller);

OnWebViewCreated useOnWebViewCreated() {
  final onWebViewCreated = useCallback((InAppWebViewController controller) {
    controller
      ..addJavaScriptHandler(
        handlerName: 'checkMobile',
        callback: (args) {
          return {
            'Flutter': true,
            'Android': Platform.isAndroid,
            'iOS': Platform.isIOS,
          };
        },
      )
      ..addJavaScriptHandler(
        handlerName: 'copyCode',
        callback: (args) {
          switch (args) {
            case [{'text': final String text}, ...]:
              Clipboard.setData(ClipboardData(text: text));
          }
        },
      );
  });

  return onWebViewCreated;
}
