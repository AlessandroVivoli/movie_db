import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../interfaces/i_account_service.dart';
import '../../services/account_service.dart';
import '../dio/dio_provider.dart';

final accountServiceProvider = Provider<IAccountService>(
  (ref) => AccountService(ref.watch(dioProvider)),
);
