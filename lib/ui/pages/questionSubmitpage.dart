import 'package:flutter/material.dart';
import 'package:quizapp/ui/constant/constcolor.dart';
import 'package:quizapp/ui/pages/dummyquizPage/quizpagee.dart';
import 'package:quizapp/ui/pages/leaderboard.dart';

class QuizSubmitPage extends StatefulWidget {
  static const routeName = 'quiz-submit';
  QuizSubmitPage({Key key}) : super(key: key);

  @override
  _QuizSubmitPageState createState() => _QuizSubmitPageState();
}

class _QuizSubmitPageState extends State<QuizSubmitPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: tintorange,
        elevation: 0,
        title: Text(
          "Genereal Knowledge",
          style: TextStyle(
            color: Colors.white,
            //fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
        centerTitle: true,
      ),
      body: Container(
        child: Stack(
          children: [
            Container(
              color: tintorange,
              height: 50,
            ),
            Container(
              child: Column(
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
                    color: Colors.white,
                    child: Center(
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(
                              top: 80,
                              left: 20,
                              right: 20,
                              bottom: 10,
                            ),
                            child: Text(
                              "All Questions answered, would you like to submit your answers or go back and check some of them?",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                              ),
                            ),
                          ),
                          Text(
                            "You Have 10 minutes left",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Spacer(),
                  Container(
                      child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      RaisedButton(
                          onPressed: () {
                            Navigator.pop(context);
                            Navigator.of(context)
                                .pushNamed(DummyQuizPage.routeName);
                          },
                          child: Text("Previous")),
                      RaisedButton(
                          onPressed: () {
                            Navigator.of(context)
                                .pushNamed(Leaderboard.routeName);
                          },
                          child: Text("Submit")),
                    ],
                  ))
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
