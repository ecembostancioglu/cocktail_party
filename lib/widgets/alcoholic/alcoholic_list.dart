import 'package:cocktail_party/widgets/alcoholic/alcoholic_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class AlcoholicList extends StatelessWidget {
  AlcoholicList({Key? key,required this.snapshot}) : super(key: key);
  var snapshot;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200.h,
      child: Padding(
        padding: EdgeInsets.all(10.h),
        child: ListView.builder(
          physics: const ClampingScrollPhysics(),
            scrollDirection: Axis.horizontal,
            shrinkWrap: true,
            itemCount: snapshot.data!.length,
            itemBuilder: (context,index){
              var data=snapshot.data!.toList();
              return Padding(
                padding: EdgeInsets.all(4.w),
                child: AlcoholicCard(alcoholicCocktail: data[index]),
              );
            }),
      ),
    );
  }
}
