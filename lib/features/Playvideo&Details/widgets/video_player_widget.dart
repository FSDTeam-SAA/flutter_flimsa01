import 'package:flimsa01mvp/features/Playvideo&Details/widgets/full_screen.dart';
import 'package:flimsa01mvp/features/Playvideo&Details/widgets/video_settingd_poup.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:video_player/video_player.dart';
import 'package:chewie/chewie.dart';

class video extends StatefulWidget {
  const video({super.key});

  @override
  State<video> createState() => _CustomVideoPlayerState();
}

class _CustomVideoPlayerState extends State<video> {
  late VideoPlayerController _videoPlayerController;
  ChewieController? _chewieController;

  @override
  void initState() {
    super.initState();
    _videoPlayerController =
        VideoPlayerController.asset('assets/video/video1.mp4')
          ..initialize().then((_) {
            setState(() {});
          });
    // ignore: deprecated_member_use
    // _videoPlayerController =
    //     VideoPlayerController.network(
    //         "http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4", // <-- Replace with your actual URL
    //       )
    //       ..initialize().then((_) {
    //         setState(() {});
    //       });

    _chewieController = ChewieController(
      videoPlayerController: _videoPlayerController,
      autoPlay: false,
      looping: false,
      showControls: false,
    );
  }

  @override
  void dispose() {
    _videoPlayerController.dispose();
    _chewieController?.dispose();
    super.dispose();
  }

  String _formatDuration(Duration duration) {
    final minutes = duration.inMinutes.remainder(60).toString().padLeft(2, '0');
    final seconds = duration.inSeconds.remainder(60).toString().padLeft(2, '0');
    return "$minutes:$seconds";
  }

  Widget _buildControls() {
    return Stack(
      children: [
        Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                icon: const Icon(Icons.replay_10, color: Colors.white),
                onPressed: () {
                  final position = _videoPlayerController.value.position;
                  _videoPlayerController.seekTo(
                    position - const Duration(seconds: 10),
                  );
                },
              ),
              IconButton(
                icon: Icon(
                  _videoPlayerController.value.isPlaying
                      ? Icons.pause
                      : Icons.play_arrow,
                  color: Colors.white,
                ),
                onPressed: () {
                  setState(() {
                    _videoPlayerController.value.isPlaying
                        ? _videoPlayerController.pause()
                        : _videoPlayerController.play();
                  });
                },
              ),
              IconButton(
                icon: const Icon(Icons.forward_10, color: Colors.white),
                onPressed: () {
                  final position = _videoPlayerController.value.position;
                  _videoPlayerController.seekTo(
                    position + const Duration(seconds: 10),
                  );
                },
              ),
            ],
          ),
        ),
        const Positioned(
          left: 10,
          top: 0,
          child: Icon(Icons.arrow_back, color: Colors.white),
        ),

        Positioned(
          right: 10,
          top: -10,
          child: IconButton(
            onPressed: () {
              showDialog(
                context: context,
                builder: (_) => const VideoSettingsPopup(),
              );
            },
            icon: const Icon(Icons.settings, color: Colors.white),
          ),
        ),

        Positioned(
          bottom: 20,
          left: 10,
          child: Text(
            "${_formatDuration(_videoPlayerController.value.position)} / ${_formatDuration(_videoPlayerController.value.duration)}",
            style: const TextStyle(color: Colors.white),
          ),
        ),
        Positioned(
          bottom: 5,
          left: 10,
          right: 10,
          child: VideoProgressIndicator(
            _videoPlayerController,
            allowScrubbing: true,
            colors: const VideoProgressColors(
              playedColor: Colors.red,
              backgroundColor: Colors.grey,
              bufferedColor: Colors.white38,
            ),
          ),
        ),
        const Positioned(
          bottom: 20,
          right: 50,
          child: Icon(Icons.volume_up, color: Colors.white),
        ),
        Positioned(
          bottom: 8,
          right: 10,
          child: IconButton(
            onPressed: () async {
              await SystemChrome.setPreferredOrientations([
                DeviceOrientation.landscapeRight,
                DeviceOrientation.landscapeLeft,
              ]);
              await SystemChrome.setEnabledSystemUIMode(
                SystemUiMode.immersiveSticky,
              );
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => FullScreenVideo(
                    controller: _videoPlayerController,
                    chewieController: _chewieController!,
                  ),
                ),
              );
            },
            icon: const Icon(Icons.fullscreen, color: Colors.white),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SizedBox(
      height: size.height * .25,
      width: double.infinity,
      child: _videoPlayerController.value.isInitialized
          ? Stack(
              children: [
                Chewie(controller: _chewieController!),
                _buildControls(),
              ],
            )
          : const Center(child: CircularProgressIndicator()),
    );
  }
}

class FullscreenVideoPlayer extends StatefulWidget {
  final VideoPlayerController controller;

  const FullscreenVideoPlayer({super.key, required this.controller});

  @override
  State<FullscreenVideoPlayer> createState() => _FullscreenVideoPlayerState();
}

class _FullscreenVideoPlayerState extends State<FullscreenVideoPlayer> {
  late ChewieController _chewieController;

  @override
  void initState() {
    super.initState();
    _chewieController = ChewieController(
      videoPlayerController: widget.controller,
      autoPlay: true,
      looping: false,
      showControls: true,
    );
  }

  @override
  void dispose() {
    _chewieController.dispose();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: AspectRatio(
          aspectRatio: widget.controller.value.aspectRatio,
          child: Chewie(controller: _chewieController),
        ),
      ),
    );
  }
}
