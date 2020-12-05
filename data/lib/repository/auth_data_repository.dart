import 'package:data/data.dart';
import 'package:domain/domain.dart';

import '../cache/cache.dart';
import '../net/net.dart';
import 'network_bound_resource.dart';

class AuthDataRepository implements AuthRepository {
  final AuthClient _authClient;
  final UserCache _userCache;

  const AuthDataRepository(this._authClient, this._userCache)
      : assert(_authClient != null),
        assert(_userCache != null);

  @override
  Future<User> login(final String username, final String password) {
    assert(username != null);
    assert(password != null);

    return _authClient.login(username, password);
  }

  @override
  Stream<User> getCurrentUserStream() {
    return NetworkBoundResources<UserEntity>(
      fromCache: _userCache.getCurrentUser,
      fromApi: () => _authClient.getCurrentUser().asStream(),
      shouldCallApi: (data) => true,
      saveApiResult: (data) async => await _userCache.putAuthUser(data),
    ).asStream();
  }
}
