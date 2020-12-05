import 'use_case.dart';

abstract class UseCaseFuture<T, Params> extends UseCase<T, Params> {
  Future<T> execute(Params params);
}
