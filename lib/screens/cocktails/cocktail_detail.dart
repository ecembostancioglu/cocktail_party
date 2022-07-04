import 'package:cocktail_party/constants/color_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../models/cocktail.dart';

class CocktailDetails extends StatelessWidget {
  const CocktailDetails({Key? key,required this.cocktailDetails}) : super(key: key);
  final Cocktail cocktailDetails;

  @override
  Widget build(BuildContext context) {


    int a=1;
    if(a>=1 || a<7){
      a++;
      print('cocktailDetails.strIngredient${a}.toString()');
    }




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
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                Image.network(
                  cocktailDetails.strDrinkThumb.toString(),
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
                    height: 60.h,
                    child: Center(
                        child: Text(cocktailDetails.strDrink.toString(),
                        style: Theme.of(context).textTheme.headline4)),
                  ),
                ),
              ],
            ),
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      children: [
                        Image.asset('assets/images/ordinary.png',
                        width: 75.w,height: 75.h),
                        Text(cocktailDetails.strAlcoholic.toString(),
                        style: Theme.of(context).textTheme.headline6)
                      ],
                    ),
                    Column(
                      children: [
                        Image.asset('assets/images/drink.png',
                            width: 75.w,height: 75.h),
                        Text(cocktailDetails.strCategory.toString(),
                            style: Theme.of(context).textTheme.headline6)
                      ],
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Text(cocktailDetails.strInstructions.toString()),
                ),
               Row(
                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
                 children: [
                   Padding(padding: const EdgeInsets.all(20.0),
                     child: Text(cocktailDetails.strIngredient1.toString()),),
                   Padding(padding: const EdgeInsets.all(20.0),
                     child: Text(cocktailDetails.strMeasure1.toString()),),
                 ],
               ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(padding: const EdgeInsets.all(20.0),
                      child: Text(cocktailDetails.strIngredient2.toString()),),
                    Padding(padding: const EdgeInsets.all(20.0),
                      child: Text(cocktailDetails.strMeasure2.toString()),),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(padding: const EdgeInsets.all(20.0),
                      child: Text(cocktailDetails.strIngredient3.toString()),),
                    Padding(padding: const EdgeInsets.all(20.0),
                      child: Text(cocktailDetails.strMeasure3.toString()),),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(padding: const EdgeInsets.all(20.0),
                      child: Text(cocktailDetails.strIngredient4.toString()),),
                    Padding(padding: const EdgeInsets.all(20.0),
                      child: Text(cocktailDetails.strMeasure4.toString()),),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(padding: const EdgeInsets.all(20.0),
                      child: Text(cocktailDetails.strIngredient5.toString()),),
                    Padding(padding: const EdgeInsets.all(20.0),
                      child: Text(cocktailDetails.strMeasure5.toString()),),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(padding: const EdgeInsets.all(20.0),
                      child: Text(cocktailDetails.strIngredient6.toString()),),
                    Padding(padding: const EdgeInsets.all(20.0),
                      child: Text(cocktailDetails.strMeasure6.toString()),),
                  ],
                ),
              ],
            )
          ],
        ),
      ),

    );
  }
}
