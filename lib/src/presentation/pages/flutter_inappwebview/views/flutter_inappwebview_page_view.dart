import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:functional_widget_annotation/functional_widget_annotation.dart';
import 'package:webview_test/src/presentation/hooks/hooks.dart';
import 'package:webview_test/src/presentation/pages/flutter_inappwebview/flutter_inappwebview_page.dart';
import 'package:webview_test/src/presentation/pages/home/home_page.dart';
import 'package:webview_test/src/utils/utils.dart';

part 'flutter_inappwebview_page_view.g.dart';

class FlutterInAppWebViewPageView extends HookWidget {
  const FlutterInAppWebViewPageView({super.key});

  @override
  Widget build(BuildContext context) {
    final url = useUrl();
    final (:canPop, :onPop) = useCanPop();
    // final (:childrenUrls, :pageIndex, :setPageIndex) =
    //     useUrlOrderingWithPageIndex(bodyUrls: _bodyUrls);

    return Scaffold(
      appBar: AppBar(
        leading: _BackButton(onPressed: onPop),
        title: const Text('flutter_inappwebview'),
      ),
      body: PopScope(
        canPop: canPop,
        child: SafeArea(
          child: _WebViewbody(url: url),
        ),
      ),
      /*body: SafeArea(
        child: Stack(
          children: childrenUrls
              .map(
                (e) => _WebViewbody(
                  url: e,
                  key: Key(e),
                ),
              )
              .toList(),
        ),
      ),
      bottomNavigationBar: _BottomNavigationBar(
        currentIndex: pageIndex,
        onTap: setPageIndex,
      ),*/
    );
  }

  List<String> get _bodyUrls => [
        getDpWebUrl(),
        '${getDpWebUrl()}/search',
        '${getDpWebUrl()}/deals',
        '${getDpWebUrl()}/stores',
        '${getDpWebUrl()}/my',
      ];
}

@swidget
Widget __backButton(
  BuildContext context, {
  required void Function() onPressed,
}) {
  return IconButton(
    onPressed: onPressed,
    icon: const Icon(Icons.arrow_back_ios),
  );
}

@hwidget
Widget __webViewbody(
  BuildContext context, {
  required String url,
}) {
  return InAppWebView(
    initialUrlRequest: URLRequest(url: WebUri(url)),
    initialSettings: InAppWebViewSettings(
      supportMultipleWindows: true,
      javaScriptCanOpenWindowsAutomatically: true,
    ),
    onCreateWindow: (
      InAppWebViewController controller,
      CreateWindowAction createWindowAction,
    ) async {
      final url = createWindowAction.request.url?.uriValue;
      if (url == null) return false;
      await FlutterInAppWebViewPage(url: Uri.encodeComponent(url.toString()))
          .push<void>(context);
      return true;
    },
  );
}

@swidget
Widget __bottomNavigationBar(
  BuildContext context, {
  required int currentIndex,
  required ValueChanged<int>? onTap,
}) {
  return BottomNavigationBar(
    currentIndex: currentIndex,
    onTap: onTap,
    selectedItemColor: Colors.blue,
    selectedLabelStyle: const TextStyle(color: Colors.black),
    items: const [
      BottomNavigationBarItem(
        icon: Icon(
          Icons.home,
          color: Colors.black,
        ),
        label: 'home',
      ),
      BottomNavigationBarItem(
        icon: Icon(
          Icons.search,
          color: Colors.black,
        ),
        label: 'search',
      ),
      BottomNavigationBarItem(
        icon: Icon(
          Icons.star,
          color: Colors.black,
        ),
        label: 'deals',
      ),
      BottomNavigationBarItem(
        icon: Icon(
          Icons.percent,
          color: Colors.black,
        ),
        label: 'cashback',
      ),
      BottomNavigationBarItem(
        icon: Icon(
          Icons.person,
          color: Colors.black,
        ),
        label: 'my',
      ),
    ],
  );
}
