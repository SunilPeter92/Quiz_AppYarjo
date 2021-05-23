import 'dart:async';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:quizapp/ui/constant/constcolor.dart';
import 'package:quizapp/ui/pages/Reset%20Password/reset_password.dart';

class Otp extends StatefulWidget {
  static const routeName = '/otp';
  String email ;
  Otp({Key key, @required this.email,}) : super(key: key);


  @override
  _OtpState createState() => _OtpState();
}

class _OtpState extends State<Otp> {
  var _one = TextEditingController();
  var _two = TextEditingController();
  var _three = TextEditingController();
  var _four = TextEditingController();
  var _formKey = GlobalKey<FormState>();
  var _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    final node = FocusScope.of(context);

    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: tintorange,
      body: Container(
        child: Form(
          key: _formKey,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                    top: 20,
                    left: 30,
                    right: 30,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          CircleAvatar(
                            backgroundColor: Colors.blue[400],
                            child: TextFormField(
                                keyboardType: TextInputType.number,
                                textInputAction: TextInputAction.next,
                                controller: _one,
                                cursorColor: Color(0xffffffff),
                                autofocus: true,
                                validator: (val) => val.isEmpty ? '.' : null,
                                maxLength: 1,
                                onChanged: (val) => node.nextFocus(),
                                textAlign: TextAlign.center,
                                decoration: InputDecoration(
                                  contentPadding:
                                      EdgeInsets.only(bottom: 4, left: 2),
                                  border: InputBorder.none,
                                  counterText: '',
                                )),
                          ),
                          CircleAvatar(
                            backgroundColor: Colors.blue[400],
                            child: TextFormField(
                                controller: _two,
                                textInputAction: TextInputAction.next,
                                keyboardType: TextInputType.number,
                                maxLength: 1,
                                validator: (val) => val.isEmpty ? '.' : null,
                                onChanged: (val) => node.nextFocus(),
                                cursorColor: Color(0xffffffff),
                                textAlign: TextAlign.center,
                                decoration: InputDecoration(
                                  contentPadding:
                                      EdgeInsets.only(bottom: 4, left: 2),
                                  counterText: '',
                                  border: InputBorder.none,
                                )),
                          ),
                          CircleAvatar(
                            backgroundColor: Colors.blue[400],
                            child: TextFormField(
                                controller: _three,
                                keyboardType: TextInputType.number,
                                textInputAction: TextInputAction.next,
                                maxLength: 1,
                                validator: (val) => val.isEmpty ? '.' : null,
                                onChanged: (val) => node.nextFocus(),
                                cursorColor: Color(0xffffffff),
                                textAlign: TextAlign.center,
                                decoration: InputDecoration(
                                  contentPadding:
                                      EdgeInsets.only(bottom: 4, left: 2),
                                  border: InputBorder.none,
                                  counterText: '',
                                )),
                          ),
                          CircleAvatar(
                            backgroundColor: Colors.blue[400],
                            child: TextFormField(
                                controller: _four,
                                keyboardType: TextInputType.number,
                                textInputAction: TextInputAction.done,
                                validator: (val) => val.isEmpty ? '.' : null,
                                onChanged: (val) => node.unfocus(),
                                maxLength: 1,
                                cursorColor: Color(0xffffffff),
                                textAlign: TextAlign.center,
                                decoration: InputDecoration(
                                  contentPadding:
                                      EdgeInsets.only(bottom: 4, left: 2),
                                  border: InputBorder.none,
                                  counterText: '',
                                  errorStyle:
                                      TextStyle(color: Color(0xffffffff)),
                                )),
                          ),
                        ],
                      ),
                      SizedBox(height: 20),
                      InkWell(
                        onTap: () {
                          if (_formKey.currentState.validate()) {
                            _verify(context);
                          }
                        },
                        child: Container(
                          height: 50,
                          width: 100,
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            borderRadius:
                                BorderRadius.all(Radius.circular(30)),
                            color: Colors.blue[400],
                          ),
                          child: Center(
                            child: Text(
                              "Verify",
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  //verify code from db
  Future _verify(BuildContext context) async {
    FormData data = FormData.fromMap({
      "code": "${_one.text}${_two.text}${_three.text}${_four.text}",
      'email': widget.email,
    });

    Dio dio = new Dio();

    dio
        .post("http://a025.autosandtools.com/api/verify_code", data: data)
        .then((response) {
      print(response.statusCode);

      if (response.statusCode == 201) {
        _showSuccessDialog(context);
      }
      if (response.statusCode == 202) {
        _showNotMatched(context);
      }
    }).catchError((error) => print(error.response.toString()));
  }

  _showNotMatched(BuildContext context) async {
    Fluttertoast.showToast(
            msg: 'Code not matched', toastLength: Toast.LENGTH_SHORT)
        .whenComplete(() async {});
    return;
  }

  _showSuccessDialog(BuildContext context) async {
    Fluttertoast.showToast(
            msg: 'Your code has been verified!',
            toastLength: Toast.LENGTH_SHORT)
        .whenComplete(() async {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => ResetPassword()),
      );
    });
    return;
  }
}
