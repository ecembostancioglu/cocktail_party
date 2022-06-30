import 'package:cocktail_party/constants/text_constants.dart';
import 'package:cocktail_party/models/cocktail.dart';
import 'package:cocktail_party/network/dio_nonalcoholic.dart';
import 'package:cocktail_party/widgets/shimmer/shimmer_for_cocktails.dart';
import 'package:cocktail_party/widgets/shimmer/shimmer_for_collections.dart';
import 'package:flutter/material.dart';

import '../../../constants/color_constants.dart';
import '../collections_widget/collections_widget.dart';
import 'non_alcoholic_list.dart';

class NonAlcoholic extends StatefulWidget {
  const NonAlcoholic({Key? key}) : super(key: key);

  @override
  State<NonAlcoholic> createState() => _NonAlcoholicState();
}

class _NonAlcoholicState extends State<NonAlcoholic> {
  DioNonAlcoholic _dioNonAlcoholic=DioNonAlcoholic();
  Future<Iterable<Cocktail>>? _cocktails;

  @override
  void initState() {
     _cocktails=_dioNonAlcoholic.getNonAlcoholic();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const CollectionsWidget(alcohol_type: TextConstants.nonAlcoholic),
        FutureBuilder<Iterable<Cocktail>>(
          future: _cocktails,
          builder: (context,snapshot){
            if(snapshot.data!=null){
              return NonAlcoholicList(snapshot: snapshot);
            } return getShimmerLoadingforCollections();
          },
        ),
      ],
    );

  }
}
