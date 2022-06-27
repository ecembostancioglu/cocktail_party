import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerEffect extends StatelessWidget {
  const ShimmerEffect({Key? key,required this.cocktails}) : super(key: key);
  final dynamic cocktails;

  @override
  Widget build(BuildContext context) {
    return GridTile(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 10.w,horizontal: 10.h),
          child: ClipRRect(
              borderRadius:  BorderRadius.circular(20.0),
              child: Image.network(cocktails.strDrinkThumb.toString())),
        )
    );
  }

  Shimmer getShimmerLoading(){
    return Shimmer.fromColors(
        baseColor: Colors.grey.shade600,
        highlightColor: Colors.grey.shade100,
        child:  GridTile(
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 10.w,horizontal: 10.h),
              child: ClipRRect(
                  borderRadius:  BorderRadius.circular(20.0),
                  child:Container(color: Colors.white)),
            )
        ));
  }
}

