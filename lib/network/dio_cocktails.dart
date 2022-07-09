import 'package:cocktail_party/models/cocktail.dart';
import 'package:cocktail_party/network/dio_client.dart';
import 'package:dio/dio.dart';


class DioCocktails extends DioClient{

  Future<Iterable<Cocktail>> getCocktail(String cocktailName) async{
    Iterable<Cocktail> cocktails=[];

    try{
      final Response response=await dio.get('${baseUrl}api/json/v1/1/search.php?s=$cocktailName');
      List parsedList=response.data['drinks'];
      cocktails=parsedList.map<Cocktail>((element) {
        return Cocktail.fromJson(element);
      }).toList();
      for(var cocktailName in cocktails){
        print(cocktailName.strDrink);}

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
}