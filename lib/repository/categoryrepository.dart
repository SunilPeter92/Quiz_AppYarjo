import 'dart:convert';
import 'package:quizapp/ui/constant/constant.dart' as globals;
import 'package:quizapp/helper/helper.dart';
import 'package:quizapp/models/category.dart';
import 'package:quizapp/repository/apiconfiguration.dart';
import 'package:http/http.dart' as http;

// Category cate;
// Future<Category> getCategories() async {
//   final String url = '${globals.url}api/get_cate';
//   final response = await http.get(url);
//   if (response.statusCode == 201) {
//     if (json.decode(response.body)['data'] != null) {
//       cate = Category.fromJson(json.decode(response.body)['data']);
//     }
//   }
//   print("categ: ${cate.name}");
//   return cate;
  
// }
Future<List<Category>> getCategories() async {
  List<Category> categories = [];
  final String url = '${globals.url}api/get_cate';
  try {
    var response = await http.get(url);
    if (response.statusCode == 201 || response.statusCode == 200) {
      var data = Helper.getData(
        json.decode(response.body),
      );
      try {
       // for (var cate in data) {
          categories.add(Category.fromJson(data));
       // }
       print("cate: ${categories[0].name}");
        return categories;
      } catch (e) {
        return null;
      }
    }
  } catch (e) {
    print("ERROR! ${e}");
    return null;
  }
}


