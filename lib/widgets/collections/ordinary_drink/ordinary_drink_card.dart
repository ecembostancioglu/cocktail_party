import 'package:flutter/material.dart';


class OrdinaryDrinkCard extends StatelessWidget {
  const OrdinaryDrinkCard({Key? key,required this.ordinaryDrink}) : super(key: key);
  final dynamic ordinaryDrink;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
        borderRadius: BorderRadius.circular(20.0),
        child:Image.network(ordinaryDrink.strDrinkThumb.toString(),));

  }
}
