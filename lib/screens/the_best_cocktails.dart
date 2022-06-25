import 'package:cocktail_party/models/home_filter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class TheBestCocktailsPage extends StatelessWidget {
  const TheBestCocktailsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(
            height: 20.h,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 12.w),
            child: Column(
              children: [
                Row(
                  children: [
                    Image.asset('assets/images/cocktail.png',
                        width: 80.w,height: 80.w),
                    Text('Popular Cocktails',
                        style: Theme.of(context).textTheme.headline4),
                  ],
                ),
                GridView.custom(
                    shrinkWrap: true,
                    physics: const ScrollPhysics(),
                    gridDelegate: SliverWovenGridDelegate.count(
                      crossAxisCount: 2,
                      mainAxisSpacing: 8,
                      crossAxisSpacing: 8,
                      pattern:const [
                        WovenGridTile(1),
                        WovenGridTile(
                          5 / 7,
                          crossAxisRatio: 0.9,
                          alignment: AlignmentDirectional.centerEnd,
                        ),

                      ],
                    ),
                    childrenDelegate: SliverChildBuilderDelegate(
                            (context, index) => Padding(
                             padding: const EdgeInsets.all(8.0),
                             child: ClipRRect(
                             borderRadius: BorderRadius.circular(20.0),
                             child: Image.asset(
                                categories[index].image,
                                fit: BoxFit.cover),
                          ),
                        ),
                        childCount: categories.length)
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
