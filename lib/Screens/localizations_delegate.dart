import 'package:flutter/material.dart';
import 'language_da.dart';
import 'language_de.dart';
import 'language_en.dart';
import 'language_fr.dart';
import 'languages.dart';



class AppLocalizationsDelegate extends LocalizationsDelegate<Languages> {
  const AppLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) => ['en','da','de','fr'].contains(locale.languageCode);

  @override
  Future<Languages> load(Locale locale) => _load(locale);

  static Future<Languages> _load(Locale locale) async {
    switch (locale.languageCode) {
      case 'en':
        return LanguageEn();

      case 'de':
        return LanguageDe();

      case 'da':
        return LanguageDa();

      case 'fr':
        return LanguageFr();

      default:
        return LanguageEn();
    }
  }

  @override
  bool shouldReload(LocalizationsDelegate<Languages> old) => false;
}