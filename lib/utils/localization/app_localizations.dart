import 'package:flutter/material.dart';
import 'languages/english_language.dart';
import 'languages/hindi_language.dart';
import 'languages/marathi_language.dart';

class AppLocalizations {
  final Locale locale;

  AppLocalizations(this.locale);

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  Map<String, String> get _localizedStrings {
    switch (locale.languageCode) {
      case 'mr':
        return marathiStrings;
      case 'hi':
        return hindiStrings;
      case 'en':
      default:
        return englishStrings;
    }
  }

  String translate(String key) {
    return _localizedStrings[key] ?? key;
  }
  String get sangamnerAi => translate('sangamner_ai');
  
}


class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) {
    return ['mr', 'en', 'hi'].contains(locale.languageCode);
  }

  @override
  Future<AppLocalizations> load(Locale locale) async {
    return AppLocalizations(locale);
  }

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}
