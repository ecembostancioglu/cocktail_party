import 'package:cocktail_party/constants/text_constants.dart';
import 'package:cocktail_party/models/cocktail.dart';
import 'package:cocktail_party/network/dio_alcoholic.dart';
import 'package:cocktail_party/widgets/alcoholic/alcoholic_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../constants/color_constants.dart';

class CollectionsPage extends StatefulWidget {
   const CollectionsPage({Key? key}) : super(key: key);

  @override
  State<CollectionsPage> createState() => _CollectionsPageState();
}

class _CollectionsPageState extends State<CollectionsPage> {
  final DioAlcoholic _dioAlcoholic=DioAlcoholic();

  Future<Iterable<Cocktail>>? _cocktails;



  @override
  void initState() {
   _cocktails= _dioAlcoholic.getAlcoholic();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    padding: EdgeInsets.only(left: 20.w,top: 10.h),
                      child: Text(TextConstants.alcoholic,
                          style: Theme.of(context).textTheme.headlineSmall)
                    ),
                  Padding(
                    padding: EdgeInsets.only(top: 16.h),
                    child: TextButton(
                      onPressed: () {},
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text('See all'),
                          SizedBox(
                            width: 2,
                          ),
                          Icon(Icons.chevron_right,
                            size: 15.h,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              FutureBuilder<Iterable<Cocktail>>(
                future: _cocktails,
                builder: (context,snapshot){
                  if(snapshot.data!=null){
                    return AlcoholicList(snapshot: snapshot);
                  } return const Center(
                      child: CircularProgressIndicator(
                          color: ColorConstants.themeColor));
                },
              ),
            ],
          ), //ALCOHOLIC PART
        ],
      ),

    );
  }
}
