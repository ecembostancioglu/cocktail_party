import 'package:flutter/material.dart';

class NonAlcoholicCard extends StatelessWidget {
  const NonAlcoholicCard({Key? key,required this.nonAlcoholicCocktail}) : super(key: key);
  final dynamic nonAlcoholicCocktail;
  @override
  Widget build(BuildContext context) {
    return  ClipRRect(
        borderRadius: BorderRadius.circular(20.0),
        child:Image.network(nonAlcoholicCocktail.strDrinkThumb.toString(),));
  }
}
