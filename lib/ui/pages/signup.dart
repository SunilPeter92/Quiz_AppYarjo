import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:quizapp/ApiClass/API.dart';
import 'package:quizapp/ui/constant/constcolor.dart';
import 'package:quizapp/ui/pages/login.dart';

class SignupPage extends StatefulWidget {
  static const routeName = '/signup';

  SignupPage({Key key}) : super(key: key);

  @override
  _SignupPageState createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final _formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passController = TextEditingController();
  final usernameController = TextEditingController();
  final nameController = TextEditingController();

  bool obs = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
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
                  child: Container(
                    height: MediaQuery.of(context).size.height * 0.72,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                    ),
                    child: Center(
                      child: SingleChildScrollView(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              height: 80,
                              width: 280,
                              margin: EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(30)),
                                color: Colors.white.withOpacity(0.5),
                              ),
                              padding: EdgeInsets.all(20),
                              child: TextFormField(
                                controller: nameController,
                                validator: (text) {
                                  if (text == null || text.isEmpty) {
                                    return 'Please Enter Name';
                                  }
                                  return null;
                                },
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText: 'Name',
                                  prefixIcon: IconButton(
                                    icon: Icon(Icons.person),
                                    onPressed: () {},
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              height: 80,
                              width: 280,
                              margin: EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(30)),
                                color: Colors.white.withOpacity(0.5),
                              ),
                              padding: EdgeInsets.all(20),
                              child: TextFormField(
                                controller: usernameController,
                                validator: (text) {
                                  if (text == null || text.isEmpty) {
                                    return 'Please Enter UserName';
                                  }
                                  return null;
                                },
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText: 'User Name',
                                  prefixIcon: IconButton(
                                    icon: Icon(Icons.person),
                                    onPressed: () {},
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              height: 80,
                              width: 280,
                              margin: EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(30)),
                                color: Colors.white.withOpacity(0.5),
                              ),
                              padding: EdgeInsets.all(20),
                              child: TextFormField(
                                controller: emailController,
                                validator: (text) {
                                  if (text == null || text.isEmpty) {
                                    return "Please enter email";
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
                            Container(
                              height: 80,
                              width: 280,
                              margin: EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(30)),
                                color: Colors.white.withOpacity(0.5),
                              ),
                              padding: EdgeInsets.all(20),
                              child: TextFormField(
                                controller: passController,
                                validator: (text) {
                                  if (text == null || text.isEmpty) {
                                    return 'Please Enter Password';
                                  }
                                  return null;
                                },
                                obscureText: obs,
                                decoration: InputDecoration(
                                  border: InputBorder.none,
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
                                  API
                                      .register(
                                          context,
                                          nameController.text,
                                          usernameController.text,
                                          emailController.text,
                                          passController.text)
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
                                      BorderRadius.all(Radius.circular(30)),
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
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
