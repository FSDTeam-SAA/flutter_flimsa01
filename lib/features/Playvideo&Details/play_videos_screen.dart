import 'package:chewie/chewie.dart';
import 'package:flimsa01mvp/features/Playvideo&Details/widgets/my_list_widget.dart';
import 'package:flimsa01mvp/features/Playvideo&Details/widgets/play_video_episodes_widget.dart';
import 'package:flimsa01mvp/features/Playvideo&Details/widgets/play_video_more_like_this_widget.dart';
import 'package:flimsa01mvp/features/Playvideo&Details/widgets/video_player_widget.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class PlayVideosScreen extends StatefulWidget {
  const PlayVideosScreen({super.key});

  @override
  State<PlayVideosScreen> createState() => _PlayVideosScreenState();
}

class _PlayVideosScreenState extends State<PlayVideosScreen> {
  late VideoPlayerController _videoPlayerController;
  ChewieController? _chewieController;
  bool isLiked = false;

  final List<Map<String, String>> episodes = List.generate(32, (index) {
    return {
      'title': 'Lorem ipsum - S1 E\${index + 1}',
      'date': '24 May 2025',
      'duration': '2h 44m 31s',
    };
  });

  bool isShowEpisodes = true;

  @override
  void dispose() {
    _videoPlayerController.dispose();
    _chewieController?.dispose();
    super.dispose();
  }

  Widget buildActor(String imagePath, String name) {
    return Padding(
      padding: const EdgeInsets.only(right: 12),
      child: Column(
        children: [
          CircleAvatar(radius: 24, backgroundImage: AssetImage(imagePath)),
          const SizedBox(height: 4),
          Text(
            name,
            textAlign: TextAlign.center,
            style: const TextStyle(color: Colors.white70, fontSize: 12),
          ),
        ],
      ),
    );
  }

