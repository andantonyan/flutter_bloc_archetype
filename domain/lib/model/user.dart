class User {
  final String id;
  final String username;

  const User(this.id, this.username);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is User && runtimeType == other.runtimeType && id == other.id && username == other.username;

  @override
  int get hashCode => id.hashCode ^ username.hashCode;

  @override
  String toString() {
    return 'User{id: $id, username: $username}';
  }
}
