import 'package:injectable/injectable.dart';
import 'package:webview_test/src/utils/utils.dart';

@module
abstract class AppConfig {
  @injectable
  @Named(dpWebUrlKey)
  String get dpWebUrl => 'https://www.dealsplus.com';
}
