import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'non_alcoholic_card.dart';

class NonAlcoholicList extends StatelessWidget {
  const NonAlcoholicList({Key? key,required this.snapshot}) : super(key: key);
  final dynamic snapshot;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 180.h,
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
                child: NonAlcoholicCard(nonAlcoholicCocktail: data[index]),
              );
            }),
      ),
    );
  }
}
