import 'package:flutter/material.dart';

class MoreLikeThisWidget extends StatefulWidget {
  const MoreLikeThisWidget({super.key});

  @override
  State<MoreLikeThisWidget> createState() => _MoreLikeThisWidgetState();
}

class _MoreLikeThisWidgetState extends State<MoreLikeThisWidget> {
  final List<Map<String, String>> movies = [
    {
      'title': 'Pushpa',
      'genre': 'Action/Thriller',
      'image': 'assets/images/image 16.png',
    },
    ...List.generate(
      10,
      (index) => {
        'title': 'Badhaai Do',
        'genre': 'Comedy/Drama',
        'image': 'assets/images/image 12.png',
      },
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: GridView.builder(
        itemCount: movies.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 12,
          mainAxisSpacing: 12,
          mainAxisExtent: 125,
        ),
        itemBuilder: (context, index) {
          final movie = movies[index];
          return _MovieCard(
            title: movie['title']!,
            genre: movie['genre']!,
            imagePath: movie['image']!,
          );
        },
      ),
    );
  }
}

class _MovieCard extends StatelessWidget {
  final String title;
  final String genre;
  final String imagePath;

  const _MovieCard({
    required this.title,
    required this.genre,
    required this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(16),
      child: Stack(
        children: [
          SizedBox(
            width: double.infinity,
            height: double.infinity,
            child: Image.asset(
              imagePath,
              fit: BoxFit.cover,
            ),
          ),
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.black.withOpacity(0.7), Colors.transparent],
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
              ),
            ),
          ),
          Positioned(
            bottom: 8,
            left: 8,
            right: 8,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 4),
                Text(
                  genre,
                  style: const TextStyle(
                    color: Colors.white70,
                    fontSize: 12,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
