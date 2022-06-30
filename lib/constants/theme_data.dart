import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'color_constants.dart';

class BuildThemeData{
  final themeData = ThemeData(
    fontFamily:'Georgia',
    primaryColor:ColorConstants.themeColor,
    scaffoldBackgroundColor: ColorConstants.primaryColor,
    textTheme:  TextTheme(
        headline1: TextStyle(fontSize: 22.sp, fontWeight: FontWeight.bold),
        headline5: TextStyle(fontSize: 16.sp,color: ColorConstants.primaryColor),
        headline6: TextStyle(fontSize: 18.sp),
        bodyText2: TextStyle(fontSize: 14.sp)
    ),
  );

}