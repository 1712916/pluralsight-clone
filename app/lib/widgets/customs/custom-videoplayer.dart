import 'package:app/provider/login-provider.dart';
import 'package:app/provider/video-provider.dart';
import 'package:app/services/lesson-services.dart';
import 'package:app/widgets/customs/loading-process.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:video_player/video_player.dart';

// ignore: must_be_immutable
class CustomVideoPlayer extends StatefulWidget {
  String url;
  int currentTime;


  CustomVideoPlayer(
      {this.url,this.currentTime}); // 'https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4'; ;

  @override
  _CustomVideoPlayerState createState() => _CustomVideoPlayerState();
}

class _CustomVideoPlayerState extends State<CustomVideoPlayer> {
  bool isLoading = true;
  VideoPlayerController _controller;
  bool _shownControler = false;
  bool _isFullscreen = false;
  double _currentVideoTime = 0;

  @override
  void initState() {
    super.initState();
    // Create and store the VideoPlayerController. The VideoPlayerController
    // offers several different constructors to play videos from assets, files,
    // or the internet.
    this.widget.currentTime=this.widget.currentTime??0;

    _controller = VideoPlayerController.network(
      this.widget.url,
    )..initialize()..addListener(() {
      setState(() {
        // _currentVideoTime=_controller.value.position.inSeconds.toDouble();
      });
    });
    _controller.seekTo(Duration(seconds: this.widget.currentTime));
    _controller..setLooping(false);
    _shownControler = true;
  }

  listenForUpdateView() async {
    print('Hello world');
    Future(() {
      while (true) {
        Future.delayed(Duration(seconds: 1));
        if (_controller.value.isPlaying) {
          print('RUNNINGGGGGGGGGGGGGG');
        } else {
          print('STOPPPPPPPPPPPPPPPPPPPPPP');
        }
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    // Ensure disposing of the VideoPlayerController to free up resources.
    LessonServices.updateCurrentTimeLearnVideo(token: Provider.of<LoginProvider>(context).userResponseModel.token,lessonId:Provider.of<VideoProvider>(context).lessonId ,currentTime:_controller.value.position.inSeconds.toDouble() );
    Provider.of<VideoProvider>(context).clear();
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
    return Stack(
      children: [
        _controller.value.initialized
            ? AspectRatio(
                aspectRatio: _controller.value.aspectRatio,
                child: VideoPlayer(_controller),
              )
            :
        AspectRatio(
          aspectRatio: MediaQuery.of(context).size.height/ MediaQuery.of(context).size.width,
          child:Center(
            child: circleLoading(),
          ),
        ),
        _controller.value.initialized
            ? AspectRatio(
                aspectRatio: _controller.value.aspectRatio,
                child: controlAction())
            : Container(),
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
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                          icon: Icon(Icons.arrow_back_ios_outlined),
                          onPressed: () {
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
                      MyIcon(20, Icons.settings_backup_restore, () {}),
                      SizedBox(
                        width: 16,
                      ),
                      MyIcon(
                          40,
                          _controller.value.isPlaying
                              ? Icons.pause
                              : Icons.play_arrow, () {
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
                      MyIcon(20, Icons.settings_backup_restore, () {}),
                    ],
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: 16,
                      ),
                      Text('${_controller.value.position.inSeconds ?? 0}'),
                      Expanded(
                        child: Slider(
                          onChanged: (double value) {
                            setState(() {
                              _controller
                                  .seekTo(Duration(seconds: value.toInt()));

                            });
                          },
                          value: _controller.value.position.inSeconds == null
                              ? 0
                              : _controller.value.position.inSeconds.toDouble(),
                          divisions: _controller.value.duration.inSeconds ?? 0,
                          min: 0,
                          max: _controller.value.duration.inSeconds == null
                              ? 0
                              : _controller.value.duration.inSeconds.toDouble(),
                          label: _currentVideoTime.round().toString(),
                        ),
                      ),
                      Text('${_controller.value.duration.inSeconds ?? 0}'),
                      IconButton(
                          icon: Icon(Icons.fullscreen), onPressed: () {}),
                    ],
                  ),
                ],
              ),
            )
          : Container(
              color: Colors.transparent,
            ),
    );
  }

  Widget MyIcon(double size, var iconLabel, Function function) {
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
