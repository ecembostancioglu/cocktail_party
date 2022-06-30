import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

Shimmer getShimmerLoadingforCollections(){
  return Shimmer.fromColors(
      baseColor: Colors.black26,
      highlightColor: Colors.black38,
      child:
      ClipRRect(
          borderRadius: BorderRadius.circular(20.0),
              child: Container(color: Colors.white)),
  );
}
