class OnboardingItem {
  final String title;
  final String description;
  final String imagePath;
  final String buttonText;
  final String skipText;

  const OnboardingItem({
    required this.title,
    required this.description,
    required this.imagePath,
    required this.buttonText,
    this.skipText = 'Skip',
  });
}
