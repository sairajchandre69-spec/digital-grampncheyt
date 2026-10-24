import 'package:flutter/widgets.dart';

extension Sized on num {
    SizedBox get height => SizedBox(
          height: toDouble(),
        );
    SizedBox get width => SizedBox(
          width: toDouble(),
        );
  }

extension SizedBoxExtension on int {
  SizedBox toHeight() {
    switch (this) {
      case 2:
        return const SizedBox(height: 2);
      case 4:
        return const SizedBox(height: 4);
      case 6:
        return const SizedBox(height: 6);
      case 8:
        return const SizedBox(height: 8);
      case 10:
        return const SizedBox(height: 10);
      case 12:
        return const SizedBox(height: 12);
      case 14:
        return const SizedBox(height: 14);
      case 16:
        return const SizedBox(height: 16);
      case 18:
        return const SizedBox(height: 18);
      case 20:
        return const SizedBox(height: 20);
      case 22:
        return const SizedBox(height: 22);
      case 24:
        return const SizedBox(height: 24);
      case 26:
        return const SizedBox(height: 26);
      case 28:
        return const SizedBox(height: 28);
      case 30:
        return const SizedBox(height: 30);
      case 32:
        return const SizedBox(height: 32);
      default:
        return const SizedBox(height: 0);
    }
  }}
  
  extension StringCasingExtension on String {
  String capitalizeFirst() {
    if (isEmpty) return this;
    return this[0].toUpperCase() + substring(1);
  }

  String capitalizeEachWord() {
    return split(" ")
        .map((word) => word.capitalizeFirst())
        .join(" ");
  }

}