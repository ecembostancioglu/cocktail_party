import 'package:cocktail_party/network/dio_client.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  DioClient _dioClient=DioClient();

  @override
  void initState() {
    _dioClient.getCocktail();
    super.initState();

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
