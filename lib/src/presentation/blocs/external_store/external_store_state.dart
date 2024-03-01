part of 'external_store_cubit.dart';

@freezed
class ExternalStoreState with _$ExternalStoreState {
  const factory ExternalStoreState({
    String? couponUrl,
    int? couponId,
    int? dealId,
  }) = _ExternalStoreState;
}

extension ExternalStoreStateX on ExternalStoreState {
  bool get isExist => couponUrl != null || dealId != null;

  Uri? get detailUrl => switch (this) {
        ExternalStoreState(:final couponUrl, :final couponId)
            when couponUrl != null =>
          getStoreEndUrl(couponUrl: couponUrl, couponId: couponId),
        ExternalStoreState(:final dealId) when dealId != null =>
          getDealEndUrl(dealId: dealId),
        _ => null,
      };
}
