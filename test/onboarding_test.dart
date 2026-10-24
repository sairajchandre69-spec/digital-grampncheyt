import 'package:flutter/material.dart';
import 'package:flutter_folder_structure/features/onboarding/controller/onboarding_controller.dart';
import 'package:flutter_folder_structure/features/onboarding/view/onboarding_screen.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('OnboardingScreen renders initial screen with Next and Skip',
      (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: OnboardingScreen(),
      ),
    );

    // Initial title
    expect(find.text(OnboardingController.items[0].title), findsOneWidget);
    expect(find.text('Skip'), findsOneWidget);
    expect(find.text('Next'), findsOneWidget);

    // Tap Next
    await tester.tap(find.text('Next'));
    await tester.pumpAndSettle();

    // Second screen
    expect(find.text(OnboardingController.items[1].title), findsOneWidget);
    expect(find.text('Next'), findsOneWidget);

    // Tap Next again
    await tester.tap(find.text('Next'));
    await tester.pumpAndSettle();

    // Third screen
    expect(find.text(OnboardingController.items[2].title), findsOneWidget);
    expect(find.text('Get Started'), findsOneWidget);
  });
}
