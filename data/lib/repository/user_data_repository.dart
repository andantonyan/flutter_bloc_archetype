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
    return authClient.getCurrentUser().asStream();
  }
}
