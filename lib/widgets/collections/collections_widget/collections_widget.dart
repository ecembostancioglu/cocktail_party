import 'package:cocktail_party/constants/text_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class CollectionsWidget extends StatefulWidget {
  const CollectionsWidget({Key? key,required this.alcohol_type}) : super(key: key);
  final String alcohol_type;

  @override
  State<CollectionsWidget> createState() => _CollectionsWidgetState();
}

class _CollectionsWidgetState extends State<CollectionsWidget> {

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
            padding: EdgeInsets.only(left: 20.w,top: 10.h),
            child: Text(widget.alcohol_type,
                style: Theme.of(context).textTheme.headline6)
        ),
      ],
    );
  }
}
