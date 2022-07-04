import 'package:cocktail_party/models/cocktail.dart';
import 'package:cocktail_party/network/dio_client.dart';
import 'package:dio/dio.dart';

class DioOrdinaryDrink extends DioClient{

  Future<Iterable<Cocktail>> getOrdinaryDrink()async{
    Iterable<Cocktail> ordinaryDrink=[];
    try{
      final Response response=await dio.get('${baseUrl}api/json/v1/1/filter.php?c=Ordinary_Drink');
      List alcoholicList= response.data['drinks'];
      print(alcoholicList);
      ordinaryDrink=alcoholicList.map<Cocktail>((e){
        return Cocktail.fromJson(e);
      }).toList();
      for(var cocktailName in ordinaryDrink){
        print(cocktailName.strDrink);}
    }on DioError catch(e){
      print(e);
    }
    return ordinaryDrink;
  }


}
