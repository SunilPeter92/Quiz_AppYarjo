import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:quizapp/GlobalClass/Global.dart';
import 'package:quizapp/ui/Model/GetQuizModel.dart';
import 'package:quizapp/ui/Model/GetQuizbyID.dart';
import 'package:quizapp/ui/Model/PurchaseHistoryModel.dart';
import 'package:quizapp/ui/pages/home.dart';
import 'package:quizapp/ui/pages/login.dart';
import 'package:http/http.dart' as http;

class API{

  static login(BuildContext context, email, password) {
    FormData data = FormData.fromMap({
      "email": email,
      "password": password,
    });

    Dio dio = new Dio();

    dio.post(Global.baseurl + "user_login", data: data).then((response) {
      print(response.statusCode);
      if (response.statusCode == 201) {
        Navigator.of(context).pushNamed(HomePage.routeName);

      } else if (response.statusCode == 202) {
        Fluttertoast.showToast(
            msg: "Email not Exit",
            toastLength: Toast.LENGTH_LONG);
      }
    }).catchError((error) => print(error));
  }


  static Future register(BuildContext context, name , username , email , password) async {
  //  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();

    FormData data = FormData.fromMap({
      "name" : name ,
      "username": username,
      "email": email,
      "password":  password,

    });

    Dio dio = new Dio();

    dio
        .post(Global.baseurl + "user_register", data: data)
        .then((response) {
      print(response);
      if (response.statusCode == 201) {
        // sharedPreferences.setString(
        //     'userID', response.data["user_id"].toString());

        Navigator.of(context).pushNamed(LoginPage.routeName);

      } else if (response.statusCode == 200) {
        Fluttertoast.showToast(
            msg: 'This E-mail already exists!',
            toastLength: Toast.LENGTH_SHORT);
      }
    }).catchError((error) => print(error));
  }

  static Future changePassword(BuildContext context, id , password) async {
  //  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();

    FormData data = FormData.fromMap({
      "id" : id ,
      "password":  password,

    });

    Dio dio = new Dio();

    dio
        .post(Global.baseurl + "change_pass", data: data)
        .then((response) {
      print(response);
      if (response.statusCode == 201) {
        // sharedPreferences.setString(
        //     'userID', response.data["user_id"].toString());
        Fluttertoast.showToast(
            msg: 'Password Updated', toastLength: Toast.LENGTH_LONG);

      } else if (response.statusCode == 200) {
        Fluttertoast.showToast(
            msg: 'Password Updated', toastLength: Toast.LENGTH_LONG);
      }
    }).catchError((error) => print(error));
  }

  static Future<PurchaseHistoryModel> PurchaseHistory() async {
    try {
      final http.Response response = await http.get(Global.baseurl + "get_purchase_history/15");

      if (response.statusCode == 201) {
        return PurchaseHistoryModel.fromJson(jsonDecode(response.body));
      }
    }
    // on SocketException catch (e) {
    //   throw NoInternetExceptions("No Internet", "assets/internet.png");
    // } on HttpException catch (e) {
    //   throw HttpException("No Service found");
    // } on FormatException catch (e) {
    //   throw InvalidDataFormat("Invalid Data format");
    // }
    catch (e) {
      throw Exception("Unknown Error");
    }
  }


  static Future<GetQuizModel> getQuiz() async {
    try {
      final http.Response response = await http.get(Global.baseurl + "get_quiz_for_main");

      if (response.statusCode == 201) {
        return GetQuizModel.fromJson(jsonDecode(response.body));



      }
    }
    // on SocketException catch (e) {
    //   throw NoInternetExceptions("No Internet", "assets/internet.png");
    // } on HttpException catch (e) {
    //   throw HttpException("No Service found");
    // } on FormatException catch (e) {
    //   throw InvalidDataFormat("Invalid Data format");
    // }
    catch (e) {
      throw Exception("Unknown Error");
    }
  }

  static Future<GetQuizByID> getQuizDetail(id) async {
    try {
      final http.Response response = await http.get(Global.baseurl + "getquiz_by_id/$id");

      if (response.statusCode == 201) {
        return GetQuizByID.fromJson(jsonDecode(response.body));
      }
    }
    // on SocketException catch (e) {
    //   throw NoInternetExceptions("No Internet", "assets/internet.png");
    // } on HttpException catch (e) {
    //   throw HttpException("No Service found");
    // } on FormatException catch (e) {
    //   throw InvalidDataFormat("Invalid Data format");
    // }
    catch (e) {
      throw Exception("Unknown Error");
    }
  }



}