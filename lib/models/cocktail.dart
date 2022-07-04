
class Cocktail{
  String? idDrink;
  String? strDrink;
  String? strDrinkAlternate;
  String? strTags;
  String? strVideo;
  String? strCategory;
  String? strIBA;
  String? strAlcoholic;
  String? strGlass;
  String? strInstructions;
  String? strInstructionsES;
  String? strInstructionsDE;
  String? strInstructionsFR;
  String? strInstructionsIT;
  String? strInstructionsZHHANS;
  String? strInstructionsZHHANT;
  String? strDrinkThumb;
  String? strIngredient1;
  String? strIngredient2;
  String? strIngredient3;
  String? strIngredient4;
  String? strIngredient5;
  String? strIngredient6;
  String? strIngredient7;
  String? strIngredient8;
  String? strIngredient9;
  String? strIngredient10;
  String? strIngredient11;
  String? strIngredient12;
  String? strIngredient13;
  String? strIngredient14;
  String? strIngredient15;
  String? strMeasure1;
  String? strMeasure2;
  String? strMeasure3;
  String? strMeasure4;
  String? strMeasure5;
  String? strMeasure6;
  String? strMeasure7;
  String? strMeasure8;
  String? strMeasure9;
  String? strMeasure10;
  String? strMeasure11;
  String? strMeasure12;
  String? strMeasure13;
  String? strMeasure14;
  String? strMeasure15;
  String? strImageSource;
  String? strImageAttribution;
  String? strCreativeCommonsConfirmed;


  Cocktail(
      { this.idDrink,
        this.strDrink,
        this.strDrinkAlternate,
        this.strTags,
        this.strVideo,
        this.strCategory,
        this.strIBA,
        this.strAlcoholic,
        this.strGlass,
        this.strInstructions,
        this.strInstructionsES,
        this.strInstructionsDE,
        this.strInstructionsFR,
        this.strInstructionsIT,
        this.strInstructionsZHHANS,
        this.strInstructionsZHHANT,
        this.strDrinkThumb,
        this.strIngredient1,
        this.strIngredient2,
        this.strIngredient3,
        this.strIngredient4,
        this.strIngredient5,
        this.strIngredient6,
        this.strIngredient7,
        this.strIngredient8,
        this.strIngredient9,
        this.strIngredient10,
        this.strIngredient11,
        this.strIngredient12,
        this.strIngredient13,
        this.strIngredient14,
        this.strIngredient15,
        this.strMeasure1,
        this.strMeasure2,
        this.strMeasure3,
        this.strMeasure4,
        this.strMeasure5,
        this.strMeasure6,
        this.strMeasure7,
        this.strMeasure8,
        this.strMeasure9,
        this.strMeasure10,
        this.strMeasure11,
        this.strMeasure12,
        this.strMeasure13,
        this.strMeasure14,
        this.strMeasure15,
        this.strImageSource,
        this.strImageAttribution,
        this.strCreativeCommonsConfirmed});

  Cocktail.fromJson(Map<String,dynamic> json){
     idDrink= json['idDrink'];
     strDrink= json['strDrink'];
     strDrinkAlternate= json['strDrinkAlternate'];
     strVideo= json['strVideo'];
     strCategory= json['strCategory'];
     strIBA= json['strIBA'];
     strAlcoholic= json['strAlcoholic'];
     strGlass= json['strGlass'];
     strInstructions= json['strInstructions'];
     strDrinkThumb= json['strDrinkThumb'];
     strIngredient1 = json['strIngredient1'] ?? '';
     strIngredient2 = json['strIngredient2'] ?? '';
     strIngredient3 = json['strIngredient3'] ?? '';
     strIngredient4 = json['strIngredient4'] ?? '';
     strIngredient5 = json['strIngredient5'] ?? '';
     strIngredient6 = json['strIngredient6'] ?? '';
     strMeasure1 = json['strMeasure1'] ?? '';
     strMeasure2 = json['strMeasure2'] ?? '';
     strMeasure3 = json['strMeasure3'] ?? '';
     strMeasure4 = json['strMeasure4'] ?? '';
     strMeasure5 = json['strMeasure5'] ?? '';
     strMeasure6 = json['strMeasure6'] ?? '';

     strImageSource= json['strImageSource'];
     strImageAttribution= json['strImageAttribution'];
     strCreativeCommonsConfirmed= json['strCreativeCommonsConfirmed'];

 }

  Map<String,dynamic> toJson(){
    final Map<String, dynamic> data = <String, dynamic>{};
    data['idDrink']=idDrink;
    data['strDrink']=strDrink;
    data['strDrinkAlternate']=strDrinkAlternate;
    data['strVideo']=strVideo;
    data['strCategory']=strCategory;
    data['strIBA']=strIBA;
    data['strAlcoholic']=strAlcoholic;
    data['strGlass']=strGlass;
    data['strInstructions']=strInstructions;
    data['strDrinkThumb']=strDrinkThumb;
    data['strIngredient1'] = strIngredient1;
    data['strIngredient2'] = strIngredient2;
    data['strIngredient3'] = strIngredient3;
    data['strIngredient4'] = strIngredient4;
    data['strIngredient5'] = strIngredient5;
    data['strIngredient6'] = strIngredient6;
    data['strMeasure1'] = strMeasure1;
    data['strMeasure2'] = strMeasure2;
    data['strMeasure3'] = strMeasure3;
    data['strMeasure4'] = strMeasure4;
    data['strMeasure5'] = strMeasure5;
    data['strMeasure6'] = strMeasure6;
    data['strImageSource']=strImageSource;
    data['strImageAttribution']=strImageAttribution;
    data['strCreativeCommonsConfirmed']=strCreativeCommonsConfirmed;
     return data;
  }

}