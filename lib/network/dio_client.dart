import 'package:cocktail_party/models/cocktail.dart';
import 'package:dio/dio.dart';

class DioClient {

  final Dio dio = Dio();
   static const baseURL='https://www.thecocktaildb.com/';
  List<Cocktail> _cocktail=[];

    Future<void> getCocktail() async {
      final response = await dio.get(
          '${baseURL}api/json/v1/1/search.php?s=margarita');
      print(response.data);
      _cocktail=response.data['drinks'].map<Cocktail>((json)=>
          Cocktail.fromJson(json)).toList();
      for(var js in _cocktail){
        print(js.strDrink);
      }

    }


}