import 'package:cocktail_party/constants/color_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

Shimmer getShimmerLoadingforCollections(){
  return Shimmer.fromColors(
      baseColor: Colors.black26,
      highlightColor: Colors.black38,
      child:SizedBox(
        height: 200.h,
        child: Padding(
          padding: EdgeInsets.all(10.h),
          child: ListView(
              physics: const ClampingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
               children: [
                 Padding(
                   padding:EdgeInsets.all(4.w),
                  child: ClipRRect(
                   borderRadius: BorderRadius.circular(20.0),
                    child:Container(
                      color: ColorConstants.primaryColor,
                    ),
                 ),),
               ],
                ),
              ),
        ),
      );

}
