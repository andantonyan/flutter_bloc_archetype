import 'dart:async';

import 'package:data/data.dart';
import 'package:domain/domain.dart';
import 'package:rxdart/rxdart.dart';

import '../../cache/cache.dart';
import '../../net/net.dart';

class AuthDataRepository implements AuthRepository {
  final AuthClient _authClient;
  final UserCache _userCache;

  StreamController<User> _userStream;

  AuthDataRepository(this._authClient, this._userCache)
      : assert(_authClient != null),
        assert(_userCache != null) {
    _userStream = StreamController<User>(onListen: () => _userStream.add(null));
  }

  @override
  Future<User> login(final String username, final String password) async {
    assert(username != null);
    assert(password != null);

    final user = await _authClient.login(username, password);
    _userStream.add(user);

    return user;
  }

  @override
  Future<void> logout() async {
    _userStream.add(null);
  }

  @override
  Stream<User> getCurrentUserStream() {
    return ConcatStream([
      _userStream.stream,
      _authClient.getCurrentUser().asStream(),
    ]);
  }
}
