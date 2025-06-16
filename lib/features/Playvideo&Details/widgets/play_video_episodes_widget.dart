import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:chewie/chewie.dart';

class PlayVideoEpisodesWidget extends StatefulWidget {
  const PlayVideoEpisodesWidget({super.key});

  @override
  State<PlayVideoEpisodesWidget> createState() => _PlayVideoEpisodesWidgetState();
}

class _PlayVideoEpisodesWidgetState extends State<PlayVideoEpisodesWidget> {
  VideoPlayerController? _videoPlayerController;
  ChewieController? _chewieController;

  final List<Map<String, String>> episodes = List.generate(32, (index) {
    return {
      'title': 'Lorem ipsum - S1 E${index + 1}',
      'date': '24 May 2025',
      'duration': '2h 44m 31s',
      'url': 'https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4',
    };
  });

  @override
  void dispose() {
    _videoPlayerController?.dispose();
    _chewieController?.dispose();
    super.dispose();
  }

  Future<void> _initializeVideo(String url) async {
    _videoPlayerController?.dispose();
    _chewieController?.dispose();

    _videoPlayerController = VideoPlayerController.network(url);

    await _videoPlayerController!.initialize();

    _chewieController = ChewieController(
      videoPlayerController: _videoPlayerController!,
      autoPlay: true,
      looping: false,
    );

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
          child: Container(
            width: size.width * 0.9,
            height: size.height * 0.05,
            decoration: BoxDecoration(
              color: const Color(0xff434343),
              borderRadius: BorderRadius.circular(82),
            ),
            child: const Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'Season 1',
                    style: TextStyle(color: Colors.white, fontSize: 14),
                  ),
                  SizedBox(width: 6),
                  Icon(Icons.arrow_drop_down, color: Colors.white),
                ],
              ),
            ),
          ),
        ),

        if (_chewieController != null && _chewieController!.videoPlayerController.value.isInitialized)
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
            child: AspectRatio(
              aspectRatio: _videoPlayerController!.value.aspectRatio,
              child: Chewie(controller: _chewieController!),
            ),
          ),

        Expanded(
          child: ListView.builder(
            itemCount: episodes.length,
            itemBuilder: (context, index) {
              final episode = episodes[index];
              return ListTile(
                leading: ClipRRect(
                  borderRadius: BorderRadius.circular(5),
                  child: Image.asset(
                    'assets/images/27.png',
                    width: 74,
                    height: 50,
                    fit: BoxFit.cover,
                  ),
                ),
                title: Text(
                  episode['title']!,
                  style: const TextStyle(color: Colors.white),
                ),
                subtitle: Text(
                  "${episode['date']} | Movie | ${episode['duration']}",
                  style: const TextStyle(color: Colors.grey),
                ),
                onTap: () {
                  _initializeVideo(episode['url']!);
                },
              );
            },
          ),
        ),
      ],
    );
  }
}
