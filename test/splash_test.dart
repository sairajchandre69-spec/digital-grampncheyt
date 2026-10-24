import 'package:flutter/material.dart';
import 'package:flutter_folder_structure/features/splash/view/splash_screen.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('SplashScreen renders logo and title text at top',
      (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: SplashScreen(),
      ),
    );

    // Verify Title and subtitle
    expect(find.text('Digital'), findsOneWidget);
    expect(find.text('Grampanchayat'), findsOneWidget);
    expect(find.text('आपली ग्रामपंचायत, आपली जबाबदारी!'), findsOneWidget);

    await tester.pump(const Duration(seconds: 1));
  });
}
