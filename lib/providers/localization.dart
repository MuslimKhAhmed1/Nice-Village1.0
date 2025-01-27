import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

// class LanguageProvider with ChangeNotifier {
//   Locale _currentLocale = const Locale('en');

//   Locale get currentLocale => _currentLocale;

//   void setLocale(Locale locale) {
//     _currentLocale = locale;
//     notifyListeners();
//   }
// }

class LocaleProvider extends ChangeNotifier {
  static const String _languageCodeKey = 'language_code';
  Locale _locale = const Locale('en');

  Locale get locale => _locale;
  LocaleProvider() {
    _loadSavedLanguage();
  }
  // void setLocale(Locale newLocale) {
  //   _locale = newLocale;
  //   notifyListeners();
  // }
  Future<void> _loadSavedLanguage() async {
    final prefs = await SharedPreferences.getInstance();
    String? savedLanguageCode = prefs.getString(_languageCodeKey);

    if (savedLanguageCode != null) {
      _locale = Locale(savedLanguageCode);
      notifyListeners();
    }
  }

  Future<void> setLocale(Locale locale) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_languageCodeKey, locale.languageCode);

    _locale = locale;
    notifyListeners();
  }

  bool get hasSelectedLanguage {
    return _locale.languageCode != 'en'; // Default is English
  }
}

// class LanguageProvider extends ChangeNotifier {
//   static const String _languageCodeKey = 'language_code';
//   Locale _currentLocale = const Locale('en');

//   LanguageProvider() {
//     _loadSavedLanguage();
//   }

//   Locale get currentLocale => _currentLocale;

//   Future<void> _loadSavedLanguage() async {
//     final prefs = await SharedPreferences.getInstance();
//     String? savedLanguageCode = prefs.getString(_languageCodeKey);

//     if (savedLanguageCode != null) {
//       _currentLocale = Locale(savedLanguageCode);
//       notifyListeners();
//     }
//   }

//   Future<void> setLocale(Locale locale) async {
//     final prefs = await SharedPreferences.getInstance();
//     await prefs.setString(_languageCodeKey, locale.languageCode);

//     _currentLocale = locale;
//     notifyListeners();
//   }

//   bool get hasSelectedLanguage {
//     return _currentLocale.languageCode != 'en'; // Default is English
//   }
// }
