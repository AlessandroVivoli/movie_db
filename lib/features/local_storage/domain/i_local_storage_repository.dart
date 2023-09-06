import 'dart:ui';

abstract class ILocalStorageRepository {
  String? getSessionId();

  void setSessionId(String? sessionId);

  Locale getLocale();

  void setLocale(Locale locale);
}
