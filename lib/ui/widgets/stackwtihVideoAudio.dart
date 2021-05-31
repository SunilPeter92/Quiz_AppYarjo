
import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:flutter/material.dart';

import 'package:quizapp/models/category.dart';
import 'package:quizapp/models/question.dart';
import 'package:quizapp/ui/constant/constcolor.dart';
import 'package:quizapp/ui/widgets/countdowntimerWidget.dart';
import 'package:quizapp/ui/widgets/questionwithaudio.dart';
import 'package:quizapp/ui/widgets/questionwithpicture.dart';
import 'package:quizapp/ui/widgets/questionwithvideo.dart';

class StackQuestionWithVideoandImage extends StatefulWidget {
  final List<Question> questions;
  final int currentIndex;

  final int controller;
  StackQuestionWithVideoandImage({Key key, this.questions, this.currentIndex, this.controller , }) : super(key: key);

  @override
  _StackQuestionWithVideoandImageState createState() => _StackQuestionWithVideoandImageState();
}

class _StackQuestionWithVideoandImageState extends State<StackQuestionWithVideoandImage> {
  CountDownController _controller = CountDownController();

  @override
  void initState() {
    // TODO: implement initState
   // _controller.start();
    super.initState();
  }

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
         // InkWell(
         //   onTap: (){
         //     _controller.getTime();
         //     print(_controller.getTime(),);
         //   },
         //   child: Container(
         //    child: Text('hello' ),
         //   ),
         // ),
        // Positioned(
        //     top: -60,
        //     left: 200,
        //     right: 0,
        //     bottom: 220,
        //   child: Center(
        //     child: Container(
        //       height: 100,
        //       width: 100,
        //       decoration: BoxDecoration(
        //         color: Colors.white,
        //         borderRadius: BorderRadius.circular(50)
        //       ),
        //         child: Center(
        //             child: CircularCountDownTimer(duration : widget.controller , initialDuration: 0, controller: _controller,width: 80, height: 80,isReverse: true,
        //               isReverseAnimation: true, fillColor: tintorange, ringColor: Colors.blueAccent,   )
        //         )
        //     //CountdownTimer(controller: widget.controller),
        //
        // ),
        //   ),
        // ),
      ],
    );
  }
}
