import 'dart:convert';

// import 'package:btl_recipes/models/dishes.dart';
import 'package:http/http.dart' as http;

class APIHandler {
  static Future<List<Map<String, dynamic>>> getRecipes(String recipe) async {
    String id = '19a785ce';
    String key = 'b7476c77cf72b50f5098d7b01daf5e14';

    String api =
        'https://api.edamam.com/search?q=$recipe&app_id=$id&app_key=$key&from=0&to=10&calories=591-722&health=alcohol-free';

    final response = await http.get(Uri.parse(api));

    List<Map<String, dynamic>> recipes = [];
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);

      if (data["hits"] != null) {
        for (var hit in data['hits']) {
          recipes.add(hit['recipe']);
        }
      }
      return recipes;
    }
    return recipes;
  }

  // static Future<List<Dishes>> getMeals() async {
  //   var uri = Uri.https(
  //       "yummly2.p.rapidapi.com", "/feeds/list", {'limit': '24', 'start': '0'});

  //   final response = await http.get(uri, headers: {
  //     'X-RapidAPI-Key': '6eec2d8fc2msha01e82362bc792bp1f32f5jsn31341e74bfc7',
  //     'X-RapidAPI-Host': 'yummly2.p.rapidapi.com'
  //   });

  // if (response.statusCode == 200) {
  //   Map<String, dynamic> data = jsonDecode(response.body);
  //   List<dynamic> recipes = data['feed'];
  // }

  //   Map data = jsonDecode(response.body);
  //   List temp = [];

  //   for (var i in data["feed"]) {
  //     temp.add(i['content']['details']);
  //   }
  //   return Dishes.dishesSnapshot(temp);
  // }

  //   const options = {
  //   method: 'GET',
  //   url: 'https://yummly2.p.rapidapi.com/feeds/list',
  //   params: {
  //     limit: '24',
  //     start: '0'
  //   },
  //   headers: {
  //     'X-RapidAPI-Key': '6eec2d8fc2msha01e82362bc792bp1f32f5jsn31341e74bfc7',
  //     'X-RapidAPI-Host': 'yummly2.p.rapidapi.com'
  //   }
  // };
}
