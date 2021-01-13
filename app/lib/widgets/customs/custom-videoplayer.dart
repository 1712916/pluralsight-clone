import 'dart:io';

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
  int typeLoad; //0: internet, 1 file


  CustomVideoPlayer(
      {this.url,this.currentTime}); // 'https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4'; ;

  @override
  _CustomVideoPlayerState createState() => _CustomVideoPlayerState();
}

class _CustomVideoPlayerState extends State<CustomVideoPlayer> {
  bool isLoading = true;
  VideoPlayerController _controller;
  bool _shownController = false;
  bool _isFullscreen = false;
  double _currentVideoTime = 0;
  String url="";

  @override
  void initState() {
    super.initState();

    this.widget.currentTime=this.widget.currentTime??0;

    url= Provider.of<VideoProvider>(context,listen: false).videoUrl;
    print("is down load ${Provider.of<VideoProvider>(context,listen: false).isDownloaded} + ${url}");

    if(Provider.of<VideoProvider>(context,listen: false).isDownloaded){
      File file=File(url);
      _controller= VideoPlayerController.file(file)..initialize();
      _controller..setLooping(false);
      _shownController = true;
    }else{
      _controller = VideoPlayerController.network(
        url,
      )..initialize()..addListener(() {
        setState(() {
          _currentVideoTime=_controller.value.position.inSeconds.toDouble();
        });
      });
      //_controller.seekTo(Duration(seconds: this.widget.currentTime??0));
      _controller..setLooping(false);
      _shownController = true;
    }



  }

  listenForUpdateView() async {

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
    LessonServices.updateCurrentTimeLearnVideo(token: Provider.of<LoginProvider>(context,listen: false).userResponseModel.token,lessonId:Provider.of<VideoProvider>(context).lessonId ,currentTime:_controller.value.position.inSeconds.toDouble() );
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
    print("Tiếp tục dô đây");
    if(url!=Provider.of<VideoProvider>(context,listen: false).videoUrl){
      setState(() {
        url=Provider.of<VideoProvider>(context,listen: false).videoUrl;
        _controller.removeListener((){});
        _controller.pause();

        if(Provider.of<VideoProvider>(context,listen: false).isDownloaded){
          File file=File( url);
          _controller= VideoPlayerController.file(file)..initialize()..addListener(() {
            setState(() {
              _currentVideoTime=_controller.value.position.inSeconds.toDouble();
            });
          });
          _controller..setLooping(false);
          _shownController = true;
        }else{
          _controller = VideoPlayerController.network(
            url,
          )..initialize()..addListener(() {
            setState(() {
              _currentVideoTime=_controller.value.position.inSeconds.toDouble();
            });
          });
          //_controller.seekTo(Duration(seconds: this.widget.currentTime??0));
          _controller..setLooping(false);
          _shownController = true;
        }
      });
    }


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
          _shownController = !_shownController;
        });
      },
      child: _shownController
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
