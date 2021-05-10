import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:quizapp/ApiClass/API.dart';
import 'package:quizapp/ui/constant/constcolor.dart';

class ChangePassword extends StatefulWidget {
  static const routeName = 'change-password';

  ChangePassword({Key key}) : super(key: key);

  @override
  _ChangePasswordState createState() => _ChangePasswordState();
}

class _ChangePasswordState extends State<ChangePassword> {
  var _passwordController = TextEditingController();
  var _confirmPasswordController = TextEditingController();
  var _formKey = GlobalKey<FormState>();

  bool obs = false;
  bool obs1 = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: tintorange,
        elevation: 0,
        centerTitle: true,
        title: Text(
          "CHANGE PASSWORD",
          style: TextStyle(
            color: Colors.white,
            //fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          color: Colors.white,
          height: MediaQuery.of(context).size.height / 1.2,
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                Stack(
                  children: [
                    Container(
                      color: tintorange,
                      height: 50,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          height: 50,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.vertical(
                              top: Radius.circular(50),
                            ),
                          ),
                        ),
                        Container(
                            color: Colors.white,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding:
                                      const EdgeInsets.only(top: 8.0, left: 15),
                                  child: Text(
                                    "New Password",
                                    style: TextStyle(
                                        fontSize: 18, color: titleColor),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      bottom: 15.0,
                                      left: 5,
                                      right: 10,
                                      top: 15),
                                  child: Container(
                                    height: 40,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius:
                                          new BorderRadius.circular(10.0),
                                    ),
                                    child: TextFormField(
                                      obscureText: true,
                                      controller: _passwordController,
                                      validator: (val) {
                                        if (val.isEmpty) {
                                          return 'Please enter password';
                                        }
                                        if (val.length < 6) {
                                          return 'Password length too short';
                                        }
                                        return null;
                                      },
                                      decoration: InputDecoration(
                                        hintText: '********',
                                        focusedBorder: OutlineInputBorder(
                                          // borderRadius: BorderRadius.circular(25.0),
                                          borderSide: BorderSide(
                                            color: tintorange,
                                          ),
                                        ),
                                        enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: tintorange,
                                          ),
                                        ),
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
                                ),
                              ],
                            )),
                        Container(
                          color: Colors.white,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.only(top: 8.0, left: 15),
                                child: Text(
                                  "Confirm New Password",
                                  style: TextStyle(
                                      fontSize: 18, color: titleColor),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                    bottom: 15.0, left: 5, right: 10, top: 15),
                                child: Container(
                                  height: 40,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius:
                                        new BorderRadius.circular(10.0),
                                  ),
                                  child: TextFormField(
                                    obscureText: true,
                                    controller: _confirmPasswordController,
                                    validator: (val) {
                                      if (val.isEmpty) {
                                        return 'Please enter password';
                                      }
                                      if (val.length < 6) {
                                        return 'Password length too short';
                                      }
                                      if (val != _passwordController.text) {
                                        return 'Passwords do not match';
                                      }
                                      return null;
                                    },
                                    decoration: InputDecoration(
                                      hintText: '********',
                                      focusedBorder: OutlineInputBorder(
                                        // borderRadius: BorderRadius.circular(25.0),
                                        borderSide: BorderSide(
                                          color: tintorange,
                                        ),
                                      ),
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: tintorange,
                                        ),
                                      ),
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
                                            obs1 = !obs1;
                                          });
                                        },
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                Spacer(),
                Container(
                  height: 50,
                  width: 250,
                  child: RaisedButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    color: Colors.lightBlue[400],
                    textColor: Colors.white,
                    onPressed: () {
                      if (_formKey.currentState.validate()) {
                        API.changePassword(
                            context, 30, _passwordController.text);
                      }
                    },
                    child: Text(
                      "Change",
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
