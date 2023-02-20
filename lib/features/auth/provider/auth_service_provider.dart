import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../dio/provider/dio_provider.dart';
import '../data/auth_service.dart';
import '../domain/i_auth_service.dart';

part 'auth_service_provider.g.dart';

@Riverpod(keepAlive: true)
IAuthService authService(AuthServiceRef ref) {
  return AuthService(ref.read(dioProvider));
}
