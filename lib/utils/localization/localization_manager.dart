import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import '../constants/app_colors.dart';
import '../extensions/sizedbox_extension.dart';
import '../themes/app_text_style.dart';

class LocalizationManager {
  static final LocalizationManager _instance = LocalizationManager._internal();
  factory LocalizationManager() => _instance;
  LocalizationManager._internal();

  static LocalizationManager get instance => _instance;

  static const String _languageKey = 'selected_language';
  final GetStorage _storage = GetStorage();

  static const List<Locale> supportedLocales = [
    Locale('en'),
    Locale('mr'),
    Locale('hi'),
  ];

  static const Locale defaultLocale = Locale('en');

  Locale _currentLocale = defaultLocale;
  Locale get currentLocale => _currentLocale;
  final ValueNotifier<Locale> localeNotifier = ValueNotifier(defaultLocale);

  Future<void> initialize() async {
    try {
      final savedLanguage = _storage.read(_languageKey);

      if (savedLanguage != null) {
        final matchingLocale = supportedLocales.firstWhere(
          (locale) => locale.languageCode == savedLanguage,
          orElse: () => defaultLocale,
        );
        _currentLocale = matchingLocale;
      } else {
        _currentLocale = defaultLocale;
      }
      localeNotifier.value = _currentLocale;
    } catch (e) {
      debugPrint('Error initializing LocalizationManager: $e');
      _currentLocale = defaultLocale;
      localeNotifier.value = _currentLocale;
    }
  }

  Future<void> changeLocale(Locale locale) async {
    try {
      if (isLocaleSupported(locale)) {
        _currentLocale = locale;
        await _storage.write(_languageKey, locale.languageCode);
        localeNotifier.value = locale;
      }
    } catch (e) {
      debugPrint('Error changing locale: $e');
    }
  }

  bool isLocaleSupported(Locale locale) {
    return supportedLocales.any(
      (supportedLocale) => supportedLocale.languageCode == locale.languageCode,
    );
  }

  String getCurrentLanguageName() {
    switch (_currentLocale.languageCode) {
      case 'mr':
        return 'मराठी';
      case 'hi':
        return 'हिंदी';
      case 'en':
      default:
        return 'English';
    }
  }

  List<Map<String, String>> getAvailableLanguages() {
    return [
      {'code': 'en', 'name': 'English'},
      {'code': 'mr', 'name': 'मराठी'},
      {'code': 'hi', 'name': 'हिंदी'},
    ];
  }

  void showLanguageBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      backgroundColor: AppColors.black,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(26.0)),
      ),
      builder: (context) {
        return Container(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Select Language',
                style: AppTextStyle.veryLargeHeader.copyWith(
                  color: AppColors.black,
                  fontSize: 18,
                ),
              ),
              16.height,
              ...getAvailableLanguages().map((lang) {
                final isSelected = _currentLocale.languageCode == lang['code'];
                return InkWell(
                  onTap: () {
                    changeLocale(Locale(lang['code']!));
                    Navigator.pop(context);
                  },
                  child: Container(
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    decoration: BoxDecoration(
                      border: Border(
                        bottom: BorderSide(
                          color: AppColors.black.withValues(alpha: 0.2),
                        ),
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          lang['name']!,
                          style: AppTextStyle.veryLargeHeader.copyWith(
                            color: isSelected
                                ? AppColors.black
                                : AppColors.black,
                            fontSize: 16,
                          ),
                        ),
                        if (isSelected)
                          Icon(Icons.check_circle, color: AppColors.black),
                      ],
                    ),
                  ),
                );
              }),
              24.height,
            ],
          ),
        );
      },
    );
  }
}
