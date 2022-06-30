import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

Shimmer getShimmerLoadingforCocktails(){
  return Shimmer.fromColors(
      baseColor: Colors.black26,
      highlightColor: Colors.black38,
      child:  GridTile(
        child: Padding(
            padding: EdgeInsets.symmetric(vertical: 10.w,horizontal: 10.h),
            child: ClipRRect(
                borderRadius:  BorderRadius.circular(20.0),
                child:Container(color: Colors.white,))
        ),
      )
  );
}