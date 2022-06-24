import 'package:cocktail_party/models/cocktail.dart';
import 'package:dio/dio.dart';

class DioClient{
  Dio dio=Dio();
  final String baseUrl='https://www.thecocktaildb.com/';


  Future<Iterable<Cocktail>> getCocktail(String CocktailName) async{
    Iterable<Cocktail> cocktails=[];

    try{
      Response response=await dio.get('${baseUrl}api/json/v1/1/search.php?s=$CocktailName');
      List parsedList=response.data['drinks'];
      cocktails=parsedList.map<Cocktail>((element) {
        return Cocktail.fromJson(element);
      }).toList();
      for(var CocktailName in cocktails){
        print(CocktailName.strDrink);}


    }on DioError catch(e){
      if (e.response != null) {
        print('STATUS: ${e.response?.statusCode}');
        print('DATA: ${e.response?.data}');
        print('HEADERS: ${e.response?.headers}');
      } else {
        print('Error sending request!');
        print(e.message);
      }
    }
    return cocktails;
  }

 // Future<Iterable<Cocktail>> get
}