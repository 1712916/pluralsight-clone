import 'package:app/provider/login-provider.dart';
import 'package:app/provider/video-provider.dart';
import 'package:app/services/lesson-services.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart';
import 'package:provider/provider.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class CustomYoutubeVideoPlayer extends StatefulWidget {
  String youtube_url;
  int currentTime;

  CustomYoutubeVideoPlayer({this.youtube_url,this.currentTime});
  @override
  _CustomYoutubeVideoPlayerState createState() =>
      _CustomYoutubeVideoPlayerState();
}

class _CustomYoutubeVideoPlayerState extends State<CustomYoutubeVideoPlayer> {
  String _videoId;
  YoutubePlayerController _controller;
  PlayerState _playerState;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    this.widget.currentTime=this.widget.currentTime??0;
    _videoId = YoutubePlayer.convertUrlToId(this.widget.youtube_url);
    _controller = YoutubePlayerController(initialVideoId: _videoId);

    // _controller.load(this.widget.youtube_url);
    // _controller = YoutubePlayerController(
    //   initialVideoId: _videoId,
    //   flags: YoutubePlayerFlags(
    //     mute: false,
    //     autoPlay: true,
    //     disableDragSeek: false,
    //     loop: false,
    //     isLive: false,
    //     forceHD: false,
    //     enableCaption: true,
    //   ),
    // )..addListener( (){});
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();

    _controller.dispose();
  }

  @override
  void deactivate() {
    // Pauses video while navigating to next page.
    _controller.pause();
    (() async{
      Response response= await LessonServices.updateCurrentTimeLearnVideo(token: Provider.of<LoginProvider>(context,listen: false).userResponseModel.token,lessonId:Provider.of<VideoProvider>(context,listen: false).lessonId ,currentTime: _controller.value.position.inSeconds.toDouble() );
     if(response.statusCode==200){
       print("NGOOOOOOOOOOOOOOOOOOOOOONNNNNNNNNNNNN");
     }else{
       print("${response.statusCode}");
     }

    })();
    super.deactivate();
  }

  @override
  Widget build(BuildContext context) {
    _controller.load(YoutubePlayer.convertUrlToId(
        Provider.of<VideoProvider>(context).videoUrl));
    _controller.seekTo(Duration(seconds: this.widget.currentTime));
    return Stack(
      children:[ Column(
        children: [
          YoutubePlayer(
            topActions: [
              IconButton(
                  icon: Icon(Icons.arrow_back_ios_outlined),
                  onPressed: () {
                    Navigator.pop(context);
                  }),
            ],
            controller: _controller,
            showVideoProgressIndicator: true,
            onReady: () {
              print("on ready");
            },
            onEnded: (a) {
              print("on end");
            },
          )
        ],
      ),
        IconButton(
            icon: Icon(Icons.arrow_back_ios_outlined),
            onPressed: () {
              Navigator.pop(context);
            }),
    ]
    );
  }
}

bool checkYoutubeUrl(String url) {
  if (url == null) {
    url = "https://www.youtube.com/embed/bum_19loj9A";
  }
  return url.contains("youtube.com");
}
