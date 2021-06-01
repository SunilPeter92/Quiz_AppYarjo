import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:quizapp/ApiClass/API.dart';
import 'package:quizapp/ui/Model/GetQuizModel.dart';
import 'package:quizapp/ui/Model/getusercreditModel.dart';
import 'package:quizapp/ui/constant/constcolor.dart';
import 'package:quizapp/ui/pages/authenticationScreen.dart';
import 'package:quizapp/ui/pages/quizDetailPage.dart';
import 'package:shimmer/shimmer.dart';

class All_Quiz extends StatefulWidget {
  @override
  _All_QuizState createState() => _All_QuizState();
}

class _All_QuizState extends State<All_Quiz> {
  final GlobalKey<ScaffoldState> scaffoldKey = new GlobalKey<ScaffoldState>();
  int uid;
  @override
  void initState() {
    uid = AuthenticationPage.prefs.getInt('userID');
    super.initState();
  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      // backgroundColor: tintorange,
        key: scaffoldKey,
        // appBar: AppBar(
        //   title: Text('OpenTrivia'),
        //   elevation: 0,
        // ),
        appBar: AppBar(
          backgroundColor: tintorange,
          elevation: 0,
          // expandedHeight: MediaQuery.of(context).size.height * 0.15,
          // pinned: false,
          title:FutureBuilder<getUserCredit>(
              future: API.getCredit(uid),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return Container ( child: Text(  snapshot.data.credit.toString() == null ? '0 Credit' : 'Balance :' + snapshot.data.credit.toString() + 'Credit' , style: TextStyle(
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

          // flexibleSpace: Stack(
          //   children: [
          //     Positioned(
          //       child: Center(
          //         child: Container(
          //           child: Text(
          //             "Balance: \$10 Credits",
          //             style: TextStyle(
          //               color: Colors.white,
          //               //fontWeight: FontWeight.bold,
          //               fontSize: 18,
          //             ),
          //           ),
          //         ),
          //       ),
          //       top: 0,
          //       left: 0,
          //       right: 0,
          //       bottom: 60,
          //     ),
          //     Positioned(
          //       child: Container(
          //         height: 50,
          //         decoration: BoxDecoration(
          //           color: Colors.white,
          //           borderRadius: BorderRadius.vertical(
          //             top: Radius.circular(50),
          //           ),
          //         ),
          //       ),
          //       bottom: -1,
          //       left: 0,
          //       right: 0,
          //     ),
          //   ],
          // ),
        ),
        body: SingleChildScrollView(
          child: Container(
            // height: MediaQuery.of(context).size.height ,
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
                          height: MediaQuery.of(context).size.height / 1.2,
                          child: FutureBuilder<GetQuizModel>(
                              future: API.getQuiz(),
                              builder: (context, snapshot) {
                                if (snapshot.hasData) {
                                  return ListView.builder(
                                      itemCount: snapshot.data.data.length,
                                      scrollDirection: Axis.vertical,
                                      itemBuilder:
                                          (BuildContext context, int index) {
                                        return Padding(
                                          padding: const EdgeInsets.only(left: 20 , right: 20 , top: 10),
                                          child: InkWell(
                                            onTap: (){
                                              var quizid= snapshot.data.data[index].id;
                                              AuthenticationPage.prefs.setInt('quizid', quizid);
                                              print(quizid);
                                              Navigator.push(
                                                context,
                                                MaterialPageRoute(builder: (context) => QuizDetailPage(quizid:quizid)),
                                              );

                                            },
                                            child: Container(
                                              decoration: BoxDecoration(
                                                  borderRadius: BorderRadius.circular(10),
                                                  border: Border.all(color: tintorange)),
                                              height: 100,
                                              child: Row(
                                                children: [
                                                  ClipRRect(
                                                    borderRadius:
                                                    BorderRadius.circular(
                                                        8.0),
                                                    child: CachedNetworkImage(
                                                      height: 150.0,
                                                      width: 120.0,
                                                      imageUrl:
                                                      "${snapshot.data.data[index].image} ",
                                                      // imageUrl: "https://bsmedia.business-standard.com/media-handler.php?mediaPath=https://bsmedia.business-standard.com/_media/bs/img/article/2019-11/03/full/1572796865-0693.jpg&width=1200",
                                                      fit: BoxFit.fitHeight,
                                                      placeholder: (context,
                                                          url) =>
                                                          Center(
                                                              child:
                                                              new CircularProgressIndicator()),
                                                      errorWidget: (context,
                                                          url, error) =>
                                                      new Icon(Icons.error),
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding:
                                                    const EdgeInsets.only(
                                                        top: 20, left: 30),
                                                    child: Column(
                                                      children: [
                                                        Text(
                                                          snapshot.data
                                                              .data[index].name,
                                                          style: TextStyle(
                                                              fontSize: 11,
                                                              fontWeight:
                                                              FontWeight
                                                                  .w500),
                                                          maxLines: 2,
                                                        ),
                                                        Text(
                                                          "Prize:  ${snapshot.data.data[index].prize}\$",
                                                          style: TextStyle(
                                                              fontSize: 12,
                                                              fontWeight:
                                                              FontWeight
                                                                  .w500),
                                                        ),
                                                        Text(
                                                          "Category:  ${snapshot.data.data[index].catName}\$",
                                                          style: TextStyle(
                                                              fontSize: 12,
                                                              fontWeight:
                                                              FontWeight
                                                                  .w500),
                                                        ),
                                                        Text(
                                                          "Time to Complete:  ${snapshot.data.data[index].time}",
                                                          style: TextStyle(
                                                              fontSize: 12,
                                                              fontWeight:
                                                              FontWeight
                                                                  .w500),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              // Row(
                                              //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                              //   children: [
                                              //     ClipRRect(
                                              //       borderRadius: BorderRadius.circular(8.0),
                                              //       child: CachedNetworkImage(
                                              //         height: 150.0,
                                              //         width: 120.0,
                                              //         imageUrl: "https://bsmedia.business-standard.com/media-handler.php?mediaPath=https://bsmedia.business-standard.com/_media/bs/img/article/2019-11/03/full/1572796865-0693.jpg&width=1200",
                                              //         fit: BoxFit.fitHeight,
                                              //         placeholder: (context, url) => Center(child: new CircularProgressIndicator()),
                                              //         errorWidget: (context, url, error) => new Icon(Icons.error),
                                              //       ),
                                              //     ),
                                              //     Container(
                                              //       width: MediaQuery.of(context).size.width * 0.2,
                                              //       child: Text(snapshot.data.data[index].name,
                                              //         style: TextStyle(fontSize: 11),
                                              //         maxLines: 2,
                                              //       ),
                                              //     ),
                                              //     Padding(
                                              //       padding: const EdgeInsets.only(right: 10),
                                              //       child: Column(
                                              //         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                              //         children: [
                                              //           Container(
                                              //             width: MediaQuery.of(context).size.width * 0.2,
                                              //             child: Text("Time is:  ${snapshot.data.data[index].time}"),
                                              //           ),
                                              //           Container(child: Text("Prize:  ${snapshot.data.data[index].prize}\$")),
                                              //         ],
                                              //       ),
                                              //     ),
                                              //   ],
                                              // ),
                                            ),
                                          ),
                                        );
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
        ));
  }
}
