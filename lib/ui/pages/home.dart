import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:quizapp/ApiClass/API.dart';
import 'package:quizapp/models/category.dart';
import 'package:quizapp/repository/categoryrepository.dart';
import 'package:quizapp/ui/Model/GetQuizModel.dart';
import 'package:quizapp/ui/constant/constcolor.dart';
import 'package:quizapp/ui/pages/authenticationScreen.dart';
import 'package:quizapp/ui/pages/quizDetailPage.dart';
import 'package:quizapp/ui/pages/settings.dart';
import 'package:quizapp/ui/widgets/quiz_options.dart';
import 'package:shimmer/shimmer.dart';

class HomePage extends StatefulWidget {
  static const routeName = "/home-page";
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final GlobalKey<ScaffoldState> scaffoldKey = new GlobalKey<ScaffoldState>();
  List<Category> newcategories = <Category>[];
  @override
  void initState() {
    super.initState();
  }

  void fetchMainCategories() async {
    final _category = await getCategories();
    if (categories != null) {
      // categories.add(Category(mainCategory: _categories));
      for (int i = 0; i < _category.length; i++) {
        newcategories = _category;
      }
      setState(() {});
    } else {
      // TODO: handle else //
    }
  }

  // void listenForCategories() async {
  //   final Category stream = await getCategories();
  //  setState(() {
  //    newcategories.add()
  //  });
  // }

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
          title: Text(
            "Balance: \$10 Credits",
            style: TextStyle(
              color: Colors.white,
              //fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
          actions: <Widget>[
            Padding(
              padding:
                  const EdgeInsets.only(top: 2, left: 8, right: 20, bottom: 0),
              child: IconButton(
                icon: Icon(Icons.settings),
                tooltip: 'Setting',
                onPressed: () {
                  Navigator.of(context).pushNamed(Settings.routeName);
                },
              ),
            ),
          ],
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
                          height: MediaQuery.of(context).size.height / 2,
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
                                                MaterialPageRoute(builder: (context) => QuizDetailPage(userid:quizid)),
                                              );

                                            },
                                            child: Container(
                                              decoration: BoxDecoration(
                                                  borderRadius: BorderRadius.circular(10),
                                                  border: Border.all(color: tintorange)),
                                              height: 100,
                                              child: Row(
                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                children: [
                                                  ClipRRect(
                                                    borderRadius: BorderRadius.circular(8.0),
                                                    child: CachedNetworkImage(
                                                      height: 150.0,
                                                      width: 120.0,
                                                      imageUrl: "https://bsmedia.business-standard.com/media-handler.php?mediaPath=https://bsmedia.business-standard.com/_media/bs/img/article/2019-11/03/full/1572796865-0693.jpg&width=1200",
                                                      fit: BoxFit.fitHeight,
                                                      placeholder: (context, url) => Center(child: new CircularProgressIndicator()),
                                                      errorWidget: (context, url, error) => new Icon(Icons.error),
                                                    ),
                                                  ),
                                                  Container(
                                                    width: MediaQuery.of(context).size.width * 0.2,
                                                    child: Text(snapshot.data.data[index].name,
                                                      style: TextStyle(fontSize: 11),
                                                      maxLines: 2,
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding: const EdgeInsets.only(right: 10),
                                                    child: Column(
                                                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                      children: [
                                                        Container(
                                                          width: MediaQuery.of(context).size.width * 0.2,
                                                          child: Text("Time is:  ${snapshot.data.data[index].time}"),
                                                        ),
                                                        Container(child: Text("Prize:  ${snapshot.data.data[index].prize}\$")),
                                                      ],
                                                    ),
                                                  ),
                                                ],
                                              ),
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
                        Container(
                          color: Colors.white,
                          padding: EdgeInsets.only(bottom: 0, left: 20, right: 20),
                          width: MediaQuery.of(context).size.width,
                          child: RaisedButton(
                            color: Colors.white,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8.0),
                                side: BorderSide(color: tintorange)),
                            onPressed: () {},
                            child: Text(
                              "List All",
                              style: TextStyle(color: Colors.blueAccent[300]),
                            ),
                          ),
                        ),
                        Container(
                          color: Colors.white,
                          width: MediaQuery.of(context).size.width,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              "My Quiz",
                              style: TextStyle(
                                color: titleColor,
                                fontSize: 20,
                              ),
                              textAlign: TextAlign.left,
                            ),
                          ),
                        ),
                        Container(
                          color: Colors.white,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Container(
                                width: MediaQuery.of(context).size.width * 0.38,
                                height: 100,
                                child: CachedNetworkImage(
                                  imageUrl: "https://bsmedia.business-standard.com/media-handler.php?mediaPath=https://bsmedia.business-standard.com/_media/bs/img/article/2019-11/03/full/1572796865-0693.jpg&width=1200",
                                  fit: BoxFit.fitHeight,
                                  placeholder: (context, url) =>
                                  Center(child: new CircularProgressIndicator()),
                                  errorWidget: (context, url, error) =>
                                  new Icon(Icons.error),
                                ),
                              ),
                              Container(
                                width: MediaQuery.of(context).size.width * 0.38,
                                height: 100,
                                child: CachedNetworkImage(
                                  imageUrl: "https://bsmedia.business-standard.com/media-handler.php?mediaPath=https://bsmedia.business-standard.com/_media/bs/img/article/2019-11/03/full/1572796865-0693.jpg&width=1200",
                                  fit: BoxFit.fitHeight,
                                  placeholder: (context, url) =>
                                  Center(child: new CircularProgressIndicator()),
                                  errorWidget: (context, url, error) =>
                                  new Icon(Icons.error),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          color: Colors.white,
                          child: Padding(
                            padding: const EdgeInsets.all(10),
                            child: Container(
                              height: 100,
                              padding: EdgeInsets.all(20),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10),
                                shape: BoxShape.rectangle,
                                border: Border.all(
                                    color: tintorange, width: 2),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  Image.asset(
                                    'assets/icons/announcement.png',
                                    height: 60,
                                    width: 70,
                                  ),
                                  Container(
                                    padding: EdgeInsets.only(top: 10),
                                    height: 100,
                                    width: 200,
                                    child: AutoSizeText(
                                      "Lorem Ipsum flana dimkana Lorem Ipsum flana dimkana Lorem Ipsum flana dimkana Lorem Ipsum flana dimkana",
                                      style: TextStyle(
                                        fontSize: 15,
                                      ),
                                      maxLines: 3,
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
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

  Widget _buildCategoryItem(BuildContext context, int index) {
    Category category = newcategories[index];
    //   return MaterialButton(
    //     elevation: 1.0,
    //     highlightElevation: 1.0,
    //     onPressed: () => _categoryPressed(context, category),
    //     shape: RoundedRectangleBorder(
    //       borderRadius: BorderRadius.circular(10.0),
    //     ),
    //     color: Colors.grey.shade800,
    //     textColor: Colors.white70,
    //     child: Column(
    //       mainAxisAlignment: MainAxisAlignment.center,
    //       children: <Widget>[
    //         if (category.icon != null) Icon(category.icon),
    //         if (category.icon != null) SizedBox(height: 5.0),
    //         AutoSizeText(
    //           category.name,
    //           minFontSize: 10.0,
    //           textAlign: TextAlign.center,
    //           maxLines: 3,
    //           wrapWords: false,
    //         ),
    //       ],
    //     ),
    //   );
    //
    return GestureDetector(
      onTap: () => _categoryPressed(context, category),
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              HexColor(category.color),
              Colors.black38,
            ],
            stops: [
              0.0,
              1,
            ],
            // startAngle: 0,
            // endAngle: 0
          ),
          borderRadius: BorderRadius.all(Radius.circular(20)),
        ),
        child: Container(
          padding: EdgeInsets.all(20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                width: 150,
                child: Text(
                  category.name,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                  maxLines: 2,
                  textAlign: TextAlign.center,
                ),
              ),
              if (category.image != null)
                CachedNetworkImage(
                    imageUrl: category.image, height: 100, width: 120),
              if (category.image != null) SizedBox(height: 5.0),
            ],
          ),
        ),
      ),
    );
  }

  _categoryPressed(BuildContext context, Category category) {
    showModalBottomSheet(
      context: context,
      builder: (sheetContext) => BottomSheet(
        builder: (_) => QuizOptionsDialog(
          category: category,
        ),
        onClosing: () {},
      ),
    );
  }


}

class QuizWidget extends StatelessWidget {
  const QuizWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(3.0),
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: tintorange)),
        height: 100,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8.0),
              child: CachedNetworkImage(
                height: 150.0,
                width: 120.0,
                imageUrl: "https://bsmedia.business-standard.com/media-handler.php?mediaPath=https://bsmedia.business-standard.com/_media/bs/img/article/2019-11/03/full/1572796865-0693.jpg&width=1200",
                fit: BoxFit.fitHeight,
                placeholder: (context, url) => Center(child: new CircularProgressIndicator()),
                errorWidget: (context, url, error) => new Icon(Icons.error),
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width * 0.2,
              child: Text(
                "Dummy quiz name",
                style: TextStyle(fontSize: 11),
                maxLines: 2,
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width * 0.2,
                  child: Text("Time is:  50 mins"),
                ),
                Container(child: Text("Prize:  1000\$")),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
