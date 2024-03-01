import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:webview_test/src/utils/utils.dart';

part 'external_store_state.dart';
part 'external_store_cubit.freezed.dart';

@injectable
class ExternalStoreCubit extends Cubit<ExternalStoreState> {
  ExternalStoreCubit({
    @factoryParam ExternalStoreState? state,
  }) : super(state ?? const ExternalStoreState());

  void setState({
    String? couponUrl,
    int? couponId,
    int? dealId,
  }) {
    emit(
      state.copyWith(couponId: couponId, couponUrl: couponUrl, dealId: dealId),
    );
  }
}
