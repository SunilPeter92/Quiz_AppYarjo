import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:quizapp/ApiClass/API.dart';
import 'package:quizapp/repository/userRepository.dart';
import 'package:quizapp/ui/constant/constcolor.dart';
import 'package:quizapp/ui/pages/Reset%20Password/add_mail.dart';
import 'package:quizapp/ui/pages/home.dart';
import 'package:quizapp/ui/pages/signup.dart';
import 'package:quizapp/ui/widgets/bottomNavBar.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:progress_dialog/progress_dialog.dart';



class LoginPage extends StatefulWidget {
  static const routeName = '/login';
  static ProgressDialog pr;
  LoginPage({Key key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  bool isLoggedIn ;
  bool obs = true;

  @override
  void initState() {
    // TODO: implement initState
    LoginPage.pr = ProgressDialog(context);
    super.initState();
  }
  @override
  Future<void> setState(fn) async {
    // TODO: implement setState
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs?.setBool("isLoggedIn", true);
    super.setState(fn);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: tintorange,
      body: Container(
        child: Form(
          key: _formKey,
          child: Center(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                child: Text(
                  "Logo Here",
                  style: TextStyle(color: Colors.white, fontSize: 20),
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
                      Container(

                        width: 280,
                        margin: EdgeInsets.all(10),
                        // decoration: BoxDecoration(
                        //   borderRadius: BorderRadius.all(Radius.circular(10)),
                        //   border: Border.all(color: Colors.black),
                        //   color: Colors.white.withOpacity(0.5),
                        // ),

                        child: TextFormField(
                          controller: emailController,
                          validator: (text) {
                            if (text == null || text.isEmpty) {
                              return "enter email";
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            focusedBorder: const OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.black)),
                            enabledBorder: const OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.black)),
                            errorBorder: const OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.black)),

                            fillColor: Colors.white.withOpacity(0.5),
                            filled: true,
                            hintText: 'Email',
                            prefixIcon: IconButton(
                              icon: Icon(Icons.person),
                              onPressed: () {},
                            ),
                          ),
                        ),
                      ),
                      Container(

                        width: 280,
                        margin: EdgeInsets.all(10),

                        child: TextFormField(
                          obscureText: obs,
                          validator: (text) {
                            if (text == null || text.isEmpty) {
                              return "enter password";
                            }
                            return null;
                          },
                          controller: passwordController,
                          decoration: InputDecoration(
                            fillColor: Colors.white.withOpacity(0.5),
                            filled: true,
                            border: InputBorder.none,
                            focusedBorder: const OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.black)),
                            // border:OutlineInputBorder(
                            //     borderSide: BorderSide(color: Colors.black)),
                            enabledBorder: const OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.black)),
                            errorBorder: const OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.black)),
                            hintText: 'Password',
                            prefixIcon: IconButton(
                              icon: Icon(Icons.lock),
                              onPressed: () {},
                            ),
                            suffixIcon: IconButton(
                              icon: Icon(
                                FontAwesomeIcons.eye,
                              ),
                              onPressed: () {
                                setState(() {
                                  obs = !obs;
                                });
                              },
                            ),
                          ),
                        ),
                      ),

                      FlatButton(
                        onPressed: () {
                          Navigator.pushNamed(
                              context, AddMail.routeName);
                        },
                        child: Text(
                          "Forgot Password?",
                          style: TextStyle(color: Colors.grey),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          if (_formKey.currentState.validate()) {
                          //  Navigator.of(context).pushNamed(HomePage.routeName);
                            LoginPage.pr.show();
                           API.login(context, emailController.text, passwordController.text);
                            // userLogin(email.text, password.text);
                          }
                        },
                        child: Container(
                          height: 50,
                          width: 100,
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            borderRadius:
                                BorderRadius.all(Radius.circular(10)),
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
                      FlatButton(
                        onPressed: () {
                          Navigator.pop(context);
                          Navigator.of(context).pushNamed(SignupPage.routeName);
                        },
                        child: Text(
                          "Register",
                          style: TextStyle(color: Colors.grey),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          )),
        ),
      ),
    );
  }
}
