import 'package:shared_preferences/shared_preferences.dart';

import '../domain/i_local_storage_repository.dart';

class LocalStorageRepository implements ILocalStorageRepository {
  final SharedPreferences _preferences;

  LocalStorageRepository(this._preferences);

  @override
  String? getSessionId() {
    return _preferences.getString('session_id');
  }

  @override
  void setSessionId(String? sessionId) {
    if (sessionId == null) {
      _preferences.remove('session_id');

      return;
    }

    _preferences.setString('session_id', sessionId);
  }
}
