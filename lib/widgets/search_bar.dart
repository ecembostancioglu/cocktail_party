import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../constants/color_constants.dart';

class SearchBarWidget extends StatelessWidget {
    SearchBarWidget({
    required this.myController,
    required this.myFunction,
    Key? key}) : super(key: key);

  TextEditingController myController;
  final void Function(String myString) myFunction;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 24.h),
      child: SizedBox(
        width: 240.w,
        height: 60.h,
        child: TextFormField(
          controller: myController,
          onChanged: myFunction,
          decoration: InputDecoration(
            hintText: "Search Cocktail..",
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(24),
                borderSide: BorderSide(
                    color:ColorConstants.black
                )
            ),
            prefixIcon:const Icon(Icons.search),
            suffixIcon: IconButton(
              icon:const Icon(Icons.clear),
              onPressed: () {
                myController.text = '';
              },
            ),
          ),
        ),
      ),
    );
  }
}