  Widget buildShareIcon(String iconPath, String label) {
    return Column(
      children: [
        ClipOval(
          child: Container(
            color: Colors.black,
            padding: const EdgeInsets.all(8),
            child: Image.asset(
              iconPath,
              width: 40,
              height: 40,
              fit: BoxFit.cover,
            ),
          ),
        ),
        const SizedBox(height: 4),
        Text(label, style: const TextStyle(color: Colors.white, fontSize: 12)),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(
              height: size.height * 0.22,
              width: size.width,
              child: const video(),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Lorem ipsum - S1 E2",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 4),
                  const Text(
                    "24 May 2025 | Movie | 2h 44m 31s",
                    style: TextStyle(color: Colors.grey),
                  ),
                  const SizedBox(height: 8),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Lorem ipsum dolor sit amet, consectetur adipiscing elit...",
                        maxLines: 4,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(color: Colors.white70, fontSize: 12),
                      ),
                      const SizedBox(height: 4),
                      GestureDetector(
                        onTap: () {
                          showModalBottomSheet(
                            context: context,
                            backgroundColor: Colors.black87,
                            shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.vertical(
                                top: Radius.circular(16),
                              ),
                            ),
                            builder: (context) {
                              return Padding(
                                padding: const EdgeInsets.all(16.0),
                                child: SingleChildScrollView(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const Center(
                                        child: Text(
                                          'Description',
                                          style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                      const SizedBox(height: 12),
                                      const Text(
                                        "Full description goes here...",
                                        style: TextStyle(
                                          color: Colors.white70,
                                          fontSize: 14,
                                        ),
                                      ),
                                      const SizedBox(height: 20),
                                      const Text(
                                        'Starring',
                                        style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white,
                                        ),
                                      ),
                                      const SizedBox(height: 12),
                                      Row(
                                        children: [
                                          buildActor(
                                            "assets/images/S1.png",
                                            "Amanda\nBlack",
                                          ),
                                          buildActor(
                                            "assets/images/S2.png",
                                            "Joshua\nBell",
                                          ),
                                          buildActor(
                                            "assets/images/S3.png",
                                            "Leisha\nAlexander",
                                          ),
                                          buildActor(
                                            "assets/images/S4.png",
                                            "Jenny\nWatson",
                                          ),
                                        ],
                                      ),
                                      const SizedBox(height: 20),
                                      const Text(
                                        'Director',
                                        style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white,
                                        ),
                                      ),
                                      const SizedBox(height: 12),
                                      Row(
                                        children: [
                                          buildActor(
                                            "assets/images/D.png",
                                            "Duy\nHendrix",
                                          ),
                                        ],
                                      ),
                                      const SizedBox(height: 20),
                                      const Text(
                                        'Genres',
                                        style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white,
                                        ),
                                      ),
                                      const SizedBox(height: 8),
                                      const Text(
                                        'Drama, Romance',
                                        style: TextStyle(
                                          color: Colors.white70,
                                          fontSize: 14,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            },
                          );
                        },
                        child: const Text(
                          'See More',
                          style: TextStyle(
                            color: Colors.blueAccent,
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      const MyListButton(videoId: 'S1_E2'),
                      InkWell(
                        onTap: () {
                          setState(() {
                            isLiked = !isLiked;
                          });
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(
                                isLiked
                                    ? 'Added to Liked Videos'
                                    : 'Removed from Liked Videos',
                              ),
                            ),
                          );
                        },
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(
                              isLiked
                                  ? Icons.thumb_up
                                  : Icons.thumb_up_alt_outlined,
                              size: 20,
                              color: Colors.white,
                            ),
                            const SizedBox(height: 4),
                            const Text(
                              'I Like This',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 12,
                              ),
                            ),
                          ],
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          showModalBottomSheet(
                            context: context,
                            backgroundColor: Colors.black87,
                            shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.vertical(
                                top: Radius.circular(16),
                              ),
                            ),
                            builder: (context) {
                              return Padding(
                                padding: const EdgeInsets.all(16.0),
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    const Center(
                                      child: Text(
                                        'Share To',
                                        style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                    const SizedBox(height: 16),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        buildShareIcon(
                                          'assets/images/wh.png',
                                          'WhatsApp',
                                        ),
                                        buildShareIcon(
                                          'assets/images/fa.png',
                                          'Twitter',
                                        ),
                                        buildShareIcon(
                                          'assets/images/we.png',
                                          'Facebook',
                                        ),
                                        buildShareIcon(
                                          'assets/images/tw.png',
                                          'WeChat',
                                        ),
                                        buildShareIcon(
                                          'assets/images/in.png',
                                          'Instagram',
                                        ),
                                      ],
                                    ),
                                    const SizedBox(height: 20),
                                  ],
                                ),
                              );
                            },
                          );
                        },
                        child: const Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(Icons.send, size: 20, color: Colors.white),
                            SizedBox(height: 4),
                            Text(
                              'Share',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 12,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const Divider(color: Colors.white30, thickness: 1),
            Transform.translate(
              offset: const Offset(0, -17),
              child: Align(
                alignment: Alignment.centerLeft,
                child: SizedBox(
                  width: size.width * .69,
                  height: size.height * .05,
                  child: Row(
                    children: [
                      SizedBox(
                        width: (size.width * .5) / 2,
                        height: size.height * .05,
                        child: TextButton(
                          onPressed: () {
                            setState(() {
                              isShowEpisodes = true;
                            });
                          },
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Container(
                                  height: 3,
                                  width: (size.width * .33) / 2,
                                  color: isShowEpisodes
                                      ? Colors.white
                                      : Colors.transparent,
                                ),
                              ),
                              const Text(
                                'Episodes',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        width: (size.width * .7) / 2,
                        height: size.height * .05,
                        child: TextButton(
                          onPressed: () {
                            setState(() {
                              isShowEpisodes = false;
                            });
                          },
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Container(
                                  height: 3,
                                  width: (size.width * .5) / 2,
                                  color: !isShowEpisodes
                                      ? Colors.white
                                      : Colors.transparent,
                                ),
                              ),
                              const Text(
                                'More Like This',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            if (isShowEpisodes)
              SizedBox(
                height: size.height * .4,
                child: const PlayVideoEpisodesWidget(),
              )
            else
              SizedBox(
                height: size.height * .4,
                child: const MoreLikeThisWidget(),
              ),
          ],
        ),
      ),
    );
  }
}
