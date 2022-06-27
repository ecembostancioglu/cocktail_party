
import 'package:cocktail_party/network/dio_nonalcoholic.dart';
import 'package:flutter/material.dart';

import '../widgets/collections/alcoholic/alcoholic.dart';
import '../widgets/collections/non_alcoholic/non_alcoholic.dart';


class CollectionsPage extends StatefulWidget {
   const CollectionsPage({Key? key}) : super(key: key);

  @override
  State<CollectionsPage> createState() => _CollectionsPageState();
}

class _CollectionsPageState extends State<CollectionsPage> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Alcoholic(),
            NonAlcoholic(),
          ],
        ),
      ),

    );
  }
}
