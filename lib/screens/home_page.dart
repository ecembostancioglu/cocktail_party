
import 'package:cocktail_party/constants/text_constants.dart';
import 'package:cocktail_party/screens/alcoholic.dart';
import 'package:cocktail_party/screens/cocktails.dart';
import 'package:cocktail_party/screens/non_alcoholic.dart';
import 'package:cocktail_party/screens/ordinary_drinks.dart';
import 'package:cocktail_party/screens/the_best_cocktails.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 5,
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Theme.of(context).primaryColor,
            bottom:const TabBar(
              isScrollable:true,
              indicatorColor: Colors.white,
              tabs: [
                Tab(
                child:Align(
                  alignment: Alignment.center,
                  child: Text(TextConstants.tabBarCocktails),
                ),
              ),
                Tab(
                  child:Align(
                    alignment: Alignment.center,
                    child: Text(TextConstants.tabBarAlcoholic),
                  ),
                ),
                Tab(
                  child:Align(
                    alignment: Alignment.center,
                    child: Text(TextConstants.tabBarNonAlcoholic),
                  ),
                ),
                Tab(
                  child:Align(
                    alignment: Alignment.center,
                    child: Text(TextConstants.tabBarOrdinaryDrinks),
                  ),
                ),
                Tab(
                  child:Align(
                    alignment: Alignment.center,
                    child: Text(TextConstants.tabBarTheBestCocktails),
                  ),
                ),
              ],
            ),
          ),
          body:const TabBarView(
            children: [
              CocktailsPage(),
              AlcoholicPage(),
              NonAlcoholicPage(),
              OrdinaryDrinksPage(),
              TheBestCocktailsPage(),
            ],
          ),
        ),
      );

  }
}
