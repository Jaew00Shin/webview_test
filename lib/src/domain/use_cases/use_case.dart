abstract class UseCase<T, P> {
  T call(P request);
}

abstract class FutureUseCase<T, P> {
  Future<T> call(P request);
}

abstract class StreamUseCase<T, P> {
  Stream<T> call(P request);
}