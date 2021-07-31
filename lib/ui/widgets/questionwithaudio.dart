import 'package:audioplayers/audio_cache.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:html_unescape/html_unescape.dart';
import 'package:quizapp/models/category.dart';
import 'package:quizapp/models/question.dart';

class QuestionWithAudio extends StatefulWidget {
  final List<Question> questions;
  final Category category;
  final int currentIndex;
  const QuestionWithAudio(
      {Key key, this.questions, this.category, this.currentIndex})
      : super(key: key);

  @override
  _QuestionWithAudioState createState() => _QuestionWithAudioState();
}

class _QuestionWithAudioState extends State<QuestionWithAudio>
    with TickerProviderStateMixin {
  AnimationController _animationIconController1;
  AudioCache audioCache;
  AudioPlayer audioPlayer;
  Duration _duration = new Duration();
  Duration _position = new Duration();
  Duration _slider = new Duration(seconds: 0);
  double durationvalue;
  bool issongplaying = false;
  final TextStyle _questionStyle = TextStyle(
    fontSize: 16.0,
    fontWeight: FontWeight.w500,
    color: Colors.black,
  );

  @override
  void initState() {
    super.initState();
    _position = _slider;
    _animationIconController1 = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 750),
      reverseDuration: Duration(milliseconds: 750),
    );
    audioPlayer = new AudioPlayer();
    audioCache = new AudioCache(fixedPlayer: audioPlayer);
    // audioPlayer.durationHandler = (d) => setState(() {
    //       _duration = d;
    //     });
    //
    // audioPlayer.positionHandler = (p) => setState(() {
    //       _position = p;
    //     });
  }

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
                      HtmlUnescape().convert(
                          widget.questions[widget.currentIndex].question),
                      softWrap: true,
                      style: MediaQuery.of(context).size.width > 800
                          ? _questionStyle.copyWith(
                              fontSize: 30.0,
                            )
                          : _questionStyle,
                      maxLines: 3,
                    ),
                    // Expanded(
                    //   child: Container(
                    //     child: Image.network(
                    //         'https://www.optimizex.com/wp-content/uploads/2016/07/audio-1293262_960_720.png'),
                    //   ),
                    // )
                    Expanded(
                      child: Container(
                        child: Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Slider(
                                activeColor: Colors.white,
                                inactiveColor: Colors.grey,
                                value: _position.inSeconds.toDouble(),
                                max: _duration.inSeconds.toDouble(),
                                onChanged: (double value) {
                                  // Add code to track the music duration.
                                },
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      if (issongplaying == true) {
                                        audioPlayer.pause();
                                        setState(() {
                                          issongplaying = false;
                                        });
                                      } else {
                                        audioCache.play("sounds/alert.mp3");
                                        setState(() {
                                          issongplaying = true;
                                        });
                                      }
                                    },
                                    child: ClipOval(
                                      child: Container(
                                        color: Colors.blueAccent[400],
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: AnimatedIcon(
                                            icon: issongplaying ? AnimatedIcons.pause_play : AnimatedIcons.play_pause,
                                            size: 20,
                                            progress: _animationIconController1,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
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
