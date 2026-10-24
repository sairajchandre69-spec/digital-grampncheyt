import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get_storage/get_storage.dart';

import '../utils/localization/app_localizations.dart';
import '../utils/localization/localization_manager.dart';
import '../utils/themes/app_text_style.dart';
import '../utils/navigation/app_router.dart';
import 'environment_config.dart';

class AppLoader {
  Future<void> loadApp(String path) async {
    WidgetsFlutterBinding.ensureInitialized();
    runApp(const MyApp());

    await dotEnv.load(fileName: path);
    await GetStorage.init();
    await LocalizationManager.instance.initialize();
    await GetStorage().write('api_base_url', EnvironmentConfig.baseUrlApi);
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: LocalizationManager.instance.localeNotifier,
      builder: (context, locale, child) {
        return MaterialApp.router(
          title: 'Flutter Demo',
          debugShowCheckedModeBanner: false,
          locale: locale,
          supportedLocales: LocalizationManager.supportedLocales,
          localizationsDelegates: const [
            AppLocalizations.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          theme: ThemeData(
            fontFamily: AppTextStyle.fontFamily,
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          ),
          routerConfig: AppRouter.router,
        );
      },
    );
  }
}
