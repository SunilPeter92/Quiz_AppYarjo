import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:global_configuration/global_configuration.dart';
import 'package:quizapp/helper/helper.dart';
import 'package:quizapp/ui/constant/constant.dart' as globals;
import 'package:quizapp/models/apiModel.dart';
import 'package:shared_preferences/shared_preferences.dart';

ApiConfig apiData;
Future<ApiConfig> getApiLink() async {
  // ignore: deprecated_member_use
  final String url = '${GlobalConfiguration().getString('base_url')}';
  final response = await http.get(url);
  if (response.statusCode == 201) {
    if (json.decode(response.body)['data'] != null) {
      SharedPreferences perfs = await SharedPreferences.getInstance();
      await perfs.setString('apiData', json.encode(json.decode(response.body)['data']));
      apiData = ApiConfig.fromJson(json.decode(response.body)['data']);
      globals.url = apiData.url;
    }
  }
  print("data: ${apiData.url}");
  return apiData;
}

Future<String> getbaseApiUrl() async {
  String url;
  
  return url;
}
