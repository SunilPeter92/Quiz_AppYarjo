import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:flutter/material.dart';

import 'package:quizapp/models/category.dart';
import 'package:quizapp/models/question.dart';
import 'package:quizapp/ui/widgets/countdowntimerWidget.dart';
import 'package:quizapp/ui/widgets/onlyquestioncard.dart';

class StackOnlyQuestion extends StatefulWidget {
  final List<Question> questions;
  final Category category;
  final int currentIndex;
  final CountDownController controller;
  StackOnlyQuestion({Key key, this.questions, this.category, this.currentIndex, this.controller}) : super(key: key);

  @override
  _StackOnlyQuestionState createState() => _StackOnlyQuestionState();
}

class _StackOnlyQuestionState extends State<StackOnlyQuestion> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      overflow: Overflow.visible,
      children: [
        Positioned(
          child: OnlyQuestion(
            questions: widget.questions,
            category: widget.category,
            currentIndex: widget.currentIndex,
          ),
        ),
        Positioned(
          child: CountdownTimer(controller: widget.controller),
          top: -80,
          left: 0,
          right: 0,
          bottom: 160,
        ),
      ],
    );
  }
}
