import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:quizapp/GlobalClass/Global.dart';
import 'package:quizapp/ui/Model/GetQuizModel.dart';
import 'package:quizapp/ui/Model/GetQuizbyID.dart';
import 'package:quizapp/ui/Model/GetquizbyUserModel.dart';
import 'package:quizapp/ui/Model/LeaderBoardModel.dart';
import 'package:quizapp/ui/Model/PurchaseHistoryModel.dart';
import 'package:quizapp/ui/Model/getuserModel.dart';
import 'package:quizapp/ui/Model/getcreditModel.dart';
import 'package:quizapp/ui/pages/authenticationScreen.dart';
import 'package:quizapp/ui/pages/home.dart';
import 'package:quizapp/ui/pages/login.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class API {
  static login(BuildContext context, email, password) async {
    FormData data = FormData.fromMap({
      "email": email,
      "password": password,
    });

    Dio dio = new Dio();

    dio.post(Global.baseurl + "user_login", data: data).then((response) {
      Map<String, dynamic> data = response.data;
      print(response.statusCode);
      if (response.statusCode == 201) {
        var records = data["data"];
        var userId = records['id'];
        print(userId);
        AuthenticationPage.prefs.setInt('userID', userId);
        Navigator.of(context).pushNamed(HomePage.routeName);
      } else if (response.statusCode == 202) {
        Fluttertoast.showToast(
            msg: "Email not Exit", toastLength: Toast.LENGTH_LONG);
      }
    }).catchError((error) => print(error));
  }

  static Future register(
      BuildContext context, name, username, email, password) async {
    //  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();

    FormData data = FormData.fromMap({
      "name": name,
      "username": username,
      "email": email,
      "password": password,
    });

    Dio dio = new Dio();

    dio.post(Global.baseurl + "user_register", data: data).then((response) {
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

  static Future changePassword(BuildContext context, id, password) async {
    //  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();

    FormData data = FormData.fromMap({
      "id": id,
      "password": password,
    });

    Dio dio = new Dio();

    dio.post(Global.baseurl + "change_pass", data: data).then((response) {
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

  static Future<PurchaseHistoryModel> PurchaseHistory(int id) async {
    try {
      final http.Response response =
          await http.get(Global.baseurl + "get_purchase_history/ $id");

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


  static Future<GetUserModel> GetUser(int id) async {
    try {
      final http.Response response =
          await http.get(Global.baseurl + "get_user/ $id");
      print(response.statusCode);
      if (response.statusCode == 201) {
        return GetUserModel.fromJson(jsonDecode(response.body));
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

  static addcredit(
      BuildContext context,
      int user_id,
      String credit_id,
      String card_number,
      String card_year,
      String card_cvc,
      String card_name,
      String country,
      String amount) async {
    FormData data = FormData.fromMap({
      "user_id": user_id,
      "credit_id": credit_id.toString(),
      "card_number": card_number.toString(),
      "card_year": card_year.toString(),
      "card_cvc": card_cvc.toString(),
      "card_name": card_name.toString(),
      "country": country.toString(),
      "amount ": amount.toString(),

      // edit_id": '1',
      //       // "card_number": '4242',
      //       // "card_year": '2050',
      //       // "card_cvc": '234',
      //       // "card_name": 'Yasir',
      //       // "country": 'Pakistan',
      //       // "amount ": '1000',"user_id": '28',
      // "cr
    });

    Dio dio = new Dio();

    dio
        .post(Global.baseurl + "add_purchased_credit", data: data)
        .then((response) {
      print(response.statusCode);
      if (response.statusCode == 201) {
        Fluttertoast.showToast(
            msg: "Success",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.green,
            textColor: Colors.white,
            fontSize: 16.0);
        Navigator.of(context).pushNamed(HomePage.routeName);
      } else if (response.statusCode == 202) {
        Fluttertoast.showToast(
            msg: "Email not Exit", toastLength: Toast.LENGTH_LONG);
      }
    }).catchError((error) => print(error));
  }


  static Future<String> addcreditt( BuildContext context,
      String user_id,
      String credit_id,
      String card_number,
      String card_year,
      String card_cvc,
      String card_name,
      String country,
      String amount) async {
    http.Response response = await http.post(
      Global.baseurl + "add_purchased_credit",
      body: ({
        "user_id": user_id,
        "credit_id": credit_id.toString(),
        "card_number": card_number.toString(),
        "card_year": card_year.toString(),
        "card_cvc": card_cvc.toString(),
        "card_name": card_name.toString(),
        "country": country.toString(),
        "amount": amount.toString(),
      }),
    );
    print(response.body);
    return response.statusCode.toString();
  }


  static Future<String> EditUser(
      String id,
      String username,
      String email,
      String password,
      String name,
      String country,
      String marketpreference,
      String showwidget) async {
    http.Response response = await http.post(
      Global.baseurl + "update_user",
      body: ({
        "id": id,
        "username": username.toString(),
        "email": email.toString(),
        "password": '0',
        "name": name.toString(),
        "country": country.toString(),
        "market preference": '1',
        "show widget": '1',
      }),
    );
    print(response.statusCode);
    return response.statusCode.toString();
  }



  static Future<GetQuizModel> getQuiz() async {
    try {
      final http.Response response =
          await http.get(Global.baseurl + "get_quiz_for_main");

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

  static Future<LeaderBoardModel> leader(userid, quiz_id, percent, time) async {
    http.Response response = await http.post(
      Global.baseurl + "submit_quiz",
      body: ({
        "user_id": userid.toString(),
        "quiz_id": quiz_id.toString(),
        "percent": percent.toString(),
        "time": time.toString(),
      }),
    );
    print(response.statusCode);
    if (response.statusCode == 201) {
      json.decode(response.body);
      return LeaderBoardModel.fromJson(json.decode(response.body));
    } else {
      return null;
    }
  }



  static Future<getquizbyuseridModel> UserQuiz(userid) async {
    http.Response response = await http.post(
      Global.baseurl + "get_quizes_by_user_id",
      body: ({
        "id": userid.toString(),
      }),
    );
    print(response.statusCode);
    if (response.statusCode == 201) {
      json.decode(response.body);
      return getquizbyuseridModel.fromJson(json.decode(response.body));
    } else {
      return null;
    }
  }


  static Future<GetQuizByID> getQuizDetail(id) async {
    try {
      final http.Response response =
          await http.get(Global.baseurl + "getquiz_by_id/$id");

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

  static Future<getCreditModel> getcredit() async {
    try {
      final http.Response response =
          await http.get(Global.baseurl + "get_credits");

      if (response.statusCode == 201) {
        return getCreditModel.fromJson(jsonDecode(response.body));
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
