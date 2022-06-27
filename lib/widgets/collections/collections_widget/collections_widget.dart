import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../constants/text_constants.dart';


class CollectionsWidget extends StatelessWidget {
  const CollectionsWidget({Key? key,required this.alcohol_type}) : super(key: key);
  final String alcohol_type;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
            padding: EdgeInsets.only(left: 20.w,top: 10.h),
            child: Text(alcohol_type,
                style: Theme.of(context).textTheme.headlineSmall)
        ),
        Padding(
          padding: EdgeInsets.only(top: 16.h),
          child: TextButton(
            onPressed: () {},
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text(TextConstants.seeAll),
                SizedBox(
                  width: 2.w,
                ),
                Icon(Icons.chevron_right,
                  size: 15.h,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
