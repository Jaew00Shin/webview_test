import 'package:freezed_annotation/freezed_annotation.dart';

part 'response_entity.g.dart';
part 'response_entity.freezed.dart';

@Freezed(genericArgumentFactories: true)
class ResponseEntity<T> with _$ResponseEntity<T> {
  const factory ResponseEntity({
    @Default('') String code,
    @Default('') String message,
    T? result,
  }) = _ResponseEntity<T>;

  factory ResponseEntity.fromJson(
          Map<String, dynamic> json, T Function(Object? object) fromJsonT) =>
      _$ResponseEntityFromJson(json, fromJsonT);
}
