import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../data/account_avatar_service.dart';
import '../domain/i_account_avatar_service.dart';

part 'account_avatar_service_provider.g.dart';

@Riverpod(keepAlive: true)
IAccountAvatarService accountAvatarService(AccountAvatarServiceRef ref) {
  return AccountAvatarService();
}
