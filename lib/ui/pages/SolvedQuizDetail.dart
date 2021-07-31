import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:quizapp/ApiClass/API.dart';
import 'package:quizapp/ui/Model/GetsSolvedQuizModel.dart';
import 'package:quizapp/ui/constant/constcolor.dart';
import 'package:shimmer/shimmer.dart';

class SolvedQuiz extends StatefulWidget {
  var quizid;

  SolvedQuiz({Key key, this.quizid}) : super(key: key);

  @override
  _SolvedQuizState createState() => _SolvedQuizState();
}

class _SolvedQuizState extends State<SolvedQuiz> {
  final GlobalKey<ScaffoldState> scaffoldKey = new GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      key: scaffoldKey,
      appBar: AppBar(
        backgroundColor: tintorange,
        elevation: 0,
        centerTitle: true,
        title: Image.asset(
          'assets/icons/Logo.jpeg',
          width: 150,
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
                        FutureBuilder<GetSolvedQuizModel>(
                            future: API.SolvedQuizDetail(widget.quizid),
                            builder: (context, snapshot) {
                              GetSolvedQuizModel getQuiz = snapshot.data;

                              if (snapshot.hasData) {
                                return Column(
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.only(
                                          top: 0, bottom: 10, right: 20, left: 20),
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(8.0),
                                        child: CachedNetworkImage(
                                          imageUrl:
                                          "https://bsmedia.business-standard.com/media-handler.php?mediaPath=https://bsmedia.business-standard.com/_media/bs/img/article/2019-11/03/full/1572796865-0693.jpg&width=1200",
                                          fit: BoxFit.fitHeight,
                                          placeholder: (context, url) => Center(
                                              child:
                                              new CircularProgressIndicator()),
                                          errorWidget: (context, url, error) =>
                                          new Icon(Icons.error),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(
                                        top: 10,
                                        left: 20,
                                        right: 20,
                                        bottom: 0,
                                      ),
                                      child: Column(
                                        children: [
                                          Row(

                                            children: [
                                              Text(
                                                " Name : ",
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    fontWeight: FontWeight.w600),
                                              ),
                                              Text(
                                                getQuiz.status.name == null ? 'John' : getQuiz.status.name,
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    fontWeight: FontWeight.w600),
                                              ),
                                            ],
                                          ),
                                          SizedBox(height: 10,),
                                          Row(
                                            children: [
                                              Text(
                                                " Prize :",
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    fontWeight: FontWeight.w600),
                                              ),
                                              Text(
                                               getQuiz.status.prize,
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    fontWeight: FontWeight.w600),
                                              ),
                                            ],
                                          ),
                                          SizedBox(height: 10,),
                                          Row(
                                            children: [
                                              Text(
                                                " Price : ",
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    fontWeight: FontWeight.w600),
                                              ),
                                              Text(
                                                getQuiz.status.price,
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    fontWeight: FontWeight.w600),
                                              ),
                                            ],
                                          ),
                                          SizedBox(height: 10,),
                                          // Row(
                                          //   children: [
                                          //     Text(
                                          //       " Category :",
                                          //       style: TextStyle(
                                          //           fontSize: 15,
                                          //           fontWeight: FontWeight.w600),
                                          //     ),
                                          //     Text(
                                          //      getQuiz.status.catName,
                                          //       style: TextStyle(
                                          //           fontSize: 15,
                                          //           fontWeight: FontWeight.w600),
                                          //     ),
                                          //   ],
                                          // ),
                                          SizedBox(height: 10,),
                                          Row(
                                            children: [
                                              Text(
                                                "NO of questions:",
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    fontWeight: FontWeight.w600),
                                              ),
                                              Text(
                                                getQuiz.status.noOfQues,
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    fontWeight: FontWeight.w600),
                                              ),
                                            ],
                                          ),
                                          SizedBox(height: 10,),
                                          Row(
                                            children: [
                                              Text(
                                                "Time to Complete : ",
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    fontWeight: FontWeight.w600),
                                              ),
                                              Text(
                                                getQuiz.status.time,
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    fontWeight: FontWeight.w600),
                                              ),
                                            ],
                                          ),
                                          SizedBox(height: 10,),
                                          Row(
                                            children: [
                                              AutoSizeText(
                                                "Result : ",
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    fontWeight: FontWeight.w600),
                                              ),
                                              AutoSizeText(
                                                "${getQuiz.status.percent} %",
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    fontWeight: FontWeight.w600),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),



                                  ],
                                );
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
                        // Padding(
                        //   padding: EdgeInsets.all(10),
                        //   child: Row(
                        //     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        //     children: [
                        //       InkWell(
                        //         onTap: (){ _startQuiz(20);},
                        //         child: Container(
                        //          height: 35,
                        //           width: 100,
                        //           decoration: BoxDecoration(
                        //             color: Colors.blue,
                        //             borderRadius: BorderRadius.circular(20)
                        //           ),
                        //           // onPressed: () {
                        //           //   Navigator.of(context).pushNamed(DummyQuizPage.routeName);
                        //           // },
                        //           child: Center(
                        //             child: Text(
                        //               "Pay (5\$)",style: TextStyle(color: Colors.white),
                        //             ),
                        //           ),
                        //         ),
                        //       ),
                        //       InkWell(
                        //         onTap: (){
                        //          // _startQuiz(20);
                        //           },
                        //         child: Container(
                        //           height: 35,
                        //           width: 100,
                        //           decoration: BoxDecoration(
                        //               color: Colors.blue,
                        //               borderRadius: BorderRadius.circular(20)
                        //           ),
                        //           // onPressed: () {
                        //           //   Navigator.of(context).pushNamed(DummyQuizPage.routeName);
                        //           // },
                        //           child: Center(
                        //             child: Text(
                        //               "Home",style: TextStyle(color: Colors.white),
                        //             ),
                        //           ),
                        //         ),
                        //       ),
                        //     ],
                        //   ),
                        // )
                      ],
                    )
                  ],
                ),
              ],
            ),
          )),
    );
  }
}
