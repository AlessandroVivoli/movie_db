abstract class IAccountAvatarService {
  /// Returns a gravatar url using the provided gravatar [hash]
  ///
  /// If [size] is provided it will scale image accordingly.
  String getAccountAvatar({required String hash, int? size});
}
