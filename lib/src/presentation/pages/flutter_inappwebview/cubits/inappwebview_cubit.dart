import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:webview_test/src/domain/models/models.dart';
import 'package:webview_test/src/domain/use_cases/use_cases.dart';

part 'inappwebview_state.dart';
part 'inappwebview_cubit.freezed.dart';

@injectable
class InAppWebViewCubit extends Cubit<InAppWebViewState> {
  InAppWebViewCubit({
    @factoryParam required InAppWebViewState initialState,
    required SetDpCookieUseCase setDpCookieUseCase,
  })  : _setDpCookieUseCase = setDpCookieUseCase,
        super(initialState);

  final SetDpCookieUseCase _setDpCookieUseCase;

  @PostConstruct(preResolve: true)
  Future<void> init() async {
    await _setDpCookieUseCase(
      SetWebViewCookieRequest(
        url: state.currentUrl,
        key: 'x-dealsplus-tg',
        value: 'A',
      ),
    );
  }
}
