import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:quizapp/ApiClass/API.dart';
import 'package:quizapp/ui/Model/LeaderBoardModel.dart';
import 'package:quizapp/ui/constant/constcolor.dart';
import 'package:quizapp/ui/pages/authenticationScreen.dart';
import 'package:quizapp/ui/pages/home.dart';
import 'package:shimmer/shimmer.dart';

class Leaderboard extends StatefulWidget {
  static const routeName = '/leaderboard';
  LeaderBoardModel Response ;

  Leaderboard({Key key , this.Response  }) : super(key: key);

  @override
  _LeaderboardState createState() => _LeaderboardState();
}

class _LeaderboardState extends State<Leaderboard> {
  TextStyle _textStyle = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.bold,
    color: Colors.white,
  );
  @override
  void initState() {
    // TODO: implement initState
     final quizId = AuthenticationPage.prefs.getInt('quizid');
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: tintorange,
        title:  Text(
          "LEADERBOARD",
          style: TextStyle(
            color: Colors.white,
            //fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
        centerTitle: true,
        elevation: 0,
      ),
      body: Container(
        child: Stack(
          children: [ Container(
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
                  padding: const EdgeInsets.only(
                    top: 20,
                    bottom: 10,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                  widget.Response.myData.percent  + "%",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                      Text(
                        " correct in",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                      SizedBox(width: 5,),
                      Text(
                          widget.Response.myData.time + ' sec',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    height: MediaQuery.of(context).size.height * 0.5,
                    width: MediaQuery.of(context).size.width,
                    child: Card(
                      elevation: 20,
                      child: Column(
                        children: [
                          Container(
                            height: 80,
                            color: tintorange,
                            child: Row(
                              mainAxisAlignment:
                              MainAxisAlignment.spaceEvenly,
                              children: [
                                Text(
                                  "Name",
                                  style: _textStyle,
                                ),
                                Text(
                                  "Time",
                                  style: _textStyle,
                                ),
                                Text(
                                  "Percent",
                                  style: _textStyle,
                                ),
                              ],
                            ),
                          ),

                          Container(
                                    height: MediaQuery.of(context).size.height / 3,
                                    child: ListView.builder(
                                        itemCount: widget.Response.otherData.length,
                                        scrollDirection: Axis.vertical,
                                        itemBuilder: (BuildContext context, int index) {
                                          return Container(
                                            height: 60,
                                            decoration: BoxDecoration(
                                              border: Border(bottom: BorderSide(color: Colors.black, width: 2)),
                                            ),
                                            child: Row(
                                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                              children: [
                                                Text(
                                                  widget.Response.otherData[index].name == null ? 'null' : widget.Response.otherData[index].name,
                                                  style: TextStyle(fontSize: 15),
                                                ),
                                                Text(
                                                widget.Response.otherData[index].time == null ? 'null ' :  widget.Response.otherData[index].time,
                                                  style: TextStyle(fontSize: 15),
                                                ),
                                                Text(
                                                  widget.Response.otherData[index].percent + "%" == null ? 'null ' :  widget.Response.otherData[index].percent,
                                                  style: TextStyle(fontSize: 15),
                                                ),
                                              ],
                                            ),
                                          );
                                        }),
                                  )
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 30,),
                InkWell(
                  onTap: (){
                    Navigator.of(context).pushNamed(HomePage.routeName);
                  } ,
                  child: Container(
                    height: 55,
                    width: 150,
                    decoration: BoxDecoration(
                      color: Colors.blue[400],
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: Center(child: Text('Goto Home')),
                  ),
                ),

              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildListItems(BuildContext context, int index) {
    return Container(
      child: Container(
        padding: EdgeInsets.all(20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Icon(
                  Icons.person,
                  size: 20,
                ),
                Text(
                  "LoremIpsum",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 15,
                  ),
                  maxLines: 1,
                  textAlign: TextAlign.center,
                ),
              ],
            ),
            Container(
              height: 50,
              width: 80,
              padding: EdgeInsets.only(left: 5, top: 2),
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
              child: Text(
                "25 points",
                style: TextStyle(color: Colors.white),
              ),
            )
          ],
        ),
      ),
    );
  }
}

// class LeaderBoardItem extends StatelessWidget {
//   final String name;
//   final int index;
//   final String result;
//   const LeaderBoardItem({
//     Key key,
//     this.name,
//     this.index,
//     this.result,
//   }) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       height: 60,
//       decoration: BoxDecoration(
//         border: Border(bottom: BorderSide(color: Colors.black, width: 2)),
//       ),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//         children: [
//           Text(
//              snapshot.data.otherData[index].name,
//             style: TextStyle(fontSize: 15),
//           ),
//           Text(
//             "$name",
//             style: TextStyle(fontSize: 15),
//           ),
//           Text(
//             "$result",
//             style: TextStyle(fontSize: 15),
//           ),
//         ],
//       ),
//     );
//   }
// }
