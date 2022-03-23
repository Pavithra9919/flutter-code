// import 'package:flutter/material.dart';
// import 'package:srmhoteladmin/config/app_colors.dart';
// import 'package:srmhoteladmin/helper/util/app_fonts.dart';
// import 'package:srmhoteladmin/helper/util/app_fontsize.dart';
//
// class AppTheme {
//   AppTheme._();
//
//   static final ThemeData appTheme = ThemeData(
//       fontFamily: FontName.robotoMono,
//       backgroundColor: AppColors.colorwhite,
//       brightness: Brightness.light,
//       appBarTheme:  AppBarTheme(
//           brightness: Brightness.light,
//           color: AppColors.primary,
//           iconTheme: IconThemeData(
//             color: AppColors.colorwhite,
//           ),
//           textTheme: TextTheme(
//               headline1: TextStyle(
//                   color: AppColors.colorwhite,
//                   fontSize: FONT_26,
//                   fontStyle: FontStyle.normal,
//                   fontFamily: FontName.robotoMono))));
// }
import 'package:flutter/material.dart';

import 'app_colors.dart';

ThemeData theme() {
  return ThemeData(
    scaffoldBackgroundColor: Colors.white,
    fontFamily: "Muli",
    appBarTheme: appBarTheme(),
    textTheme: textTheme(),
    inputDecorationTheme: inputDecorationTheme(),
    visualDensity: VisualDensity.adaptivePlatformDensity,
    primarySwatch: Colors.blue,
  );
}

InputDecorationTheme inputDecorationTheme() {
  OutlineInputBorder outlineInputBorder = OutlineInputBorder(
      borderRadius: BorderRadius.circular(28),
      borderSide: const BorderSide(color: AppColors.labeltextcolor),
      gapPadding: 10);
  return InputDecorationTheme(
    // floatingLabelBehavior: FloatingLabelBehavior.always,
      contentPadding: const EdgeInsets.symmetric(horizontal: 42, vertical: 20),
      enabledBorder: outlineInputBorder,
      focusedBorder: outlineInputBorder,
      border: outlineInputBorder);
}

TextTheme textTheme() {
  return const TextTheme(
      bodyText1: TextStyle(color: AppColors.labeltextcolor),
      bodyText2: TextStyle(color: AppColors.labeltextcolor));
}

AppBarTheme appBarTheme() {
  return const AppBarTheme(
      backgroundColor: AppColors.primary,
      brightness: Brightness.light,
      elevation: 0,
      iconTheme: IconThemeData(color: Colors.black),
      textTheme: TextTheme(
        headline6: TextStyle(
          color: Color(0XFF8B8B8B),
          fontSize: 18,
        ),
      ));
}
