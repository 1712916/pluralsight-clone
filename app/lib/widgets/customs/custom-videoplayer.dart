import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

// ignore: must_be_immutable
class CustomVideoPlayer extends StatefulWidget {
  String url;

  CustomVideoPlayer({this.url}); // 'https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4';

  @override
  _CustomVideoPlayerState createState() => _CustomVideoPlayerState();
}

class _CustomVideoPlayerState extends State<CustomVideoPlayer> {
  bool isLoading=true;
  VideoPlayerController _controller;
  Future<void> _initializeVideoPlayerFuture;
  bool _shownControler;
  bool _isFullscreen = false;
  double _currentVideoTime = 0;



  @override
  void initState() {
    // Create and store the VideoPlayerController. The VideoPlayerController
    // offers several different constructors to play videos from assets, files,
    // or the internet.
    _controller = VideoPlayerController.network(
      this.widget.url,
    )..addListener(() {
      if(_controller.value.position.inSeconds!=null){
        setState(() {
          _currentVideoTime=_controller.value.position.inSeconds.toDouble();
        });
      }

    });

    // Initialize the controller and store the Future for later use.
    _initializeVideoPlayerFuture = _controller.initialize();

    // Use the controller to loop the video.
    _controller.setLooping(false);
    _shownControler = true;

    //listenForUpdateView();


    super.initState();
  }
  listenForUpdateView() async{
    print('Hello world');
    Future((){
      while(true){
        Future.delayed(Duration(seconds: 1));
        if(_controller.value.isPlaying){
          print('RUNNINGGGGGGGGGGGGGG');
        }else{
          print('STOPPPPPPPPPPPPPPPPPPPPPP');
        }
      }
    });

  }
  @override
  void dispose() {
    // Ensure disposing of the VideoPlayerController to free up resources.
    _controller.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        FutureBuilder(
          future: _initializeVideoPlayerFuture,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              // If the VideoPlayerController has finished initialization, use
              // the data it provides to limit the aspect ratio of the video.
              return AspectRatio(
                aspectRatio: _controller.value.aspectRatio,
                // Use the VideoPlayer widget to display the video.
                child: VideoPlayer(_controller),
              );
            } else {
              // If the VideoPlayerController is still initializing, show a
              // loading spinner.
              return AspectRatio(
                aspectRatio: _controller.value.aspectRatio,
                // Use the VideoPlayer widget to display the video.
                child: Center(child: CircularProgressIndicator()),
              );

            }
          },
        ),
        SafeArea(
          child: AspectRatio(
            aspectRatio: _controller.value.aspectRatio,
            // Use the VideoPlayer widget to display the video.
            child: controlAction(),
          ),
        ),
      ],
    );
  }

  Widget controlAction() {
    return GestureDetector(
      onTap: () {
        setState(() {
          _shownControler = !_shownControler;
        });
      },
      child: _shownControler
          ? Container(
        color: Colors.transparent,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [

                IconButton(icon:    Icon(Icons.arrow_back_ios_outlined), onPressed: (){
                  Navigator.pop(context);
                }),
                Text('Hello Wold'),
                Icon(Icons.settings_backup_restore),
                Icon(Icons.pause),
                Icon(Icons.settings_backup_restore),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                MyIcon(20, Icons.settings_backup_restore,(){}),
                SizedBox(
                  width: 16,
                ),
                MyIcon(40, _controller.value.isPlaying?Icons.pause:Icons.play_arrow,(){
                  setState(() {
                    // If the video is playing, pause it.
                    if (_controller.value.isPlaying) {
                      _controller.pause();
                    } else {
                      // If the video is paused, play it.
                      _controller.play();
                    }
                  });
                }),
                SizedBox(
                  width: 16,
                ),
                MyIcon(20, Icons.settings_backup_restore,(){}),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 16),
              child: Row(
                children: [
                  SizedBox(
                    width: 16,
                  ),
                  Text('${_controller.value.position.inSeconds.toString()}'),
                  Expanded(
                    child: Slider(
                      onChanged: (double value) {
                        setState(() {
                          _controller.seekTo(Duration(seconds: value.toInt()));
                          _currentVideoTime = value;
                        });

                      },
                      value: _currentVideoTime,
                      divisions: _controller.value.duration.inSeconds,
                      min: 0,
                      max: _controller.value.duration.inSeconds.toDouble(),
                      label: _currentVideoTime.round().toString(),
                    ),
                  ),
                  Text('${_controller.value.duration.inSeconds}'),
                  IconButton(
                      icon: Icon(Icons.fullscreen), onPressed: () {}),
                ],
              ),
            ),
          ],
        ),
      )
          : Container(
        color: Colors.transparent,
      ),
    );
  }

  Widget MyIcon(double size, var iconLabel,Function function) {
    return Opacity(
      opacity: 0.8,
      child: GestureDetector(
        onTap: () {
          function();
        },
        child: CircleAvatar(
          radius: size / 2 + 2,
          backgroundColor: Colors.black,
          child: Icon(
            iconLabel,
            size: size,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
