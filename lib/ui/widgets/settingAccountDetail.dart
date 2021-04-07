import 'package:flutter/material.dart';
import 'package:quizapp/ui/constant/constcolor.dart';

class AccountDetailSetting extends StatelessWidget {
  const AccountDetailSetting({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Column(
        children: [
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
          Container(child: _accountDetail("Username: lordoftheworld")),
          Container(child: _accountDetail("Name: Lord Neilson")),
          Container(child: _accountDetail("Country: UK")),
          Container(child: _accountDetail("Email: lordiakkunblah@gmail.com")),
          Container(
            child: _accountDetail(
                "Maketing Preferences: Can send email about offers and new quizess,"),
          ),
          Container(child: _accountDetail("Show Widgets: News")),

          
        ],
      ),
    );
  }

  Widget _accountDetail(String message) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 6.0,
        bottom: 6.0,
        left: 15,
        right: 10,
      ),
      child: Align(
       alignment : Alignment.centerLeft,
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
}
