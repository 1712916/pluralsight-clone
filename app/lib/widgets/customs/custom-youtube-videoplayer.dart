import 'package:app/provider/video-provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class CustomYoutubeVideoPlayer extends StatefulWidget {
  String youtube_url;
  CustomYoutubeVideoPlayer({this.youtube_url});
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
    super.deactivate();
  }

  @override
  Widget build(BuildContext context) {
    _controller.load(YoutubePlayer.convertUrlToId(
        Provider.of<VideoProvider>(context).videoUrl));
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
