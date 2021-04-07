import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:html_unescape/html_unescape.dart';
import 'package:quizapp/models/category.dart';
import 'package:quizapp/models/question.dart';

class OnlyQuestion extends StatefulWidget {
  final List<Question> questions;
  final Category category;
  final int currentIndex;
  const OnlyQuestion({Key key, this.questions, this.category, this.currentIndex}) : super(key: key);

  @override
  _OnlyQuestionState createState() => _OnlyQuestionState();
}

class _OnlyQuestionState extends State<OnlyQuestion> {
   final TextStyle _questionStyle = TextStyle(
    fontSize: 16.0,
    fontWeight: FontWeight.w500,
    color: Colors.black,
  );
  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(20),
        ),
      ),
      elevation: 10,
      child: SizedBox(
        height: MediaQuery.of(context).size.height * .26,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            SizedBox(
              height: 60,
            ),
            Center(
              child: Text(
                "Question ${widget.currentIndex + 1} / ${widget.questions.length} ",
                style: TextStyle(
                  color: Colors.blue[400],
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.all(20),
                child: Column(
                  children: [
                    AutoSizeText(
                      HtmlUnescape()
                          .convert(widget.questions[widget.currentIndex].question),
                      softWrap: true,
                      style: MediaQuery.of(context).size.width > 800
                          ? _questionStyle.copyWith(
                              fontSize: 30.0,
                            )
                          : _questionStyle,
                    ),
                    
                  ],
                ),
              ),
            ),
            // ...options.map(
            //   (option) => RadioListTile(
            //     title: Text(
            //       HtmlUnescape().convert("$option"),
            //       style: MediaQuery.of(context).size.width > 800
            //           ? TextStyle(fontSize: 30.0)
            //           : null,
            //     ),
            //     groupValue: _answers[_currentIndex],
            //     value: option,
            //     onChanged: (value) {
            //       setState(
            //         () {
            //           _answers[_currentIndex] = option;
            //         },
            //       );
            //     },
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
