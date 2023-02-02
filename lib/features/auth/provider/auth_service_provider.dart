import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../dio/provider/dio_provider.dart';
import '../data/auth_service.dart';
import '../domain/i_auth_service.dart';

final authServiceProvider = Provider<IAuthService>(
  (ref) => AuthService(ref.watch(dioProvider)),
);
