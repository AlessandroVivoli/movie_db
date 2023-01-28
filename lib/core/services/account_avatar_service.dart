import 'package:flutter_dotenv/flutter_dotenv.dart';

import '../interfaces/i_account_avatar_service.dart';

class AccountAvatarService implements IAccountAvatarService {
  @override
  String getAccountAvatar({required String hash, int? size}) {
    var sizeString = '';

    if (size != null) {
      sizeString = '?s=$size';
    }

    return '${dotenv.get('BASE_GRAVATAR_URL')}$hash$sizeString';
  }
}
