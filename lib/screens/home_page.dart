import 'package:cocktail_party/constants/text_constants.dart';
import 'package:cocktail_party/screens/collections.dart';
import 'package:cocktail_party/screens/cocktails/cocktails.dart';
import 'package:flutter/material.dart';


class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        initialIndex:0,
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Theme.of(context).primaryColor,
            bottom: TabBar(
              isScrollable:false,
              indicatorColor: Colors.white,
              tabs: [
                Tab(
                 child:Text(TextConstants.cocktails,
                   style: Theme.of(context).textTheme.headline5),
              ),
                Tab(
                  child:Text(TextConstants.collections,
                      style: Theme.of(context).textTheme.headline5),
                ),
              ],
            ),
          ),
          body: TabBarView(
            children: [
              CocktailsPage(),
              CollectionsPage(),
            ],
          ),
        ),
      );

  }
}
