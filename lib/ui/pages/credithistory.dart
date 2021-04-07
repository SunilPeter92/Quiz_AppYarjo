import 'package:flutter/material.dart';
import 'package:quizapp/ApiClass/API.dart';
import 'package:quizapp/ui/Model/PurchaseHistoryModel.dart';
import 'package:quizapp/ui/constant/constcolor.dart';
import 'package:shimmer/shimmer.dart';

class CreditHistory extends StatefulWidget {
  static const routeName = 'credit-history';
  CreditHistory({Key key}) : super(key: key);

  @override
  _CreditHistoryState createState() => _CreditHistoryState();
}

class _CreditHistoryState extends State<CreditHistory> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: tintorange,
        elevation: 0,
        centerTitle: true,
        title: Text(
          "CREDIT HISTORY",
          style: TextStyle(
            color: Colors.white,
            //fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              Stack(
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
                      Container(
                        padding: EdgeInsets.only(left: 20, right: 20, top: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              width: 55,
                                child: Text(
                              'Credits',
                              style: TextStyle(
                                fontWeight: FontWeight.w700,
                              ),
                            )),
                            Container(
                              width: 55,
                              child: Text(
                                'Price',
                                style: TextStyle(
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ),
                            Text(
                              'Date&Time',
                              style: TextStyle(
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        height: MediaQuery.of(context).size.height / 2,
                        child: FutureBuilder<PurchaseHistoryModel>(
                            future: API.PurchaseHistory(),
                            builder: (context, snapshot) {
                              if (snapshot.hasData) {
                                return ListView.builder(
                                    itemCount: snapshot.data.status.length,
                                    scrollDirection: Axis.vertical,
                                    itemBuilder:
                                        (BuildContext context, int index) {
                                      return Container(
                                          padding: EdgeInsets.only(
                                              left: 20, right: 20, top: 10),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(snapshot
                                                  .data.status[index].name),
                                              Padding(
                                                padding: const EdgeInsets.only(left: 30),
                                                child: Text(snapshot
                                                    .data.status[index].price
                                                    .toString()),
                                              ),
                                              Text(snapshot
                                                  .data.status[index].date)
                                            ],
                                          ));
                                    });
                              } else if (snapshot.hasError) {
                                return Text("${snapshot.error}");
                              }

                              // By default, show a loading spinner
                              return Shimmer.fromColors(
                                  baseColor: Colors.grey[300],
                                  highlightColor: Colors.white,
                                  child: Container(
                                    color: Colors.black,
                                    height: MediaQuery.of(context).size.height,
                                  ));
                            }),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      // ListView(
      //   children: [
      //      SizedBox(height: MediaQuery.of(context).size.height * 0.08),
      //     Center(
      //       child: Text(
      //         "Credit History",
      //         style: TextStyle(color: titleColor, fontSize: 30),
      //       ),
      //     ),
      //     Container(
      //       padding: EdgeInsets.all(20),
      //       child: Column(
      //         crossAxisAlignment: CrossAxisAlignment.start,
      //         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      //         children: [
      //           Padding(
      //             padding: const EdgeInsets.all(8.0),
      //             child: Text("2",),
      //           ),
      //           Padding(
      //             padding: const EdgeInsets.all(8.0),
      //             child: Row(
      //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //               children: [
      //                 Text("Credits Added"),
      //                 Text("13/4/2020"),
      //               ],
      //             ),
      //           ),

      //           Padding(
      //             padding: const EdgeInsets.all(8.0),
      //             child: Row(
      //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //               children: [
      //                 Text("Bought Quizx"),
      //                 Text("15/4/2020"),
      //               ],
      //             ),
      //           ),
      //           Padding(
      //             padding: const EdgeInsets.all(8.0),
      //             child: Text("5 Credits Added"),
      //           ),
      //           Padding(
      //             padding: const EdgeInsets.all(8.0),
      //             child: Row(
      //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //               children: [
      //                 Text("Quizx"),
      //                 Text("28/4/2020"),
      //               ],
      //             ),
      //           ),
      //         ],
      //       ),
      //     ),
      //   ],
      // ),
    );
  }
}
