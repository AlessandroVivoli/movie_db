import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../interfaces/i_account_avatar_service.dart';
import '../interfaces/i_account_service.dart';
import '../services/account_avatar_service.dart';
import '../services/account_service.dart';
import 'dio_provider.dart';

final accountServiceProvider =
    Provider<IAccountService>((ref) => AccountService(ref.read(dioProvider)));

final accountAvatarServiceProvider =
    Provider<IAccountAvatarService>((ref) => AccountAvatarService());
