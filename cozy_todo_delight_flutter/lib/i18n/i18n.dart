import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';

class I18n extends ChangeNotifier {
  static I18n? _instance;
  Map<String, dynamic> _strings = {};
  Locale _currentLocale = const Locale('en');
  static const String _localeKey = 'current_locale';

  static final List<Locale> supportedLocales = [
    const Locale('en'),
    const Locale('ar'),
  ];

  I18n._() {
    _loadCurrentLocale();
  }

  static Future<I18n> getInstance() async {
    if (_instance == null) {
      _instance = I18n._();
      await _instance!._loadStrings();
    }
    return _instance!;
  }

  Locale get currentLocale => _currentLocale;

  Future<void> _loadCurrentLocale() async {
    final prefs = await SharedPreferences.getInstance();
    final localeCode = prefs.getString(_localeKey) ?? 'en';
    _currentLocale = Locale(localeCode);
  }

  Future<void> setLocale(Locale locale) async {
    if (!supportedLocales.contains(locale)) return;

    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_localeKey, locale.languageCode);
    _currentLocale = locale;
    await _loadStrings();
    notifyListeners();
  }

  Future<void> toggleLocale() async {
    final newLocale = _currentLocale.languageCode == 'en' ? const Locale('ar') : const Locale('en');
    await setLocale(newLocale);
  }

  Future<void> _loadStrings() async {
    final jsonString = await rootBundle.loadString('assets/i18n/${_currentLocale.languageCode}.json');
    _strings = json.decode(jsonString);
  }

  String get(String key) {
    List<String> keys = key.split('.');
    dynamic value = _strings;

    for (String k in keys) {
      if (value is Map && value.containsKey(k)) {
        value = value[k];
      } else {
        return key; // Return the key if translation is not found
      }
    }

    if (value is String) {
      return value;
    }
    return key;
  }

  static String of(String key) {
    if (_instance == null) {
      return key;
    }
    return _instance!.get(key);
  }

  static I18n? get instance => _instance;
}


