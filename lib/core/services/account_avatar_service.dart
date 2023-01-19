import 'package:flutter_dotenv/flutter_dotenv.dart';

class AccountAvatarService {
  /// Returns a gravatar url using the provided gravatar [hash]
  ///
  /// If [size] is provided it will scale image accordingly.\
  /// Defaults to `200`
  static String getAccountAvatar({required String hash, int? size}) {
    return '${dotenv.env['BASE_GRAVATAR_URL']}$hash?s=${size ?? 200}';
  }
}
