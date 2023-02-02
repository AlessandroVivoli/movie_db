import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../dio/provider/dio_provider.dart';
import '../data/account_service.dart';
import '../domain/i_account_service.dart';

part 'account_service_provider.g.dart';

@riverpod
IAccountService accountService(AccountServiceRef ref) {
  return AccountService(ref.watch(dioProvider));
}
