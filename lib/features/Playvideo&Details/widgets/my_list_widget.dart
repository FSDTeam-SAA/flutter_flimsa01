//import 'package:flimsa01mvp/feature/Playvideo&Details/widgets/play_video_more_like_this_widget.dart';
import 'package:flutter/material.dart';
//import 'package:video_player/video_player.dart';
// import 'package:chewie/chewie.dart';

class MyListButton extends StatefulWidget {
  final String videoId;

  const MyListButton({super.key, required this.videoId});

  @override
  State<MyListButton> createState() => _MyListButtonState();
}

class _MyListButtonState extends State<MyListButton> {
  static final List<String> myList = [];

  bool get isInMyList => myList.contains(widget.videoId);

  void toggleMyList() {
    setState(() {
      if (isInMyList) {
        myList.remove(widget.videoId);
      } else {
        myList.add(widget.videoId);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: toggleMyList,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            isInMyList ? Icons.favorite : Icons.favorite_border,
            size: 20,
            color: Colors.white,
          ),
          const SizedBox(height: 4),
          const Text('My List', style: TextStyle(color: Colors.white, fontSize: 12)),
        ],
      ),
    );
  }
}