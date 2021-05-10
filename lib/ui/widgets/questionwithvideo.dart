import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:html_unescape/html_unescape.dart';
import 'package:quizapp/ui/widgets/controlsOverlay.dart';
import 'package:quizapp/models/category.dart';
import 'package:quizapp/models/question.dart';
import 'package:video_player/video_player.dart';
import 'package:better_player/better_player.dart';

class QuestionWithVideo extends StatefulWidget {
  final List<Question> questions;
 
  final int currentIndex;
  const QuestionWithVideo(
      {Key key, this.questions,  this.currentIndex})
      : super(key: key);

  @override
  _QuestionWithVideoState createState() => _QuestionWithVideoState();
}

class _QuestionWithVideoState extends State<QuestionWithVideo> {
  VideoPlayerController _controller;
  BetterPlayerController _betterPlayerController;
  final TextStyle _questionStyle = TextStyle(
    fontSize: 12.0,
    fontWeight: FontWeight.w500,
    color: Colors.black,
  );

  // @override
  // void initState() {
  //   // TODO: implement initState
  //   super.initState();
  //   _controller = VideoPlayerController.network(
  //     'https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4',
  //     videoPlayerOptions: VideoPlayerOptions(mixWithOthers: true),
  //   );

  //   _controller.addListener(() {
  //     setState(() {});
  //   });
  //   _controller.setLooping(true);
  //   _controller.initialize();
  // }

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
              height: 40,
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
    );
  }
}
