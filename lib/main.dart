import 'package:cocktail_party/constants/theme_data.dart';
import 'package:cocktail_party/screens/home_page.dart';
import 'package:cocktail_party/widgets/collections/non_alcoholic/non_alcoholic.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      builder: (context,child) => MaterialApp(
        debugShowCheckedModeBanner:false,
        theme: BuildThemeData().themeData,
        home: HomePage(),
      ),
      designSize:const Size(360,640),
    );
  }
}

