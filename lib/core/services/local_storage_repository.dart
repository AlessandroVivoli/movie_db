import 'package:shared_preferences/shared_preferences.dart';

class LocalStorageRepository {
  final SharedPreferences _preferences;

  LocalStorageRepository(this._preferences);

  String? getSessionId() {
    return _preferences.getString('session_id');
  }

  void setSessionId(String? sessionId) {
    if (sessionId == null) {
      _preferences.remove('session_id');

      return;
    }

    _preferences.setString('session_id', sessionId);
  }
}
