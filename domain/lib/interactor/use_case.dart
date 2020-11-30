part of interactor;

abstract class UseCase<T, Params> {
  Stream<T> execute(Params params);
}
