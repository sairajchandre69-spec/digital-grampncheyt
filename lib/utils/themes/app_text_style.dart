import 'package:flutter/material.dart';

import '../constants/app_colors.dart';



class AppTextStyle {
    const AppTextStyle._();
  static const String fontFamily = "Figtree";
  static TextStyle regularTextStyle = const TextStyle(fontFamily: 'Figtree');

  static TextStyle veryLargeHeader = TextStyle(color: AppColors.black, fontSize: 24.0, fontWeight: FontWeight.w700, fontFamily: fontFamily);

  static TextStyle largeHeader =  TextStyle(color: AppColors.black, fontSize: 18.0, fontWeight: FontWeight.w700, fontFamily: fontFamily);

  static TextStyle mediumHeader =  TextStyle(color: AppColors.black, fontSize: 14.0, fontWeight: FontWeight.w600, fontFamily: fontFamily);

  static TextStyle smallHeader =  TextStyle(color: AppColors.black, fontSize: 14.0, fontWeight: FontWeight.w700, fontFamily: fontFamily);

  static TextStyle largeNormalText =  TextStyle(color: AppColors.black, fontSize: 16.0, fontWeight: FontWeight.w500, fontFamily: fontFamily);

  static TextStyle mediumNormalText =  TextStyle(color: AppColors.black, fontSize: 14.0, fontWeight: FontWeight.w500, fontFamily: fontFamily);

  static TextStyle smallNormalText =  TextStyle(color: AppColors.black, fontSize: 12.0, fontWeight: FontWeight.w500, fontFamily: fontFamily);

  // static TextStyle hintStyle =  TextStyle(color: AppColors.hintTextColor, fontSize: 14.0, fontWeight: FontWeight.w500, fontFamily: fontFamily);
}
