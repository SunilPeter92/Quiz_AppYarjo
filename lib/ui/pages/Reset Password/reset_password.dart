import 'package:flutter/material.dart';
import 'package:quizapp/ApiClass/API.dart';
import 'package:quizapp/ui/constant/constcolor.dart';
import 'package:quizapp/ui/pages/authenticationScreen.dart';

class ResetPassword extends StatefulWidget {
  static const routeName = 'reset-password';

  ResetPassword({Key key}) : super(key: key);

  @override
  _ResetPasswordState createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPassword> {

  int uid;
  void initState() {
    super.initState();
    uid = AuthenticationPage.prefs.getInt('userID');
    print(uid);
  }

  final passwordController = TextEditingController();
  final ConfirmpasswordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: tintorange,
        elevation: 0,
        centerTitle: true,
        title: Text(
          "RESET PASSWORD",
          style: TextStyle(
            color: Colors.white,
            fontSize: 18,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
            color: Colors.white,
            height: MediaQuery.of(context).size.height / 1.2,
            child: Column(
              children: [
                Stack(
                  children: [
                    Container(
                      color: tintorange,
                      height: 50,
                    ),
                    Form(
                      key: _formKey,
                      child: Column(
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
                          // Container(
                          //   color: Colors.white,
                          //     child: Column(
                          //   crossAxisAlignment: CrossAxisAlignment.start,
                          //   children: [
                          //     Padding(
                          //       padding:
                          //           const EdgeInsets.only(top: 8.0, left: 15),
                          //       child: Text(
                          //         "Old Password",
                          //         style: TextStyle(
                          //             fontSize: 18, color: titleColor),
                          //       ),
                          //     ),
                          //     Padding(
                          //       padding: const EdgeInsets.only(
                          //           bottom: 15.0, left: 5, right: 10, top: 5),
                          //       child: Container(
                          //         height: 40,
                          //         decoration: BoxDecoration(
                          //           color: Colors.white,
                          //           borderRadius:
                          //               new BorderRadius.circular(10.0),
                          //         ),
                          //         child: TextFormField(
                          //           obscureText: true,
                          //           decoration: InputDecoration(
                          //             focusedBorder: OutlineInputBorder(
                          //               // borderRadius: BorderRadius.circular(25.0),
                          //               borderSide: BorderSide(
                          //                 color: tintorange,
                          //               ),
                          //             ),
                          //             enabledBorder: OutlineInputBorder(
                          //               borderSide: BorderSide(
                          //                 color: tintorange,
                          //               ),
                          //             ),
                          //             suffixIcon: Padding(
                          //                 padding: EdgeInsets.all(10),
                          //                 child:
                          //                     Icon(Icons.remove_red_eye_sharp)),
                          //             hintText: "*********",
                          //           ),
                          //         ),
                          //       ),
                          //     ),
                          //   ],
                          // )),
                          Container(
                              color: Colors.white,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        top: 8.0, left: 15),
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
                                        top: 5),
                                    child: Container(
                                      height: 40,
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius:
                                        new BorderRadius.circular(10.0),
                                      ),
                                      child: TextFormField(
                                        controller: passwordController,
                                        validator: (value) {
                                          if (value == null || value.isEmpty) {
                                            return 'Please enter some text';
                                          }
                                          return null;
                                        },
                                        obscureText: true,
                                        decoration: InputDecoration(
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
                                          suffixIcon: Padding(
                                              padding: EdgeInsets.all(10),
                                              child: Icon(
                                                  Icons.remove_red_eye_sharp)),
                                          hintText: "*********",
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              )),
                          // Container(
                          //     color: Colors.white,
                          //     child: Column(
                          //       crossAxisAlignment: CrossAxisAlignment.start,
                          //       children: [
                          //         Padding(
                          //           padding: const EdgeInsets.only(
                          //               top: 8.0, left: 15),
                          //           child: Text(
                          //             "Confirm New Password",
                          //             style: TextStyle(
                          //                 fontSize: 18, color: titleColor),
                          //           ),
                          //         ),
                          //         Padding(
                          //           padding: const EdgeInsets.only(
                          //               bottom: 15.0,
                          //               left: 5,
                          //               right: 10,
                          //               top: 5),
                          //           child: Container(
                          //             height: 40,
                          //             decoration: BoxDecoration(
                          //               color: Colors.white,
                          //               borderRadius:
                          //               new BorderRadius.circular(10.0),
                          //             ),
                          //             child: TextFormField(
                          //               obscureText: true,
                          //               controller: ConfirmpasswordController,
                          //
                          //               decoration: InputDecoration(
                          //                 focusedBorder: OutlineInputBorder(
                          //                   // borderRadius: BorderRadius.circular(25.0),
                          //                   borderSide: BorderSide(
                          //                     color: tintorange,
                          //                   ),
                          //                 ),
                          //                 enabledBorder: OutlineInputBorder(
                          //                   borderSide: BorderSide(
                          //                     color: tintorange,
                          //                   ),
                          //                 ),
                          //                 suffixIcon: Padding(
                          //                     padding: EdgeInsets.all(10),
                          //                     child: Icon(
                          //                         Icons.remove_red_eye_sharp)),
                          //                 hintText: "*********",
                          //               ),
                          //             ),
                          //           ),
                          //         ),
                          //       ],
                          //     )),
                        ],
                      ),
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
                      if (_formKey.currentState.validate() ) {
                        API.changePassword(context, uid, passwordController);
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
            )),
      ),
    );
  }
}
