import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:quizapp/ApiClass/API.dart';
import 'package:quizapp/models/response.dart';
import 'package:quizapp/ui/Model/getcreditModel.dart';
import 'package:quizapp/ui/Model/getusercreditModel.dart';
import 'package:quizapp/ui/constant/constcolor.dart';
import 'package:quizapp/ui/pages/paywithCard.dart';

import 'authenticationScreen.dart';

class AddCredit extends StatefulWidget {
  static const routeName = 'add-credit';
  AddCredit({Key key}) : super(key: key);

  @override
  _AddCreditState createState() => _AddCreditState();
}

class _AddCreditState extends State<AddCredit> {

  int crh= 2;
  int uid;
  @override
  void initState() {
    uid = AuthenticationPage.prefs.getInt('userID');
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: tintorange,
        elevation: 0,
        centerTitle: true,
        title: Text(
          "ADD CREDITS",
          style: TextStyle(
            color: Colors.white,
            //fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
      ),
      body: Container(
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
                                return Container ( child: Text(  snapshot.data.credit.toString() == null ? '0 Credit' :'Balance :' + snapshot.data.credit.toString() + 'Credit' , style: TextStyle(
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
                                  '0 Credit',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold),
                                ),
                              );
                            }),
                        Text(
                          "(See Purchase History)",
                          style: TextStyle(color: titleColor, fontSize: 12),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.05),
                Center(
                  child: Text(
                    "Select",
                    style: TextStyle(
                      color: titleColor,
                      fontSize: 20,
                    ),
                  ),
                ),
                Column(
                  children: [
                    FutureBuilder<getCreditModel>(
                        future: API.getcredit(),
                        builder: (context, snapshot) {
                          if (snapshot.hasData) {
                            return Container(
                              padding: EdgeInsets.only(left: 10, right: 10),
                              height: MediaQuery.of(context).size.height /3,
                              child: GridView.builder(
                                 gridDelegate:
                                  SliverGridDelegateWithMaxCrossAxisExtent(
                                      maxCrossAxisExtent: 250,
                                      childAspectRatio: 6 / 2,
                                      crossAxisSpacing: 10,
                                      mainAxisSpacing: 10),
                                  itemCount: snapshot.data.data.length,
                                  scrollDirection: Axis.vertical,
                                  itemBuilder: (BuildContext context, int index) {
                                    return Container(
                                      padding:
                                      EdgeInsets.only(left: 5, right: 5,top: 10),
                                      width: MediaQuery.of(context).size.width * 0.6,
                                      child: RaisedButton(
                                        shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(10)),
                                        color: Colors.lightBlue[100],
                                        onPressed: () {
                                          String credit = snapshot.data.data[index].name.toString();
                                          _BUYCREDIT(uid , credit);
                                         // String price = snapshot.data.data[index].price.toString();
                                          // Navigator.push(
                                          //   context,
                                          //   MaterialPageRoute(builder: (context) => PayWithCards(crh:crid, price:price)),);
                                        },
                                        child: Text(
                                          snapshot.data.data[index].name.toString() + " Credit  " + snapshot.data.data[index].price.toString(),
                                          style: TextStyle(color: Colors.black),
                                        ),
                                      ),
                                    );
                                  }),
                            );
                          } else if (snapshot.hasError) {
                            return Text("${snapshot.error}");
                          }

                          return CircularProgressIndicator();
                        }),

                    // Container(
                    //   child: Row(
                    //     children: [
                    //       Container(
                    //         padding:
                    //             EdgeInsets.only(left: 20, right: 20, top: 10),
                    //         width: MediaQuery.of(context).size.width * 0.5,
                    //         child: RaisedButton(
                    //           shape: RoundedRectangleBorder(
                    //               borderRadius: BorderRadius.circular(10)),
                    //           color: Colors.lightBlue[100],
                    //           onPressed: () {
                    //             Navigator.push(
                    //             context,
                    //             MaterialPageRoute(builder: (context) => PayWithCards(crh:2,)),);
                    //             },
                    //           child: Text(
                    //             "Add 2 CR",
                    //             style: TextStyle(color: Colors.black),
                    //           ),
                    //         ),
                    //       ),
                    //       Container(
                    //         padding:
                    //             EdgeInsets.only(left: 20, right: 20, top: 10),
                    //         width: MediaQuery.of(context).size.width * 0.5,
                    //         child: RaisedButton(
                    //           shape: RoundedRectangleBorder(
                    //               borderRadius: BorderRadius.circular(10)),
                    //           color: Colors.lightBlue[100],
                    //           onPressed: () { Navigator.push(
                    //             context,
                    //             MaterialPageRoute(builder: (context) => PayWithCards(crh:3,)),);},
                    //           child: Text(
                    //             "Add 3 CR",
                    //             style: TextStyle(color: Colors.black),
                    //           ),
                    //         ),
                    //       ),
                    //     ],
                    //   ),
                    // ),
                    // Container(
                    //   child: Row(
                    //     children: [
                    //       Container(
                    //         padding: EdgeInsets.only(
                    //             bottom: 20, left: 20, right: 20),
                    //         width: MediaQuery.of(context).size.width * 0.5,
                    //         child: RaisedButton(
                    //           shape: RoundedRectangleBorder(
                    //               borderRadius: BorderRadius.circular(10)),
                    //           color: Colors.lightBlue[100],
                    //           onPressed: () {
                    //             Navigator.push(
                    //               context,
                    //               MaterialPageRoute(builder: (context) => PayWithCards(crh:4,)),);
                    //           },
                    //           child: Text(
                    //             "Add 4 CR",
                    //             style: TextStyle(color: Colors.black),
                    //           ),
                    //         ),
                    //       ),
                    //       Container(
                    //         padding: EdgeInsets.only(
                    //             bottom: 20, left: 20, right: 20, top: 10),
                    //         width: MediaQuery.of(context).size.width * 0.5,
                    //         child: RaisedButton(
                    //           shape: RoundedRectangleBorder(
                    //               borderRadius: BorderRadius.circular(10)),
                    //           color: Colors.lightBlue[100],
                    //           onPressed: () {
                    //             Navigator.push(
                    //               context,
                    //               MaterialPageRoute(builder: (context) => PayWithCards(crh:5,)),);
                    //           },
                    //           child: Text(
                    //             "Add 5 CR",
                    //             style: TextStyle(color: Colors.black),
                    //           ),
                    //         ),
                    //       ),
                    //     ],
                    //   ),
                    // ),
                  ],
                ),
                // SizedBox(height: MediaQuery.of(context).size.height * 0.01),
                // Center(
                //   child: GestureDetector(
                //     onTap: () {
                //       Navigator.push(
                //         context,
                //         MaterialPageRoute(builder: (context) => PayWithCards( crh:10,)),);
                //     },
                //     child: Container(
                //       width: MediaQuery.of(context).size.width * 0.4,
                //       height: MediaQuery.of(context).size.height * 0.09,
                //       decoration: BoxDecoration(
                //           color: Colors.lightBlue[100],
                //           borderRadius: BorderRadius.all(Radius.circular(10))),
                //       child: Center(child: Text("Add 10CR and \nget ONE FREE")),
                //     ),
                //   ),
                // )
              ],
            ),
          ],
        ),
      ),
    );
  }
  Void _BUYCREDIT(uid , price){
    API.BuyCredit(
        context,
        uid.toString(),
        price).then((value) {
      if(value == '201' ){
        Fluttertoast.showToast(
            msg: 'Success',
            toastLength: Toast.LENGTH_SHORT);
      } else{
        Fluttertoast.showToast(
            msg: 'Enter Valid Credential',
            toastLength: Toast.LENGTH_SHORT);
      }

    });
  }


}
