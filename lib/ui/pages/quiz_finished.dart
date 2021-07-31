import 'package:flutter/material.dart';
import 'package:quizapp/ApiClass/API.dart';
import 'package:quizapp/models/question.dart';
import 'package:quizapp/ui/constant/constcolor.dart';
import 'package:quizapp/ui/pages/authenticationScreen.dart';
import 'package:quizapp/ui/pages/check_answers.dart';
import 'package:quizapp/ui/pages/leaderboard.dart';
import 'package:quizapp/ui/pages/questionSubmitpage.dart';


class QuizFinishedPage extends StatelessWidget {
  final List<Question> questions;
  final Map<int, dynamic> answers;
  
  int correctAnswers;
  String getTime ;
  QuizFinishedPage({Key key, @required this.questions, @required this.answers , this.getTime}): super(key: key) {
    
  }

  final quizId = AuthenticationPage.prefs.getInt('quizid');
  final  userId = AuthenticationPage.prefs.getInt('userID');

  @override
  Widget build(BuildContext context){
    int correct = 0;
    this.answers.forEach((index,value){
      if(this.questions[index].correctAnswer == value)
        correct++;
    });
   var percent =  correct/questions.length * 100 ;
    final TextStyle titleStyle = TextStyle(
      color: Colors.black87,
      fontSize: 16.0,
      fontWeight: FontWeight.w500
    );
    final TextStyle trailingStyle = TextStyle(
      color: Theme.of(context).primaryColor,
      fontSize: 20.0,
      fontWeight: FontWeight.bold
    );


    
    return Scaffold(
      backgroundColor: tintorange,
      appBar: AppBar(
        title: Text('Result'),
        backgroundColor: tintorange,
        elevation: 0,
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
        ),
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: <Widget>[
              Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0)
                ),
                child: ListTile(
                  contentPadding: const EdgeInsets.all(16.0),
                  title: Text("Total Questions", style: titleStyle),
                  trailing: Text("${questions.length}", style: trailingStyle),
                ),
              ),
              SizedBox(height: 10.0),
              Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0)
                ),
                child: ListTile(
                  contentPadding: const EdgeInsets.all(16.0),
                  title: Text("Score", style: titleStyle),
                  trailing: Text("${correct/questions.length * 100}%", style: trailingStyle),
                ),
              ),
              SizedBox(height: 10.0),
              Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0)
                ),
                child: ListTile(
                  contentPadding: const EdgeInsets.all(16.0),
                  title: Text("Correct Answers", style: titleStyle),
                  trailing: Text("$correct/${questions.length}", style: trailingStyle),
                ),
              ),
              SizedBox(height: 10.0),
              Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0)
                ),
                child: ListTile(
                  contentPadding: const EdgeInsets.all(16.0),
                  title: Text("Incorrect Answers", style: titleStyle),
                  trailing: Text("${questions.length - correct}/${questions.length}", style: trailingStyle),
                ),
              ),
              SizedBox(height: 10.0),
              Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0)
                ),
                child: ListTile(
                  contentPadding: const EdgeInsets.all(16.0),
                  title: Text("Time", style: titleStyle),
                  trailing: Text(getTime, style: trailingStyle),
                ),
              ),
              SizedBox(height: 10.0),
              InkWell(
                onTap: (){
                  API.leader(userId, quizId, percent, getTime).then((value) {

                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Leaderboard(Response:value)),
                    );
                  }
                  );
                },
                child: Container(
                  height: 55,
                  width: 150,
                  decoration: BoxDecoration(
                    color: Colors.blue[400],
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Center(child: Text('Goto LeaderBoard')),
                ),
              ),
              SizedBox(height: 10,)
            ],
          ),
        ),
      ),
    );
  }
}