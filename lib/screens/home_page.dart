
import 'package:cocktail_party/constants/text_constants.dart';
import 'package:cocktail_party/screens/collections.dart';
import 'package:cocktail_party/screens/cocktails.dart';
import 'package:cocktail_party/screens/the_best_cocktails.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 3,
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
                  child: Text(TextConstants.cocktails),
                ),
              ),
                Tab(
                  child:Align(
                    alignment: Alignment.center,
                    child: Text(TextConstants.collections),
                  ),
                ),
                Tab(
                  child:Align(
                    alignment: Alignment.center,
                    child: Text(TextConstants.theBestCocktails),
                  ),
                ),
              ],
            ),
          ),
          body: TabBarView(
            children: [
              CocktailsPage(),
              CollectionsPage(),
              TheBestCocktailsPage(),
            ],
          ),
        ),
      );

  }
}
