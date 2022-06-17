import 'package:cocktail_party/models/cocktail.dart';
import 'package:dio/dio.dart';

class DioClient{
  
  final Dio dio=Dio();
  static const baseURL='https://www.thecocktaildb.com/';


  Future<void> getCocktail()async{
    final response=await dio.get('https://www.thecocktaildb.com/api/json/v1/1/search.php?s=margarita');
    Cocktail _cocktail=Cocktail.fromJson(response.data);
    print(response.data);
    print(_cocktail.strDrink);

  }

}