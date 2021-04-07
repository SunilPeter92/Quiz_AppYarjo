import 'dart:convert';

import 'package:quizapp/helper/helper.dart';
import 'package:quizapp/models/response.dart';
import 'package:quizapp/ui/constant/constant.dart' as globals;
import 'package:http/http.dart' as http;


Future<Response> userRegister(String email,String name,String password) async {
  Response getResponse;
  final String url = '${globals.url}api/user_register';
  try {
    var response = await http.post(url,body: {
      "name":name,
      "email":email,
      "password":password
    });
    if (response.statusCode == 201 || response.statusCode == 200) {
      try {
        getResponse=Response.fromJson(json.decode(response.body));
        return getResponse;
      } catch (e) {
        return null;
      }
    }
  } catch (e) {
    print("ERROR! ${e}");
    return null;
  }
  return null;
}
Future<Response> userLogin(String email,String password) async {
  Response getResponse;
  final String url = '${globals.url}api/user_login';
  try {
    var response = await http.post(url,body: {
      "email":email,
      "password":password
    });
    if (response.statusCode == 201 || response.statusCode == 200) {
      try {
        getResponse=Response.fromJson(json.decode(response.body));

        print(response.statusCode);
        return getResponse;
      } catch (e) {
        return null;
      }
    }
  } catch (e) {
    print("ERROR! ${e}");
    return null;
  }
  return null;
}