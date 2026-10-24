import 'package:flutter/foundation.dart';

import '../../../utils/constants/app_images.dart';
import '../model/onboarding_model.dart';

class OnboardingController extends ChangeNotifier {
  static const List<OnboardingItem> items = [
    OnboardingItem(
      title: 'ग्रामपंचायत सेवा\nएका App मध्ये',
      description: 'सर्व सेवा डिजिटल पद्धतीने\nआता तुमच्या मोबाईल मध्ये.',
      imagePath: AppImages.onboarding1Image,
      buttonText: 'Next',
      skipText: 'Skip',
    ),
    OnboardingItem(
      title: 'तक्रार ऑनलाइन\nदाखल करा व\nTrack करा',
      description: 'तुमची तक्रार नोंदवा आणि तिची\nस्थिती सहज पहा.',
      imagePath: AppImages.onboarding2Image,
      buttonText: 'Next',
      skipText: 'Skip',
    ),
    OnboardingItem(
      title: 'योजना, प्रमाणपत्रे\nआणि इतर सेवा\nऑनलाइन',
      description: 'शासकीय योजनांचा लाभ घ्या आणि\nप्रमाणपत्रे घरबसल्या मिळवा.',
      imagePath: AppImages.onboarding3Image,
      buttonText: 'Get Started',
      skipText: 'Skip',
    ),
  ];

  int _currentPage = 0;

  int get currentPage => _currentPage;
  bool get isLastPage => _currentPage == items.length - 1;

  void setCurrentPage(int page) {
    if (page == _currentPage || page < 0 || page >= items.length) {
      return;
    }

    _currentPage = page;
    notifyListeners();
  }
}
