import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../interfaces/i_auth_service.dart';
import '../notifiers/auth_notifier.dart';
import '../services/auth_service.dart';
import '../unions/auth_state.dart';
import 'dio_provider.dart';

final authServiceProvider = Provider<IAuthService>(
  (ref) => AuthService(ref.read(dioProvider)),
);

final authProvider = NotifierProvider<AuthNotifier, AuthState>(() {
  return AuthNotifier();
});
