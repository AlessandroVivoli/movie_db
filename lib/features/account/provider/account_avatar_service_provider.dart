import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../data/account_avatar_service.dart';
import '../domain/i_account_avatar_service.dart';

final accountAvatarServiceProvider = Provider<IAccountAvatarService>(
  (ref) => AccountAvatarService(),
);
