import 'package:app/widgets/customs/loading-process.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

// ignore: must_be_immutable
class CustomVideoPlayer extends StatefulWidget {
  String url;

  CustomVideoPlayer(
      {this.url}); // 'https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4';

  @override
  _CustomVideoPlayerState createState() => _CustomVideoPlayerState();
}

class _CustomVideoPlayerState extends State<CustomVideoPlayer> {
  bool isLoading = true;
  VideoPlayerController _controller;
  Future<void> _initializeVideoPlayerFuture;
  bool _shownControler = false;
  bool _isFullscreen = false;
  double _currentVideoTime = 0;

  @override
  void initState() {
    super.initState();
    // Create and store the VideoPlayerController. The VideoPlayerController
    // offers several different constructors to play videos from assets, files,
    // or the internet.
    _controller = VideoPlayerController.network(
      this.widget.url,
    )..initialize()..setVolume(3);

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
    _controller.dispose();
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
