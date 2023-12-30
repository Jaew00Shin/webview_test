import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:webview_test/src/application/config/di.config.dart';

final getIt = GetIt.instance;

@InjectableInit(
  initializerName: r'$initModuleGetIt',
)
Future<void> configureDependencies() async => getIt.$initModuleGetIt();
