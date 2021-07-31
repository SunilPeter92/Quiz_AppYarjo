import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:quizapp/ApiClass/API.dart';
import 'package:quizapp/ui/Model/getusercreditModel.dart';
import 'package:quizapp/ui/constant/constcolor.dart';
import 'package:quizapp/ui/pages/addCredit.dart';
import 'package:quizapp/ui/pages/authenticationScreen.dart';
import 'package:quizapp/ui/pages/changePassword.dart';
import 'package:quizapp/ui/pages/credithistory.dart';
import 'package:quizapp/ui/pages/editAccount.dart';
import 'package:quizapp/ui/Model/getuserModel.dart';

import 'package:quizapp/ui/widgets/settingAccountDetail.dart';

class Settings extends StatefulWidget {
  static const routeName = 'settingPage';
  Settings({Key key}) : super(key: key);

  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  int uid;
  @override
  void initState() {
    // TODO: implement initState
    uid = AuthenticationPage.prefs.getInt('userID');

    super.initState();
  }

  Widget _accountDetail(String message) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 6.0,
        bottom: 6.0,
        left: 20,
        right: 20,
      ),
      child: Align(
          alignment: Alignment.centerLeft,
          child: Text(
            message,
            style: TextStyle(
              color: titleColor,
              fontSize: 16,
            ),
            textAlign: TextAlign.left,
            maxLines: 3,
          )),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: tintorange,
        centerTitle: true,
        elevation: 0,
        title: Text(
          "SETTINGS",
          style: TextStyle(
            color: Colors.white,
            //fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Stack(
            children: [
              Container(
                color: tintorange,
                height: 50,
              ),
              Column(
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
                  Padding(
                    padding: const EdgeInsets.only(left: 20.0, right: 20),
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          FutureBuilder<getUserCredit>(
                              future: API.getCredit(uid),
                              builder: (context, snapshot) {
                                if (snapshot.hasData) {
                                  return Container ( child: Text(  snapshot.data.credit.toString() == null ? '0 Cr' :'Balance :' + snapshot.data.credit.toString() + 'Cr' ,style: TextStyle(
                                      color: titleColor,
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold),)

                                  );
                                } else if (snapshot.hasError) {
                                  return Text("${snapshot.error}");
                                }

                                // By default, show a loading spinner
                                return Container(
                                  child: Text(
                                    '0 Cr',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold),
                                  ),
                                );
                              }),

                          InkWell(
                            onTap: () {
                              Navigator.of(context)
                                  .pushNamed(CreditHistory.routeName);
                            },
                            child: Text(
                              "(See Purchase History)",
                              style: TextStyle(color: titleColor, fontSize: 12),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(
                      bottom: 20,
                      left: 20,
                      right: 20,
                      top: 30,
                    ),
                    width: MediaQuery.of(context).size.width,
                    child: RaisedButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      color: Colors.lightBlue[100],
                      onPressed: () {
                        //  Navigator.of(context).pushNamed(CreditHistory.routeName);
                        Navigator.of(context).pushNamed(AddCredit.routeName);
                      },
                      child: Text(
                        "Add Credits",
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  // AccountDetailSetting(),
                  Container(
                    padding: EdgeInsets.only(right: 20, bottom: 20),
                    child: Text(
                      "Account Details",
                      style: TextStyle(
                        color: titleColor,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.left,
                    ),
                  ),
                  FutureBuilder<GetUserModel>(
                      future: API.GetUser(uid),
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          return Container ( child:Column( children: [
                           _accountDetail('Username :' +'  '+ snapshot.data.username),
                            _accountDetail('Name :' +'  '+ snapshot.data.name),
                            _accountDetail('Email :' +'  '+ snapshot.data.email),
                            //  _accountDetail('Country :' +'  '+ snapshot.data.country== null? 'hello':snapshot.data.country ),
                            // _accountDetail('Marketing Preferences :' +'  '+ snapshot.data.marketPreference != null? snapshot.data.marketPreference : 'hmm'),
                            //  _accountDetail('Show Widget :' +'  '+ snapshot.data.showWidget == null ? 'hello':snapshot.data.showWidget ),
                              ],));
                        } else if (snapshot.hasError) {
                          return Text("${snapshot.error}");
                        }

                        // By default, show a loading spinner
                        return Container(
                          child: Text(
                            'name',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 15,
                                fontWeight: FontWeight.bold),
                          ),
                        );
                      }),
                  // // FutureBuilder<GetUserModel>(
                  // //     future: API.GetUser(uid),
                  // //     builder: (context, snapshot) {
                  // //       if (snapshot.hasData) {
                  // //         return
                  //
                  //       // } else if (snapshot.hasError) {
                  //       //   return Text("${snapshot.error}");
                  //       // }
                  //
                  //       // By default, show a loading spinner
                  //       // return Container(
                  //       //   child: Text(
                  //       //     'name',
                  //       //     style: TextStyle(
                  //       //         color: Colors.white,
                  //       //         fontSize: 15,
                  //       //         fontWeight: FontWeight.bold),
                  //       //   ),
                  //       // );
                  //     }),


                  SizedBox(height: 30),
                  Padding(
                    padding: const EdgeInsets.only( left: 20,
                      right: 20,),
                    child: Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width * 0.45,
                            child: RaisedButton(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10)),
                              color: Colors.lightBlue[100],
                              onPressed: () {
                                Navigator.of(context)
                                    .pushNamed(EditAccount.routeNamne);
                              },
                              child: Text(
                                "Edit Acc Details",
                                style: TextStyle(color: Colors.black),
                              ),
                            ),
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width * 0.42,
                            child: RaisedButton(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10)),
                              color: Colors.lightBlue[100],
                              onPressed: () {
                                Navigator.of(context)
                                    .pushNamed(ChangePassword.routeName);
                              },
                              child: Text(
                                "Change PW",
                                style: TextStyle(color: Colors.black),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(
                      bottom: 20,
                      left: 20,
                      right: 20,
                      top: 30,
                    ),
                    width: MediaQuery.of(context).size.width,
                    child: RaisedButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      color: Colors.lightBlue[100],
                      onPressed: () {},
                      child: Text(
                        "Privacy Policy and Disclaimer",
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
