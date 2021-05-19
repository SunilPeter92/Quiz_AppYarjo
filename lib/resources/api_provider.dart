import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:quizapp/models/category.dart';
import 'package:quizapp/models/question.dart';
import 'package:quizapp/ui/constant/constant.dart' as globals;



const String baseUrl = "https://opentdb.com/api.php";

Future<List<Question>> getQuestions(int id, int total, String difficulty) async {
  // String url = "$baseUrl?amount=$total&category=${category.id}";
  // if(difficulty != null) {
  //   url = "$url&difficulty=$difficulty";
  // }
  // http.Response res = await http.get(url);
  // List<Map<String, dynamic>> questions = List<Map<String,dynamic>>.from(json.decode(res.body)["results"]);
  // return Question.fromData(questions);

  final String url = '${globals.url}/api/get_quiz/${id}';
  http.Response response = await http.get(url);
  List<Map<String, dynamic>> questions = List<Map<String, dynamic>>.from(json.decode(response.body)["data"]);
  return Question.fromData(questions);
}