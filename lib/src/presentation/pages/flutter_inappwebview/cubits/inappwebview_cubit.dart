import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:webview_test/src/domain/models/models.dart';
import 'package:webview_test/src/domain/use_cases/use_cases.dart';
import 'package:webview_test/src/utils/utils.dart';

part 'inappwebview_state.dart';
part 'inappwebview_cubit.freezed.dart';

@injectable
class InAppWebViewCubit extends Cubit<InAppWebViewState> {
  InAppWebViewCubit({
    required SetDpCookieUseCase setDpCookieUseCase,
    @factoryParam InAppWebViewState? initialState,
  })  : _setDpCookieUseCase = setDpCookieUseCase,
        super(
          initialState ?? InAppWebViewState(currentUrl: getDpWebUrl().toUri()),
        );

  final SetDpCookieUseCase _setDpCookieUseCase;

  Future<void> onCookieInitialized() async {}

  void onCurrentUrlChanged({
    required Uri url,
    required bool canGoBack,
  }) {
    emit(
      state.copyWith(
        currentUrl: url,
        canGoBack: canGoBack,
      ),
    );
  }
}
