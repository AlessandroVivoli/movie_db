import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../interfaces/i_auth_service.dart';
import '../services/auth_service.dart';

final authServiceProvider = Provider<IAuthService>((ref) => AuthService());
