import 'package:cocktail_party/constants/color_constants.dart';
import 'package:cocktail_party/screens/main_screen.dart';
import 'package:cocktail_party/screens/search_page.dart';
import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor:ColorConstants.themeColor,
      ),
      home: MainScreen(),
    );
  }
}