import 'package:cocktail_party/models/cocktail.dart';
import 'package:cocktail_party/network/dio_client.dart';
import 'package:dio/dio.dart';

class DioNonAlcoholic extends DioClient{

  Future<Iterable<Cocktail>> getNonAlcoholic()async{
    Iterable<Cocktail> alcohols=[];
    try{
      final Response response=await dio.get('${baseUrl}api/json/v1/1/filter.php?a=Non_Alcoholic');
      List alcoholicList= response.data['drinks'];
      print(alcoholicList);
      alcohols=alcoholicList.map<Cocktail>((e){
        return Cocktail.fromJson(e);
      }).toList();
      for(var cocktailName in alcohols){
        print(cocktailName.strDrink);}
    }on DioError catch(e){
      print(e);
    }
    return alcohols;
  }


}