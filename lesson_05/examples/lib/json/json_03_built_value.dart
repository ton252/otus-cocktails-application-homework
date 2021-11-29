import 'dart:convert';

import 'package:lesson05async/json/built_value_approach/cocktail.dart';
import 'package:lesson05async/json/built_value_approach/cocktail_serializers.dart';

const String httpResponse = '''
{
    "idDrink": "11408",
    "strDrink": "Gin Daisy",
    "strCategory": "Ordinary Drink",
    "strAlcoholic": "Alcoholic",
    "strGlass": "Old-fashioned glass"
}
''';

void main() {
  Map<String, dynamic> data = jsonDecode(httpResponse);

  var cocktail = serializers.deserializeWith(Cocktail.serializer, data)!;
  assert(cocktail.idDrink == "11408");


     // final newInstance = cocktail.rebuild(
     //   (builder) => builder
     //     ..idDrink = '200'
     //     ..strDrink = 'some title',
     // );
     //
     // print(newInstance);
}
