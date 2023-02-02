import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../dio/provider/dio_provider.dart';
import '../data/account_service.dart';
import '../domain/i_account_service.dart';

final accountServiceProvider = Provider<IAccountService>(
  (ref) => AccountService(ref.watch(dioProvider)),
);
