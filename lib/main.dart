import 'package:cocktail_party/screens/home_page.dart';
import 'package:cocktail_party/screens/search_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'constants/color_constants.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      builder: (context,child) => MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primaryColor: ColorConstants.themeColor,
          scaffoldBackgroundColor:ColorConstants.themeColor,
          fontFamily:'Georgia',
          textTheme: TextTheme(
              headline1: TextStyle(fontSize: 22.sp, fontWeight: FontWeight.bold),
              headline6: TextStyle(fontSize: 18.sp),
              bodyText2: TextStyle(fontSize: 14.sp)
          ),
        ),
        home: HomePage(),
      ),
      designSize:const Size(360,640),
    );
  }
}

