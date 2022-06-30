import 'package:cocktail_party/constants/color_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../models/cocktail.dart';

class CocktailDetails extends StatelessWidget {
  const CocktailDetails({Key? key,required this.cocktailDetails}) : super(key: key);
  final Cocktail cocktailDetails;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar:true,
      appBar:AppBar(
        leading: IconButton(
          onPressed: (){
            Navigator.pop(context);
          },
          icon: Icon(Icons.chevron_left,size: 30,),
        ),
        backgroundColor: ColorConstants.transparent,
        elevation: 0,
      ) ,
      body: Stack(
        children: [
          Image.network(cocktailDetails.strDrinkThumb.toString(),
          ),
          Positioned(
            bottom: 0,
            right: 0,
            child: Container(
              decoration: BoxDecoration(
                  color: ColorConstants.primaryColor,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20.r),
                    topRight: Radius.circular(20.r))
              ),
              width: 1.sw,
              height: 80.h,
            ),
          )
        ],
      ),

    );
  }
}
