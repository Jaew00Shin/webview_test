import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:logger/logger.dart';

@LazySingleton(as: BlocObserver)
class AppBlocObserver extends BlocObserver {
  const AppBlocObserver({
    required Logger logger,
  }) : _logger = logger;

  final Logger _logger;

  @override
  void onChange(BlocBase<dynamic> bloc, Change<dynamic> change) {
    super.onChange(bloc, change);
    _logger.d('${bloc.runtimeType}\n\nCurrent State\n${change.currentState}\n\n'
        'Next State\n${change.nextState}\n');
  }

  @override
  void onError(BlocBase<dynamic> bloc, Object error, StackTrace stackTrace) {
    _logger.e('onError(${bloc.runtimeType}, $error, $stackTrace)');
    super.onError(bloc, error, stackTrace);
  }
}
