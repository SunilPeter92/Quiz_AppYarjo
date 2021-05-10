import 'package:flutter/material.dart';
import 'package:quizapp/ui/constant/constcolor.dart';
import 'package:quizapp/ui/pages/paywithCard.dart';

class AddCredit extends StatefulWidget {
  static const routeName = 'add-credit';
  AddCredit({Key key}) : super(key: key);

  @override
  _AddCreditState createState() => _AddCreditState();
}

class _AddCreditState extends State<AddCredit> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                        Text(
                          "Balance:  2 credits",
                          style: TextStyle(
                              color: titleColor,
                              fontSize: 16,
                              fontWeight: FontWeight.bold),
                        ),
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
                    Container(
                      child: Row(
                        children: [
                          Container(
                            padding:
                                EdgeInsets.only(left: 20, right: 20, top: 10),
                            width: MediaQuery.of(context).size.width * 0.5,
                            child: RaisedButton(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10)),
                              color: Colors.lightBlue[100],
                              onPressed: () {},
                              child: Text(
                                "Add 2 CR",
                                style: TextStyle(color: Colors.black),
                              ),
                            ),
                          ),
                          Container(
                            padding:
                                EdgeInsets.only(left: 20, right: 20, top: 10),
                            width: MediaQuery.of(context).size.width * 0.5,
                            child: RaisedButton(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10)),
                              color: Colors.lightBlue[100],
                              onPressed: () {},
                              child: Text(
                                "Add 3 CR",
                                style: TextStyle(color: Colors.black),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      child: Row(
                        children: [
                          Container(
                            padding: EdgeInsets.only(
                                bottom: 20, left: 20, right: 20),
                            width: MediaQuery.of(context).size.width * 0.5,
                            child: RaisedButton(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10)),
                              color: Colors.lightBlue[100],
                              onPressed: () {},
                              child: Text(
                                "Add 4 CR",
                                style: TextStyle(color: Colors.black),
                              ),
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.only(
                                bottom: 20, left: 20, right: 20, top: 10),
                            width: MediaQuery.of(context).size.width * 0.5,
                            child: RaisedButton(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10)),
                              color: Colors.lightBlue[100],
                              onPressed: () {},
                              child: Text(
                                "Add 5 CR",
                                style: TextStyle(color: Colors.black),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.01),
                Center(
                  child: GestureDetector(
                    onTap: () {
                      Navigator.of(context).pushNamed(PayWithCards.routeName);
                    },
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.4,
                      height: MediaQuery.of(context).size.height * 0.09,
                      decoration: BoxDecoration(
                          color: Colors.lightBlue[100],
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                      child: Center(child: Text("Add 10CR and \nget ONE FREE")),
                    ),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
  // @override
  // Widget build(BuildContext context) {
  //   return Scaffold(
  //     backgroundColor: bgColor,
  //     body: ListView(
  //       children: [
  //         SizedBox(height: MediaQuery.of(context).size.height * 0.08),
  //         Center(
  //           child: Text(
  //             "Add Credits",
  //             style: TextStyle(color: titleColor, fontSize: 30),
  //           ),
  //         ),
  //         SizedBox(height: MediaQuery.of(context).size.height * 0.05),
  //         Padding(
  //           padding: const EdgeInsets.only(left: 20.0, right: 20),
  //           child: Row(
  //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //             children: [
  //               Text(
  //                 "Balance:  2 credits",
  //                 style: TextStyle(color: settingtextColor, fontSize: 18),
  //               ),
  //               Text(
  //                 "(See Purchase History)",
  //                 style: TextStyle(color: settingtextColor, fontSize: 18),
  //               ),
  //             ],
  //           ),
  //         ),
  //         SizedBox(height: MediaQuery.of(context).size.height * 0.05),
  //         Center(
  //           child: Text(
  //             "Select",
  //             style: TextStyle(
  //               color: titleColor,
  //               fontSize: 20,
  //             ),
  //           ),
  //         ),
  // Column(
  //   children: [
  //     Container(
  //       child: Row(
  //         children: [
  //           Container(
  //             padding: EdgeInsets.only(left: 20, right: 20, top: 10),
  //             width: MediaQuery.of(context).size.width * 0.5,
  //             child: RaisedButton(
  //               color: btnColor,
  //               onPressed: () {},
  //               child: Text(
  //                 "Add 2 CR",
  //                 style: TextStyle(color: Colors.black),
  //               ),
  //             ),
  //           ),
  //           Container(
  //             padding: EdgeInsets.only(left: 20, right: 20, top: 10),
  //             width: MediaQuery.of(context).size.width * 0.5,
  //             child: RaisedButton(
  //               color: btnColor,
  //               onPressed: () {},
  //               child: Text(
  //                 "Add 3 CR",
  //                 style: TextStyle(color: Colors.black),
  //               ),
  //             ),
  //           ),
  //         ],
  //       ),
  //     ),
  //     Container(
  //       child: Row(
  //         children: [
  //           Container(
  //             padding: EdgeInsets.only(bottom: 20, left: 20, right: 20),
  //             width: MediaQuery.of(context).size.width * 0.5,
  //             child: RaisedButton(
  //               color: btnColor,
  //               onPressed: () {},
  //               child: Text(
  //                 "Add 4 CR",
  //                 style: TextStyle(color: Colors.black),
  //               ),
  //             ),
  //           ),
  //           Container(
  //             padding: EdgeInsets.only(
  //                 bottom: 20, left: 20, right: 20, top: 10),
  //             width: MediaQuery.of(context).size.width * 0.5,
  //             child: RaisedButton(
  //               color: btnColor,
  //               onPressed: () {},
  //               child: Text(
  //                 "Add 5 CR",
  //                 style: TextStyle(color: Colors.black),
  //               ),
  //             ),
  //           ),
  //         ],
  //       ),
  //     ),
  //   ],
  // ),
  // SizedBox(height: MediaQuery.of(context).size.height * 0.03),
  // Center(
  //   child: GestureDetector(
  //     onTap: () {
  //       Navigator.of(context).pushNamed(PayWithCards.routeName);
  //     },
  //     child: Container(
  //       width: MediaQuery.of(context).size.width * 0.4,
  //       height: MediaQuery.of(context).size.height * 0.09,
  //       decoration: BoxDecoration(
  //           color: addCreditsContainer,
  //           borderRadius: BorderRadius.all(Radius.circular(20))),
  //       child: Center(child: Text("Add 10CR and \nget ONE FREE")),
  //     ),
  //   ),
  // ),
  //       ],
  //     ),
  //   );
  // }

}