import 'package:flutter/material.dart';
import 'package:quizapp/ui/constant/constcolor.dart';

class Leaderboard extends StatefulWidget {
  static const routeName = '/leaderboard';
  Leaderboard({Key key}) : super(key: key);

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
                    left: 20,
                    right: 20,
                    bottom: 10,
                  ),
                  child: Text(
                    "85% correct in 60 minutes",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
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
                                  "#",
                                  style: _textStyle,
                                ),
                                Text(
                                  "NAME",
                                  style: _textStyle,
                                ),
                                Text(
                                  "RESULT",
                                  style: _textStyle,
                                ),
                              ],
                            ),
                          ),
                          LeaderBoardItem(
                              name: "John",
                              index: 1,
                              result: "50 mins 95%"),
                          LeaderBoardItem(
                              name: "Cena",
                              index: 2,
                              result: "50 mins 95%"),
                          LeaderBoardItem(
                              name: "Cent",
                              index: 3,
                              result: "50 mins 95%"),
                          LeaderBoardItem(
                              name: "Lee",
                              index: 4,
                              result: "50 mins 95%"),
                        ],
                      ),
                    ),
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

class LeaderBoardItem extends StatelessWidget {
  final String name;
  final int index;
  final String result;
  const LeaderBoardItem({
    Key key,
    this.name,
    this.index,
    this.result,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      decoration: BoxDecoration(
        border: Border(bottom: BorderSide(color: Colors.black, width: 2)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(
            "$index",
            style: TextStyle(fontSize: 15),
          ),
          Text(
            "$name",
            style: TextStyle(fontSize: 15),
          ),
          Text(
            "$result",
            style: TextStyle(fontSize: 15),
          ),
        ],
      ),
    );
  }
}
