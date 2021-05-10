import 'dart:io';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:quizapp/ApiClass/API.dart';
import 'package:quizapp/models/category.dart';
import 'package:quizapp/models/question.dart';
import 'package:quizapp/repository/categoryrepository.dart';
import 'package:quizapp/resources/api_provider.dart';
import 'package:quizapp/ui/Model/GetQuizbyID.dart';
import 'package:quizapp/ui/constant/constcolor.dart';
import 'package:quizapp/ui/pages/error.dart';
import 'package:quizapp/ui/pages/quiz_page.dart';
import 'package:shimmer/shimmer.dart';

class QuizDetailPage extends StatefulWidget {
  static const routeName = 'quiz-detail-page';
  var userid;

  QuizDetailPage({Key key, this.userid}) : super(key: key);

  @override
  _QuizDetailPageState createState() => _QuizDetailPageState();
}

class _QuizDetailPageState extends State<QuizDetailPage> {
  final GlobalKey<ScaffoldState> scaffoldKey = new GlobalKey<ScaffoldState>();
  List<Category> newCategory = <Category>[];
  bool processing;

  @override
  void initState() {
    fetchMainCategories();
    processing = false;
    super.initState();
  }

  void fetchMainCategories() async {
    final _category = await getCategories();
    if (categories.length <= 0) {
      // categories.add(Category(mainCategory: _categories));
      for (int i = 0; i < _category.length; i++) {
        newCategory = _category;
      }

      setState(() {});
    } else {
      // TODO: handle else //
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      key: scaffoldKey,
      appBar: AppBar(
        backgroundColor: tintorange,
        elevation: 0,
        centerTitle: true,
        title: Text(
          "Logo Here",
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
                      FutureBuilder<GetQuizByID>(
                        future: API.getQuizDetail(widget.userid),
                        builder: (context, snapshot) {
                          GetQuizByID getQuiz = snapshot.data;

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
                                      QuizInfoBox(
                                          val: 'Name',
                                          data: getQuiz.dataByID[0].name),
                                      QuizInfoBox(
                                          val: 'Prize',
                                          data: getQuiz.dataByID[0].prize),
                                      QuizInfoBox(
                                          val: 'Price',
                                          data: getQuiz.dataByID[0].price),
                                      QuizInfoBox(
                                          val: 'Category',
                                          data: getQuiz.dataByID[0].catName),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(20),
                                  child: Container(
                                    height: 200,
                                    padding: EdgeInsets.all(20),
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(10),
                                      shape: BoxShape.rectangle,
                                      border: Border.all(
                                          color: tintorange, width: 2),
                                    ),
                                    child: Column(
                                      children: [
                                        Container(
                                          width: 300,
                                          child: AutoSizeText(
                                            "Most popular quiz of all time is back",
                                            style: TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold,
                                            ),
                                            maxLines: 3,
                                          ),
                                        ),
                                        SizedBox(height: 10),
                                        Container(
                                          width: 300,
                                          child: AutoSizeText(
                                            "Lorem Ipsum flana dimkana Lorem Ipsum flana dimkanaLorem Ipsum flana dimkanaLorem Ipsum flana dimkanaLorem Ipsum flana dimkana Lorem Ipsum flana dimkana Lorem Ipsum flana dimkana Lorem Ipsum flana dimkana",
                                            style: TextStyle(
                                              fontSize: 15,
                                            ),
                                            maxLines: 6,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.all(10),
                                  child: Column(
                                    children: [
                                      Text(
                                        "Number of questions: ${getQuiz.dataByID[0].noOfQues}",
                                        style: TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.w600),
                                      ),
                                      Text(
                                        "Time to answer : ${getQuiz.dataByID[0].time}",
                                        style: TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.w600),
                                      ),
                                      AutoSizeText(
                                        "The quiz will be activated on the ${getQuiz.dataByID[0].actTime}",
                                        style: TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.w600),
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
                            ),
                          );
                        },
                      ),
                      Padding(
                        padding: EdgeInsets.all(10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            RaisedButton(
                              onPressed: _startQuiz,
                              // onPressed: () {
                              //   Navigator.of(context).pushNamed(DummyQuizPage.routeName);
                              // },
                              child: Text(
                                "Pay (5\$)",
                              ),
                            ),
                            RaisedButton(
                              onPressed: () {},
                              child: Text(
                                "Home",
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _startQuiz() async {
    setState(() {
      processing = true;
    });
    try {
      List<Question> questions = await getQuestions(1, 10, 'easy');
      // await getQuestions(widget.category, _noOfQuestions, _difficulty);
      Navigator.pop(context);
      if (questions.length < 1) {
        Navigator.of(context).push(MaterialPageRoute(
            builder: (_) => ErrorPage(
                  message:
                      "There are not enough questions in the category, with the options you selected.",
                )));
        return;
      }
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (_) => QuizPage(
                    questions: questions,
                  )));
    } on SocketException catch (_) {
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
              builder: (_) => ErrorPage(
                    message:
                        "Can't reach the servers, \n Please check your internet connection.",
                  )));
    } catch (e) {
      print(e.message);
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
              builder: (_) => ErrorPage(
                    message: "Unexpected error trying to connect to the API",
                  )));
    }
    setState(() {
      processing = false;
    });
  }
}

class QuizInfoBox extends StatelessWidget {
  final String val, data;

  QuizInfoBox({@required this.val, this.data});

  @override
  Widget build(BuildContext context) {
    var style = TextStyle(fontSize: 15, fontWeight: FontWeight.w600);

    return ListTile(
      dense: true,
      leading: Text(
        val,
        style: style,
      ),
      trailing: Text(
        data,
        style: style,
      ),
      contentPadding: EdgeInsets.symmetric(horizontal: 60),
    );
  }
}
