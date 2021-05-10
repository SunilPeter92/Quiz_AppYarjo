import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:pie_chart/pie_chart.dart';

class MyAccount extends StatefulWidget {
  static const routeName = '/MyAccount';
  MyAccount({Key key}) : super(key: key);

  @override
  _MyAccountState createState() => _MyAccountState();
}

class _MyAccountState extends State<MyAccount> {
  Map<String, double> dataMap = {
    "Correct Answer": 6,
    "Wrong Answer": 4,
    "Passed Answer": 0,
    "Total Question": 10,
  };
  List<Color> colorList = [
    Colors.red,
    Colors.green,
    Colors.blue,
    Colors.yellow,
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          CustomScrollView(
            physics: BouncingScrollPhysics(),
            slivers: <Widget>[
              SliverAppBar(
                backgroundColor: Colors.blue[700],
                expandedHeight: MediaQuery.of(context).size.height * 0.25,
                pinned: false,
                bottom: PreferredSize(
                  child: Container(),
                  preferredSize: Size(0, 20),
                ),
                flexibleSpace: Stack(
                  overflow: Overflow.visible,
                  children: [
                    Positioned(
                      child: Center(
                        child: Container(
                          child: Text(
                            "Account",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 30,
                            ),
                          ),
                        ),
                      ),
                      top: -90,
                      left: 0,
                      right: 0,
                      bottom: 0,
                    ),
                    Positioned(
                        child: Center(
                          child: Container(
                            padding: EdgeInsets.all(20),
                            height: 120,
                            child: Row(
                              //mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Icon(
                                  Icons.person,
                                  size: 50,
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Column(
                                  children: [
                                    Text(
                                      "JOHN DOE",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    SizedBox(height: 5),
                                    Container(
                                      height: 40,
                                      padding: EdgeInsets.all(10),
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(10)),
                                      ),
                                      child: Text("25 points"),
                                    )
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                        top: 100,
                        left: 0,
                        right: 0,
                        bottom: 0),
                    Positioned(
                      child: Container(
                        height: 50,
                        decoration: BoxDecoration(
                          color: Colors.blue[700],
                          borderRadius: BorderRadius.vertical(
                            bottom: Radius.circular(50),
                          ),
                        ),
                      ),
                      bottom: -50,
                      left: 0,
                      right: 0,
                    ),
                  ],
                ),
              ),
              SliverList(
                  delegate: SliverChildListDelegate([
                Container(
                  child: Column(
                    children: <Widget>[
                      Container(
                        height: 80,
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10.0),
                  child: Container(
                    child: Text(
                      'STATISTICS',
                      style: TextStyle(
                        fontFamily: 'PlayFairDisplay',
                        fontSize: 30,
                        color: Colors.blue[500],
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: PieChart(
                    dataMap: dataMap,
                    animationDuration: Duration(milliseconds: 800),
                    chartLegendSpacing: 32,
                    chartRadius: MediaQuery.of(context).size.width / 2,
                    colorList: colorList,
                    initialAngleInDegree: 0,
                    chartType: ChartType.disc,
                    ringStrokeWidth: 32,
                    legendOptions: LegendOptions(
                      showLegendsInRow: true,
                      legendPosition: LegendPosition.bottom,
                      showLegends: true,
                      legendShape: BoxShape.circle,
                      legendTextStyle: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    chartValuesOptions: ChartValuesOptions(
                      showChartValueBackground: true,
                      showChartValues: true,
                      showChartValuesInPercentage: false,
                      showChartValuesOutside: false,
                    ),
                  ),
                ),
                SizedBox(height: 70),
              ]))
            ],
          ),
        ],
      ),
    );
  }
}
