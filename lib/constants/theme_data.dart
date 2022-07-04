import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'color_constants.dart';

class BuildThemeData{
  final themeData = ThemeData(
    fontFamily:'Georgia',
    primaryColor:ColorConstants.themeColor,
    scaffoldBackgroundColor: ColorConstants.primaryColor,
    textTheme: TextTheme(
        headline1: TextStyle(fontSize: 22.sp, fontWeight: FontWeight.bold),
        headline5: TextStyle(fontSize: 14.sp, color: ColorConstants.primaryColor),
        headline4: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.w600,color: ColorConstants.black),
        headline6: TextStyle(fontSize: 18.sp),
        bodyText2: TextStyle(fontSize: 14.sp)
    ),
  );

}