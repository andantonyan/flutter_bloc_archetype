import 'dart:async';

import 'package:meta/meta.dart';

class NetworkBoundResources<T> {
  StreamController _result;

  NetworkBoundResources({
    @required Stream<T> Function() fromCache,
    @required Stream<T> Function() fromApi,
    @required bool shouldCallApi(T data),
    @required FutureOr saveApiResult(T data),
  }) {
    StreamSubscription cacheListener;
    StreamSubscription apiListener;

    _result = StreamController<T>(
      onCancel: () {
        cacheListener?.cancel();
        apiListener?.cancel();
      },
    );

    cacheListener = fromCache().listen((event) {
      if (event != null) {
        _result.sink.add(event);
      }

      if (shouldCallApi(event)) {
        apiListener = fromApi().listen((event) {
          _result.sink.add(event);
          saveApiResult(event);
        });
      }
    });
  }

  Stream<T> asStream() {
    return _result.stream;
  }
}
