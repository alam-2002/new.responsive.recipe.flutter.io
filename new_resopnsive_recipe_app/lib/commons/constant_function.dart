import 'dart:convert';
import 'package:http/http.dart' as http;

class ConstantFunction {

  static Future<List<Map<String, dynamic>>> getResponse (String findRecipe) async {

    const String id = '81c6985d';
    const String key = 'fd0c17158016d4f5956060f03383cc43';
    String api = 'https://api.edamam.com/api/recipes/v2?type=public&q=$findRecipe&app_id=$id&app_key=$key&random=true';

    final response = await http.get(Uri.parse(api));

    List<Map<String, dynamic>> recipe = [];

    if(response.statusCode == 200) {
      var data = jsonDecode(response.body);
      if(data['hits'] != null){
        for(var hit in data['hits']){
          recipe.add(hit['recipe']);
        }
      }
      return recipe;
    }
    return recipe;
  }
}