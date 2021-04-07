import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:flutter/material.dart';

import 'package:quizapp/models/category.dart';
import 'package:quizapp/models/question.dart';
import 'package:quizapp/ui/widgets/countdowntimerWidget.dart';
import 'package:quizapp/ui/widgets/questionwithaudio.dart';
import 'package:quizapp/ui/widgets/questionwithpicture.dart';
import 'package:quizapp/ui/widgets/questionwithvideo.dart';

class StackQuestionWithVideoandImage extends StatefulWidget {
  final List<Question> questions;
  
  final int currentIndex;
  final CountDownController controller;
  StackQuestionWithVideoandImage({Key key, this.questions, this.currentIndex, this.controller}) : super(key: key);

  @override
  _StackQuestionWithVideoandImageState createState() => _StackQuestionWithVideoandImageState();
}

class _StackQuestionWithVideoandImageState extends State<StackQuestionWithVideoandImage> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      overflow: Overflow.visible,
      children: [
        Positioned(
          child: QuestionWithPicture(
            questions: widget.questions,
           
            currentIndex: widget.currentIndex,
          ),
        ),
        Positioned(
          child: CountdownTimer(controller: widget.controller),
          top: -80,
          left: 0,
          right: 0,
          bottom: 220,
        ),
      ],
    );
  }
}
