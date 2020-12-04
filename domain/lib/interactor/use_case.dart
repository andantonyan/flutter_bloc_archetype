part of interactor;

abstract class UseCase<T, Params> {
  Stream<T> execute(Params params);
}

class NoParams {
  const NoParams();
}
