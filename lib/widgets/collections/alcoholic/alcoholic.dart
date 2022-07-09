import 'package:cocktail_party/constants/text_constants.dart';
import 'package:cocktail_party/models/cocktail.dart';
import 'package:cocktail_party/network/dio_alcoholic.dart';
import 'package:cocktail_party/widgets/shimmer/shimmer_for_collections.dart';
import 'package:flutter/material.dart';
import '../collections_widget/collections_widget.dart';
import 'alcoholic_list.dart';


class Alcoholic extends StatefulWidget {
  const Alcoholic({Key? key}) : super(key: key);
  @override
  State<Alcoholic> createState() => _AlcoholicState();
}

class _AlcoholicState extends State<Alcoholic> {
  final DioAlcoholic _dioAlcoholic=DioAlcoholic();

  Future<Iterable<Cocktail>>? _cocktails;


  @override
  void initState() {
    _cocktails= _dioAlcoholic.getAlcoholic();
    super.initState();
  }



  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CollectionsWidget(
            alcohol_type: TextConstants.alcoholic),
        FutureBuilder<Iterable<Cocktail>>(
          future: _cocktails,
          builder: (context,snapshot){
            if(snapshot.data!=null){
              return AlcoholicList(snapshot: snapshot);
            }else {
              return getShimmerLoadingforCollections();
            }
          },
        ),
      ],
    );
  }
}
