import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:quizapp/ui/constant/constcolor.dart';
import 'package:quizapp/ui/pages/Reset%20Password/otp.dart';
import 'package:http/http.dart' as http;

class AddMail extends StatefulWidget {
  static const routeName = '/add_mail';

  AddMail({Key key}) : super(key: key);

  @override
  _AddMailState createState() => _AddMailState();
}

class _AddMailState extends State<AddMail> {
  final _formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  var _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      resizeToAvoidBottomPadding: false,
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
                      SizedBox(height: 20),
                      Container(
                        height: 80,
                        width: 280,
                        margin: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(30)),
                          color: Colors.white.withOpacity(0.5),
                        ),
                        padding: EdgeInsets.all(20),
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
                            hintText: 'Email',
                            prefixIcon: IconButton(
                              icon: Icon(Icons.person),
                              onPressed: () {},
                            ),
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          if (_formKey.currentState.validate()) {
                            sendMail(context, emailController.text);
                          }
                        },
                        child: Container(
                          height: 50,
                          width: 100,
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(30)),
                            color: Colors.blue[400],
                          ),
                          child: Center(
                            child: Text(
                              "Send",
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

  Future sendMail(BuildContext context, String email) async {
    final response =
        await http.post("http://a025.autosandtools.com/api/reset_pass", body: {
      'email': email,
    });

    try {
      if (response.statusCode == 201) {
        _showSuccessDialog(context);
      } else if (response.statusCode == 202) {
        Fluttertoast.showToast(
            msg: 'Your E-Mail does not match with our Database',
            toastLength: Toast.LENGTH_SHORT);
      }
    } catch (e) {
      print(e);
    }
  }

  _showSuccessDialog(BuildContext context) async {
    Fluttertoast.showToast(
            msg: 'E-Mail sent successfully!', toastLength: Toast.LENGTH_SHORT)
        .whenComplete(() async {
      _scaffoldKey.currentState.showSnackBar(new SnackBar(
        duration: new Duration(seconds: 4),
        content: new Row(
          children: <Widget>[
            new CircularProgressIndicator(
                valueColor:
                    new AlwaysStoppedAnimation<Color>(Color(0xffffffff))),
            SizedBox(width: 10),
            new Text(
              "Redirecting...",
              textAlign: TextAlign.left,
            ),
          ],
        ),
      ));
      Future.delayed(Duration(seconds: 4), () {
        Navigator.of(context)
            .pushNamedAndRemoveUntil(Otp.routeName, ModalRoute.withName('/'));
      });
      return;
    });
  }
}
