import 'dart:async';

import 'use_case.dart';

abstract class UseCaseStream<T, Params> extends UseCase<T, Params> {
  Stream<T> execute(Params params);
}
