import 'package:flutter/material.dart';
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

  @override
  Locale getLocale() {
    var locale = _preferences.getString('locale');

    if (locale == null) {
      locale = 'en';

      _preferences.setString('locale', locale);
    }

    return Locale.fromSubtags(languageCode: locale);
  }

  @override
  void setLocale(Locale locale) {
    _preferences.setString('locale', locale.languageCode);
  }
}
