import 'package:flutter/material.dart';
import 'package:functional_widget_annotation/functional_widget_annotation.dart';
import 'package:gap/gap.dart';
import 'package:webview_test/src/presentation/pages/flutter_inappwebview/flutter_inappwebview_page.dart';
import 'package:webview_test/src/presentation/pages/pages.dart';
import 'package:webview_test/src/utils/functions/url.dart';

part 'home_page_view.g.dart';

class HomePageView extends StatelessWidget {
  const HomePageView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('home'),
      ),
      body: const _Body(),
    );
  }
}

@swidget
Widget __body(BuildContext context) {
  return const Center(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _FirstButton(),
        Gap(50),
        _SecondButton(),
      ],
    ),
  );
}

@swidget
Widget __firstButton(BuildContext context) {
  return ElevatedButton(
    onPressed: () =>
        WebViewFlutterPage(url: Uri.encodeComponent(getDpWebUrl())).go(context),
    child: const Text('webview_flutter'),
  );
}

@swidget
Widget __secondButton(BuildContext context) {
  return ElevatedButton(
    onPressed: () =>
        FlutterInAppWebViewPage(url: Uri.encodeComponent(getDpWebUrl()))
            .go(context),
    child: const Text('flutter_inappwebview'),
  );
}
