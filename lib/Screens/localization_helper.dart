import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocalizationHelper {
  static Future<Locale> getCurrentLocale() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String languageCode = prefs.getString('language_code') ?? 'en';
    return Locale(languageCode);
  }

  static void setLocale(String languageCode) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('language_code', languageCode);
  }

  static Future<void> initializeLocalization() async {
    final Locale locale = await getCurrentLocale();
    Intl.defaultLocale = locale.languageCode;
  }
}
