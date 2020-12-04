import 'package:data/data.dart';
import 'package:data/repository/network_bound_resource.dart';
import 'package:domain/domain.dart';

import '../cache/cache.dart';
import '../net/net.dart';

class UserDataRepository implements UserRepository {
  final AuthClient authClient;
  final UserCache userCache;

  const UserDataRepository(this.authClient, this.userCache)
      : assert(authClient != null),
        assert(userCache != null);

  @override
  Stream<User> login(final String username, final String password) {
    assert(username != null);
    assert(password != null);

    return authClient.authenticate(username, password).asStream();
  }

  @override
  Stream<User> getCurrentUser() {
    return NetworkBoundResources<UserEntity>(
      fromCache: userCache.getCurrentUser,
      fromApi: () => authClient.getCurrentUser().asStream(),
      shouldCallApi: (data) => true,
      saveApiResult: (data) async => await userCache.putAuthUser(data),
    ).asStream();
  }
}
