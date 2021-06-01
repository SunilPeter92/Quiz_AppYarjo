import 'package:flutter/material.dart';
import 'package:quizapp/repository/apiconfiguration.dart';
import 'package:quizapp/ui/pages/authenticationScreen.dart';
import 'package:quizapp/ui/pages/home.dart';
import 'package:quizapp/ui/pages/login.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  SplashScreen({Key key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  Future<void> main() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var status = prefs.getBool('isLoggedIn') ?? true;
    print(status);
    runApp(MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            visualDensity: VisualDensity.adaptivePlatformDensity,
            primaryColor: Colors.black),
        home: status == true ? LoginPage() : HomePage()));
  }
  void showRelevant() async {
    await Future.delayed(Duration(seconds: 5));
    Navigator.of(context).pushNamed(LoginPage.routeName);
  }

  @override
  void initState() {
    super.initState();
   
  //  getApiLink().then((value) => value.url);
    main();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueAccent[400],
      body: Center(
        child:  Image.asset(
          'assets/icons/Logo.jpeg',
          width: 150,
        ),
      ),
    );
  }
}
