import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:progress_dialog/progress_dialog.dart';
import 'package:quizapp/ApiClass/API.dart';
import 'package:quizapp/repository/userRepository.dart';
import 'package:quizapp/ui/constant/constcolor.dart';
import 'package:quizapp/ui/pages/login.dart';
import 'package:http/http.dart' as http;

class SignupPage extends StatefulWidget {
  static const routeName = '/signup';
  static ProgressDialog pr;

  SignupPage({Key key}) : super(key: key);

  @override
  _SignupPageState createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final _formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final PasswordConrtoller = TextEditingController();
  final UsernameController= TextEditingController();
  final nameController= TextEditingController();


  @override
  void initState() {
    // TODO: implement initState
    SignupPage.pr = ProgressDialog(context);
    super.initState();
  }
  bool obs = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     backgroundColor: tintorange,
      body: SingleChildScrollView(
        child: Container(
         // color: tintorange,
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
                  child: Container(
                    height: MediaQuery.of(context).size.height * 0.8,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                    ),
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            // height: 50,
                            width: 280,
                            margin: EdgeInsets.all(10),

                            child: TextFormField(
                              controller: nameController,
                              validator: (text) {
                                if (text == null || text.isEmpty) {
                                  return 'Please Enter Name';
                                }
                                return null;
                              },
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
                                hintText: 'Name',
                                prefixIcon: IconButton(
                                  icon: Icon(Icons.person),
                                  onPressed: () {},
                                ),
                                // suffixIcon: IconButton(
                                //   icon: Icon(
                                //     FontAwesomeIcons.eye,
                                //   ),
                                //   onPressed: () {},
                                // ),
                              ),
                            ),
                          ),
                          Container(
                            width: 280,
                            margin: EdgeInsets.all(10),


                            child: TextFormField(
                              controller: UsernameController,
                              validator: (text) {
                                if (text == null || text.isEmpty) {
                                  return 'Please Enter UserName';
                                }
                                return null;
                              },
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
                                hintText: 'User Name',
                                prefixIcon: IconButton(
                                  icon: Icon(Icons.person),
                                  onPressed: () {},
                                ),
                                // suffixIcon: IconButton(
                                //   icon: Icon(
                                //     FontAwesomeIcons.eye,
                                //   ),
                                //   onPressed: () {},
                                // ),
                              ),
                            ),
                          ),
                          Container(

                            width: 280,
                            margin: EdgeInsets.all(10),


                            child: TextFormField(
                              controller: emailController,
                              validator: (text) {
                                if (text == null || text.isEmpty) {
                                  return 'Please Enter Email';
                                }
                                return null;
                              },
                              style: TextStyle(
                                fontSize: 15,
                                height: 2.0,
                              ),
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
                                hintText: 'Email',
                                prefixIcon: IconButton(
                                  icon: Icon(Icons.email),
                                  onPressed: () {},
                                ),
                              ),
                            ),
                          ),

                          Container(

                            width: 280,
                            margin: EdgeInsets.all(10),


                            child: TextFormField(
                              controller: PasswordConrtoller,
                              validator: (text) {
                                if (text == null || text.isEmpty) {
                                  return 'Please Enter Password';
                                }
                                return null;
                              },
                              obscureText: obs,
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
                          InkWell(
                            onTap: () {
                              if (_formKey.currentState.validate()) {
                                SignupPage.pr.show();
                               API.register(context, nameController.text, UsernameController.text, emailController.text, PasswordConrtoller.text)
                                    .then((value) {
                                  print(value.status);
                                  Navigator.pop(context);
                                  Navigator.of(context)
                                      .pushNamed(LoginPage.routeName);
                                });
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
                                  "REGISTER",
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                            ),
                          ),
                          FlatButton(
                            onPressed: () {
                              Navigator.pop(context);
                              Navigator.of(context)
                                  .pushNamed(LoginPage.routeName);
                            },
                            child: Text(
                              "LOGIN",
                              style: TextStyle(color: Colors.grey),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            )),
          ),
        ),
      ),
    );
  }
}
