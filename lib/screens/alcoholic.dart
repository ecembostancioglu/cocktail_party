import 'package:cocktail_party/models/cocktail.dart';
import 'package:cocktail_party/network/dio_alcoholic.dart';
import 'package:flutter/material.dart';
import '../constants/color_constants.dart';

class AlcoholicPage extends StatefulWidget {
   AlcoholicPage({Key? key}) : super(key: key);

  @override
  State<AlcoholicPage> createState() => _AlcoholicPageState();
}

class _AlcoholicPageState extends State<AlcoholicPage> {
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
      body: SingleChildScrollView(
        child: FutureBuilder<Iterable<Cocktail>>(
          future: _cocktails,
          builder: (context,snapshot){
            if(snapshot.data!=null){
              return ListView.builder(
                  shrinkWrap: true,
                  itemCount: snapshot.data!.length,
                  itemBuilder: (context,index){
                    var data=snapshot.data!.toList();
                    return ListTile(
                      title: Text(data[index].strDrink.toString()),
                    );
                  });
            } return const Center(
                child: CircularProgressIndicator(
                    color: ColorConstants.themeColor));
          },
        ),
      ),

    );
  }
}
