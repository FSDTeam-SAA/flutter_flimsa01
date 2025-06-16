import 'package:chewie/chewie.dart';
import 'package:flimsa01mvp/features/Playvideo&Details/widgets/video_settingd_poup.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:video_player/video_player.dart';

class FullScreenVideo extends StatelessWidget {
  final VideoPlayerController controller;
  final ChewieController chewieController;

  const FullScreenVideo({
    super.key,
    required this.controller,
    required this.chewieController,
  });

  String _formatDuration(Duration duration) {
    final minutes = duration.inMinutes.remainder(60).toString().padLeft(2, '0');
    final seconds = duration.inSeconds.remainder(60).toString().padLeft(2, '0');
    return "$minutes:$seconds";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          // Fullscreen Video
          Positioned.fill(child: Chewie(controller: chewieController)),

          // Top Bar (Back + Settings)
          Positioned(
            top: 20,
            left: 10,
            child: IconButton(
              icon: const Icon(Icons.arrow_back, color: Colors.white),
              onPressed: () async {
                await SystemChrome.setPreferredOrientations([
                  DeviceOrientation.portraitUp,
                ]);
                await SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
                // ignore: use_build_context_synchronously
                Navigator.pop(context);
              },
            ),
          ),
          Positioned(
            top: 20,
            right: 20,
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

          // Center Controls
          Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  icon: const Icon(Icons.replay_10, color: Colors.white, size: 28),
                  onPressed: () {
                    final position = controller.value.position;
                    controller.seekTo(position - const Duration(seconds: 10));
                  },
                ),
                IconButton(
                  icon: Icon(
                    controller.value.isPlaying
                        ? Icons.pause
                        : Icons.play_arrow,
                    color: Colors.white,
                    size: 36,
                  ),
                  onPressed: () {
                    controller.value.isPlaying
                        ? controller.pause()
                        : controller.play();
                  },
                ),
                IconButton(
                  icon: const Icon(Icons.forward_10, color: Colors.white, size: 28),
                  onPressed: () {
                    final position = controller.value.position;
                    controller.seekTo(position + const Duration(seconds: 10));
                  },
                ),
              ],
            ),
          ),

          // Bottom Info Bar
          Positioned(
            bottom: 30,
            left: 10,
            child: Text(
              "${_formatDuration(controller.value.position)} / ${_formatDuration(controller.value.duration)}",
              style: const TextStyle(color: Colors.white, fontSize: 13),
            ),
          ),
          Positioned(
            bottom: 10,
            left: 10,
            right: 100, // leaves space for volume + fullscreen
            child: VideoProgressIndicator(
              controller,
              allowScrubbing: true,
              colors: const VideoProgressColors(
                playedColor: Colors.red,
                backgroundColor: Colors.grey,
                bufferedColor: Colors.white38,
              ),
            ),
          ),

          // Bottom right controls (volume + fullscreen)
          const Positioned(
            bottom: 20,
            right: 60,
            child: Icon(Icons.volume_up, color: Colors.white),
          ),
          //const SizedBox(width: 30),
          Positioned(
            bottom: 10,
            right: 10,
            child: IconButton(
              icon: const Icon(Icons.fullscreen_exit, color: Colors.white),
              onPressed: () async {
                await SystemChrome.setPreferredOrientations([
                  DeviceOrientation.portraitUp,
                ]);
                await SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
                Navigator.pop(context);
              },
            ),
          ),
        ],
      ),
    );
  }
}