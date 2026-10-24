import 'package:flutter/material.dart';
import 'package:flutter_folder_structure/features/home/veiw/home_screen.dart';
import 'package:go_router/go_router.dart';

import '../../features/langunge/view/language_screen.dart';
import '../../features/login/view/login_screen.dart';
import '../../features/onboarding/view/onboarding_screen.dart';
import '../../features/splash/view/splash_screen.dart';
import 'app_routes.dart';

class AppRouter {
  AppRouter._();

  static final GoRouter router = GoRouter(
    initialLocation: AppRoutes.defaultLocation,
    errorBuilder: (context, state) => Scaffold(
      appBar: AppBar(title: const Text('त्रुटी / Error')),
      body: Center(
        child: Text('पृष्ठ आढळले नाही: ${state.uri}'),
      ),
    ),
    routes: [
      GoRoute(
        path: AppRoutes.defaultLocation,
        builder: (context, state) => const SplashScreen(),
      ),
      GoRoute(
        path: AppRoutes.onboarding,
        builder: (context, state) => const OnboardingScreen(),
      ),
      GoRoute(
        path: AppRoutes.language,
        builder: (context, state) => const LanguageScreen(),
      ),
       GoRoute(
        path: AppRoutes.login,
        builder: (context, state) => const LoginScreen(),
      ),
      GoRoute(
        path: AppRoutes.Home,
        builder: (context, state) => const HomeScreen(),
      ),
    ],
     );
}
