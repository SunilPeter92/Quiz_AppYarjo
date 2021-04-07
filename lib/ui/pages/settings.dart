import 'package:flutter/material.dart';
import 'package:quizapp/ui/constant/constcolor.dart';
import 'package:quizapp/ui/pages/addCredit.dart';
import 'package:quizapp/ui/pages/changePassword.dart';
import 'package:quizapp/ui/pages/credithistory.dart';
import 'package:quizapp/ui/pages/editAccount.dart';
import 'package:quizapp/ui/widgets/settingAccountDetail.dart';

class Settings extends StatefulWidget {
  static const routeName = 'settingPage';
  Settings({Key key}) : super(key: key);

  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: tintorange,
        centerTitle: true,
        elevation: 0,
        title: Text(
          "SETTING",
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
                                    Text(
                                      "Balance:  2 credits",
                                      style: TextStyle(
                                          color: titleColor,
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    InkWell(
                                      onTap: (){
                                        Navigator.of(context).pushNamed(CreditHistory.routeName);
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
                            AccountDetailSetting(),
                            SizedBox(height: 50),
                            Container(
                              child: Row(
                                children: [
                                  Container(
                                    padding:
                                    EdgeInsets.only(left: 10, ),
                                    width: MediaQuery.of(context).size.width * 0.5,
                                    child: RaisedButton(
                                      shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(10)),
                                      color: Colors.lightBlue[100],
                                      onPressed: () {
                                        Navigator.of(context).pushNamed(EditAccount.routeNamne);
                                      },
                                      child: Text(
                                        "Edit Acc Details",
                                        style: TextStyle(color: Colors.black),
                                      ),
                                    ),
                                  ),
                                  Container(
                                    padding: EdgeInsets.only(
                                      left: 10,
                                      right: 20,
                                    ),
                                    width: MediaQuery.of(context).size.width * 0.5,
                                    child: RaisedButton(
                                      shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(10)),
                                      color: Colors.lightBlue[100],
                                      onPressed: () {
                                        Navigator.of(context).pushNamed(ChangePassword.routeName);
                                      },
                                      child: Text(
                                        "Change a PW",
                                        style: TextStyle(color: Colors.black),
                                      ),
                                    ),
                                  ),
                                ],
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

                                },
                                child: Text(
                                  "Privacy Policy and Data Protection",
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
