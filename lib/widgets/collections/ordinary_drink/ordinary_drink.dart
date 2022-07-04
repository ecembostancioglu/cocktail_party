import 'package:cocktail_party/constants/text_constants.dart';
import 'package:cocktail_party/network/dio_ordinary_drink.dart';
import 'package:cocktail_party/widgets/collections/ordinary_drink/ordinary_drink_list.dart';
import 'package:cocktail_party/widgets/shimmer/shimmer_for_collections.dart';
import 'package:flutter/material.dart';
import '../../../models/cocktail.dart';
import '../collections_widget/collections_widget.dart';


class OrdinaryDrink extends StatefulWidget {
  const OrdinaryDrink({Key? key}) : super(key: key);

  @override
  State<OrdinaryDrink> createState() => _OrdinaryDrinkState();
}

class _OrdinaryDrinkState extends State<OrdinaryDrink> {
  final DioOrdinaryDrink _dioOrdinaryDrink=DioOrdinaryDrink();

  Future<Iterable<Cocktail>>? _cocktails;

  @override
  void initState() {
    _cocktails= _dioOrdinaryDrink.getOrdinaryDrink();
    super.initState();
  }



  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const CollectionsWidget(alcohol_type: TextConstants.ordinaryDrinks),
        FutureBuilder<Iterable<Cocktail>>(
          future: _cocktails,
          builder: (context,snapshot){
            if(snapshot.data!=null){
              return OrdinaryDrinkList(snapshot: snapshot);
            }else
            return getShimmerLoadingforCollections();
          },
        ),
      ],
    );
  }
}
