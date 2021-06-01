import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:quizapp/ui/constant/constcolor.dart';
import 'package:quizapp/ui/pages/login.dart';
import 'package:quizapp/ui/pages/signup.dart';
import 'package:quizapp/ui/widgets/bottomNavBar.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthenticationPage extends StatefulWidget {
  static const routeName = '/authentication-screen';
  static SharedPreferences prefs;
  AuthenticationPage({Key key}) : super(key: key);

  @override
  _AuthenticationPageState createState() => _AuthenticationPageState();
}

class _AuthenticationPageState extends State<AuthenticationPage> {

  initi(){
    SharedPreferences.getInstance().then((prefs) {
      AuthenticationPage.prefs = prefs;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    initi();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: tintorange,
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
        Container(
          child: Image.asset(
            'assets/icons/Logo.jpeg',
            height: 60,
            width: 150,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(
            top: 20,
            left: 30,
            right: 30,
          ),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: 20),
                GestureDetector(
                  onTap: () {

                    Navigator.of(context).pushNamed(LoginPage.routeName);
                  },
                  child: Container(
                    height: 50,
                    width: 220,
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(30)),
                      color: Colors.blue[400],
                    ),
                    child: Center(
                      child: Text(
                        "LOGIN",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                GestureDetector(
                  onTap: () {

                    Navigator.of(context).pushNamed(SignupPage.routeName);
                  },
                  child: Container(
                    height: 50,
                    width: 220,
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(
                        Radius.circular(30),
                      ),
                      color: Colors.blue[400],
                    ),
                    child: Center(
                      child: Text(
                        "Create Account",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
          ],
        ),
      ),
    );
  }
}
