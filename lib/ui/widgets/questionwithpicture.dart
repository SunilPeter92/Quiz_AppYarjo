import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:html_unescape/html_unescape.dart';
import 'package:quizapp/ui/widgets/controlsOverlay.dart';
import 'package:quizapp/models/category.dart';
import 'package:quizapp/models/question.dart';
import 'package:video_player/video_player.dart';
import 'package:better_player/better_player.dart';

class QuestionWithPicture extends StatefulWidget {
  final List<Question> questions;
 
  final int currentIndex;
  const QuestionWithPicture(
      {Key key, this.questions,  this.currentIndex})
      : super(key: key);

  @override
  _QuestionWithPictureState createState() => _QuestionWithPictureState();
}

class _QuestionWithPictureState extends State<QuestionWithPicture> {
  final TextStyle _questionStyle = TextStyle(
    fontSize: 12.0,
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
        height: MediaQuery.of(context).size.height * .35,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            SizedBox(
              height: 30,
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
                      HtmlUnescape().convert(
                          widget.questions[widget.currentIndex].question),
                      softWrap: true,
                      style: MediaQuery.of(context).size.width > 800
                          ? _questionStyle.copyWith(
                              fontSize: 20.0,
                            )
                          : _questionStyle,
                      maxLines: 2,
                    ),
                    AspectRatio(
                      aspectRatio: 2.0,
                      child: CachedNetworkImage(
                        imageUrl:
                            "${widget.questions[widget.currentIndex].image}",
                        imageBuilder: (context, imageProvider) => Container(
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: imageProvider,
                              fit: BoxFit.fill,
                              // colorFilter: ColorFilter.mode(
                              //     Colors.red, BlendMode.colorBurn),
                            ),
                          ),
                        ),
                        placeholder: (context, url) =>
                            Center(child: CircularProgressIndicator()),
                        errorWidget: (context, url, error) => Icon(Icons.error),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
