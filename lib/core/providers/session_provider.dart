import 'package:shared_preferences/shared_preferences.dart';

class SessionProvider {
  static String? _sessionId;

  static late SharedPreferences _prefs;

  static Future<void> init() async {
    _prefs = await SharedPreferences.getInstance();

    _sessionId = _prefs.getString('session_id');
  }

  static String? get sessionId {
    return _sessionId;
  }

  static void setSession(String sessionId) {
    _prefs.setString('session_id', sessionId);

    _sessionId = sessionId;
  }

  static Future<bool> deleteSession() async {
    bool isDeleted = await _prefs.remove('session_id');

    if (isDeleted) {
      _sessionId = null;
    }

    return isDeleted;
  }
}
