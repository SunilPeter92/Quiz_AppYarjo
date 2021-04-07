import 'package:auto_size_text/auto_size_text.dart';
import 'package:better_player/better_player.dart';
import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:flutter/material.dart';
import 'package:quizapp/ui/constant/constcolor.dart';
import 'package:quizapp/ui/pages/questionSubmitpage.dart';
import 'package:quizapp/ui/widgets/countdowntimerWidget.dart';
import 'package:video_player/video_player.dart';

class DummyQuizPage extends StatefulWidget {
  static const routeName = 'dummy-quiz-page';
  DummyQuizPage({Key key}) : super(key: key);

  @override
  _DummyQuizPageState createState() => _DummyQuizPageState();
}

class _DummyQuizPageState extends State<DummyQuizPage> {
  CountDownController timercontroller = CountDownController();
  VideoPlayerController _controller;
  BetterPlayerController _betterPlayerController;
  final TextStyle _questionStyle = TextStyle(
    fontSize: 12.0,
    fontWeight: FontWeight.w500,
    color: Colors.black,
  );

  @override
  void initState() {
    super.initState();
    BetterPlayerDataSource betterPlayerDataSource = BetterPlayerDataSource(
        BetterPlayerDataSourceType.network,
        "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4");
    _betterPlayerController = BetterPlayerController(
      BetterPlayerConfiguration(
        autoPlay: true,
        looping: true,
      ),
      betterPlayerDataSource: betterPlayerDataSource,
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: tintorange,
        title: Text('General Knowledge'),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Container(

          child: Stack(
            overflow: Overflow.visible,
            children: [
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

              Padding(
                padding: const EdgeInsets.only(top: 85,bottom: 16, left: 16, right: 16),
                child: Card(
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
                            "Question 1 / 10 ",
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
                                  "What is this video",
                                  softWrap: true,
                                  style: MediaQuery.of(context).size.width > 800
                                      ? _questionStyle.copyWith(
                                          fontSize: 20.0,
                                        )
                                      : _questionStyle,
                                  maxLines: 2,
                                ),
                                // Expanded(
                                //   child: Container(
                                //     child: Image.network(
                                //         'https://www.seekpng.com/png/detail/203-2031371_video-player-vector-logo-de-reproductor-de-video.png'),
                                //   ),
                                // )
                                // Container(
                                //   padding: const EdgeInsets.all(20),
                                //   child: AspectRatio(
                                //     aspectRatio: _controller.value.aspectRatio * 1.3,
                                //     child: Stack(
                                //       alignment: Alignment.bottomCenter,
                                //       children: <Widget>[
                                //         VideoPlayer(_controller),
                                //         //   ClosedCaption(text: _controller.value.caption.text),
                                //         ControlsOverlay(controller: _controller),
                                //         VideoProgressIndicator(_controller,
                                //             allowScrubbing: true),
                                //       ],
                                //     ),
                                //   ),
                                // ),
                                Container(
                                  padding: const EdgeInsets.all(5),
                                  child: AspectRatio(
                                    aspectRatio: 2.0,
                                    child: BetterPlayer(
                                      controller: _betterPlayerController,
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
                ),
              ),

              Positioned(
                child: CountdownTimer(controller: timercontroller),
                top: 0,
                left: 0,
                right: 0,
                bottom: 730,
              ),

              Padding(
                padding: const EdgeInsets.only(
                    top: 350, bottom: 16, left: 16, right: 16),
                child: SizedBox(
                  height: 400,
                  child: ListView(children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(
                        top: 30,
                        left: 10,
                        right: 10,
                      ),
                      child: SizedBox(
                        //height: 30,
                        child: ExpansionTile(
                          title: Text(
                            'Select Answer',
                            style: TextStyle(fontSize: 17),
                          ),
                          children: [
                            Card(
                              child: RadioListTile(
                                title: SizedBox(
                                  width: 250,
                                  child: Text(
                                    "Option 1",
                                    style: MediaQuery.of(context).size.width > 800
                                        ? TextStyle(fontSize: 30.0)
                                        : null,
                                  ),
                                ),
                                //  groupValue: _answers[currentIndex],
                                //  value: option,
                                onChanged: (_) {},
                              ),
                            ),
                            Card(
                              child: RadioListTile(
                                title: SizedBox(
                                  width: 250,
                                  child: Text(
                                    "Option 2",
                                    style: MediaQuery.of(context).size.width > 800
                                        ? TextStyle(fontSize: 30.0)
                                        : null,
                                  ),
                                ),
                                //  groupValue: _answers[currentIndex],
                                //  value: option,
                                onChanged: (_) {},
                              ),
                            ),
                            Card(
                              child: RadioListTile(
                                title: SizedBox(
                                  width: 250,
                                  child: Text(
                                    "Option 3",
                                    style: MediaQuery.of(context).size.width > 800
                                        ? TextStyle(fontSize: 30.0)
                                        : null,
                                  ),
                                ),
                                //  groupValue: _answers[currentIndex],
                                //  value: option,
                                onChanged: (_) {},
                              ),
                            ),
                            Card(
                              child: RadioListTile(
                                title: SizedBox(
                                  width: 250,
                                  child: Text(
                                    "Option 4",
                                    style: MediaQuery.of(context).size.width > 800
                                        ? TextStyle(fontSize: 30.0)
                                        : null,
                                  ),
                                ),
                                //  groupValue: _answers[currentIndex],
                                //  value: option,
                                onChanged: (_) {},
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      alignment: Alignment.bottomCenter,
                      height: 100,
                      child: RaisedButton(
                        padding: const EdgeInsets.symmetric(
                            vertical: 20.0, horizontal: 64.0),
                        child: Text("Next", style: TextStyle(fontSize: 20.0)),
                        onPressed: () {
                          Navigator.of(context)
                              .pushNamed(QuizSubmitPage.routeName);
                        },
                      ),
                    ),
                  ]),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
