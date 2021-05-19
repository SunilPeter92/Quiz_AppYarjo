import 'dart:async';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';

import 'package:html_unescape/html_unescape.dart';
import 'package:quizapp/models/category.dart';
import 'package:quizapp/models/question.dart';
import 'package:quizapp/ui/constant/constcolor.dart';
import 'package:quizapp/ui/pages/questionSubmitpage.dart';
import 'package:quizapp/ui/pages/quiz_finished.dart';
import 'package:quizapp/ui/widgets/stackwtihVideoAudio.dart';
import 'package:circular_countdown_timer/circular_countdown_timer.dart';

class QuizPage extends StatefulWidget {
  final List<Question> questions;
  int timer;
   QuizPage({
    Key key,
    @required  this.questions , this.timer,
  }) : super(key: key);

  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  final TextStyle _questionStyle = TextStyle(
    fontSize: 16.0,
    fontWeight: FontWeight.w500,
    color: Colors.black,
  );
  CountDownController _controller = CountDownController();
  int currentIndex = 0;
  final Map<int, dynamic> _answers = {};
  final GlobalKey<ScaffoldState> _key = GlobalKey<ScaffoldState>();
  CountDownController controller = CountDownController();
  bool onlyquestion;
  int t;

  countDown(){
    Future.doWhile(()async {
      //this changes the value by -1 every second until it reaches zero
      await Future.delayed(Duration(seconds: 1),);
      setState(() {
        //add text widget in your build method which takes t as the data
        t--;
      });
      return t!=0;
    });
  }


  @override
  void initState() {
    onlyquestion = false;
    t = widget.timer;
    countDown();
    super.initState();
  }



  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    Question question = widget.questions[currentIndex];
    //final List<dynamic> options = question.incorrectAnswers;
    final List<dynamic> options = [];
    if (!options.contains(question.correctAnswer) ||
        !options.contains(question.wrong1) ||
        !options.contains(question.wrong2) ||
        !options.contains(question.wrong3)) {
      options.add(question.correctAnswer);
      options.add(question.wrong1);
      options.add(question.wrong2);
      options.add(question.wrong3);
      options.shuffle();
    }

    return WillPopScope(
      onWillPop: _onWillPop,
      child: Scaffold(
        key: _key,
        appBar: AppBar(
          backgroundColor: tintorange,
          title: Text('Quiz Page'),
          elevation: 0,
        ),
        body: SingleChildScrollView(

          child: Container(
            height: MediaQuery.of(context).size.height,
            child: Stack(
             // overflow: Overflow.visible,
              children: <Widget>[
                Positioned(
                  top: -80,
                  left: 0,
                  right: 0,
                  bottom: 220,
                  child: Center(
                    child: Container(
                        height: 100,
                        width: 100,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(50)
                        ),
                        child: Center(
                            child: CircularCountDownTimer(duration : t , initialDuration: 0, controller: _controller,width: 80, height: 80,isReverse: false,
                              isReverseAnimation: false, fillColor: tintorange, ringColor: Colors.blueAccent,   )
                        )
                      //CountdownTimer(controller: widget.controller),

                    ),
                  ),
                ),
                ClipPath(
                  child: Container(
                    decoration: BoxDecoration(
                      color: tintorange,
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(30),
                        bottomRight: Radius.circular(30),
                      ),
                    ),
                    height: MediaQuery.of(context).size.height * 0.35,
                  ),
                ),
                Container(
                  child: Padding(
                    padding: const EdgeInsets.only(
                        top: 85.0, bottom: 16, left: 16, right: 16),
                    child: SizedBox(
                      height: 600,
                      child: Column(
                        children: <Widget>[
                          StackQuestionWithVideoandImage(
                            questions: widget.questions,
                             controller: t,
                            currentIndex: currentIndex,
                            // timer: widget.timer
                          ),
                          SizedBox(height: 10),

                          SizedBox(
                            height: 200,
                            child: ListView(children: [

                              Padding(
                                padding: const EdgeInsets.only(
                                  top: 30,
                                  left: 10,
                                  right: 10,
                                ),
                                child: ExpansionTile(
                                  title: Text(
                                    _answers[currentIndex] == null
                                        ? 'Select Answer'
                                        : '${_answers[currentIndex]}',
                                    style: TextStyle(fontSize: 17),
                                  ),
                                  children: [
                                    ...options.map(
                                      (option) => Card(
                                        child: RadioListTile(
                                          title: SizedBox(
                                            width: 250,
                                            child: Text(
                                              HtmlUnescape().convert("$option"),
                                              style: MediaQuery.of(context)
                                                          .size
                                                          .width >
                                                      800
                                                  ? TextStyle(fontSize: 30.0)
                                                  : null,
                                            ),
                                          ),
                                          groupValue: _answers[currentIndex],
                                          value: option,
                                          onChanged: (value) {
                                            setState(
                                              () {
                                                _answers[currentIndex] = option;
                                              },
                                            );
                                          },
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),

                            ]),
                          ),
                          Container(
                            alignment: Alignment.bottomCenter,
                            child: RaisedButton(
                              padding: MediaQuery.of(context).size.width > 800
                                  ? const EdgeInsets.symmetric(
                                  vertical: 20.0, horizontal: 64.0)
                                  : null,
                              child: Text(
                                currentIndex == (widget.questions.length - 1)
                                    ? "Submit"
                                    : "Next",
                                style: MediaQuery.of(context).size.width > 800
                                    ? TextStyle(fontSize: 30.0)
                                    : null,
                              ),
                              onPressed: _nextSubmit,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),

    );
  }

  void _nextSubmit() {
    if (_answers[currentIndex] == null) {
      _key.currentState.showSnackBar(SnackBar(
        content: Text("You must select an answer to continue."),
      ));
      return;
    }
    if (currentIndex < (widget.questions.length - 1)) {
      setState(() {
        currentIndex++;
      });
    } else {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (_) => QuizFinishedPage(
            getTime:  _controller.getTime(),
            questions: widget.questions,
            answers: _answers,
          ),
        ),
       );
      // Navigator.pop(context);
      // Navigator.of(context).pushNamed(QuizSubmitPage.routeName);
    }
  }

  Future<bool> _onWillPop() async {
    return showDialog<bool>(
        context: context,
        builder: (_) {
          return AlertDialog(
            content: Text(
                "Are you sure you want to quit the quiz? All your progress will be lost."),
            title: Text("Warning!"),
            actions: <Widget>[
              FlatButton(
                child: Text("Yes"),
                onPressed: () {
                  Navigator.pop(context, true);
                },
              ),
              FlatButton(
                child: Text("No"),
                onPressed: () {
                  Navigator.pop(context, false);
                },
              ),
            ],
          );
        });
  }
}
