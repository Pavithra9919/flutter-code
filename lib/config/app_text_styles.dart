import 'package:flutter/material.dart';
import 'package:srmhoteladmin/config/app_colors.dart';

class AppTextStyles {
  AppTextStyles._();

  static TextStyle get onPrimaryTitleText {
    return const TextStyle(
        color: AppColors.colorwhite, fontWeight: FontWeight.w600);
  }

  static TextStyle get onPrimarySubTitleText {
    return const TextStyle(
      color: AppColors.colorwhite,
    );
  }

  static TextStyle defaultStyle = TextStyle(color: Colors.grey[900]);
  static TextStyle p = defaultStyle.copyWith(
    fontSize: 16.0,
  );

  static TextStyle whiteSubHeadingTextStyle = TextStyle(
    fontSize: 18.0,
    color: Colors.white,
    fontWeight: FontWeight.w400,
  );
  static TextStyle subTitleStyle = TextStyle(
    fontSize: 18.0,
    color: AppColors.secondaryTextColor,
    fontWeight: FontWeight.w200,
  );

  static TextStyle titleStyle = TextStyle(
    fontSize: 8.0,
    color: AppColors.primary,
    fontWeight: FontWeight.w100,
  );
  static TextStyle register_title_style = const TextStyle(
      fontSize: 28.0, color: Colors.black, fontWeight: FontWeight.bold);

  static TextStyle menu_text =
      const TextStyle(fontSize: 8.0, color: Colors.black);
}
