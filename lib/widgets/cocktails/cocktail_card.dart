import 'dart:ui';
import 'package:cocktail_party/constants/color_constants.dart';
import 'package:cocktail_party/models/cocktail.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../screens/cocktails/cocktail_detail.dart';

class CocktailCard extends StatelessWidget {
  const CocktailCard({Key? key,required this.cocktail}) : super(key: key);
  final Cocktail cocktail;


  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: 100.w, height: 100.h,
        child: ClipRRect(
            borderRadius: BorderRadius.circular(20.0),
            child: GestureDetector(
                onTap: ()=>Navigator.push(context,
                    MaterialPageRoute(builder: (context)
                    => CocktailDetails(cocktailDetails: cocktail))),
                child: Stack(
                children: [
                  Image.network(cocktail.strDrinkThumb.toString()),
                  Positioned(
                      left: 15,
                      bottom: 5,
                      child: ClipRRect(
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        child: BackdropFilter(
                          filter:ImageFilter.blur(
                            sigmaX: 5.0,
                            sigmaY: 5.0,
                          ),
                          child: Container(
                            width: 130.w,
                            height: 36.h,
                            decoration:const BoxDecoration(
                                color: ColorConstants.blurColor,
                            ),
                            child: Align(
                              alignment: Alignment.center,
                              child: Text(cocktail.strDrink.toString(),
                                  textAlign: TextAlign.center,
                                  maxLines: 1,
                                  style:Theme.of(context).textTheme.headline5),
                            ),
                          ),
                        ),
                      )
                  )
                ],)
            )
        )
    );
  }
}
