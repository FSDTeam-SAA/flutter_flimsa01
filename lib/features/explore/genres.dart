import 'package:flutter/material.dart';


class GenresScreen extends StatelessWidget {
  const GenresScreen({super.key});

  final List<Map<String, String>> genres = const [
  {"name": "Action", "image": "assets/images/3.png"},
  {"name": "Drama", "image": "assets/images/4.png"},
  {"name": "Romance", "image": "assets/images/5.png"},
  {"name": "Comedy", "image": "assets/images/6.png"},
  {"name": "Thriller / Mystery", "image": "assets/images/7.png"},
  {"name": "Science Fiction", "image": "assets/images/8.png"},
  {"name": "Fantasy", "image": "assets/images/9.png"},
  {"name": "Horror", "image": "assets/images/10.png"},
  {"name": "Animation", "image": "assets/images/11.png"},
  {"name": "Documentary", "image": "assets/images/33.png"},
];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text("Genres", style: TextStyle(color: Colors.white,fontSize: 24)),
        leading: const BackButton(color: Colors.white),
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: GridView.builder(
          itemCount: genres.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 14,
            crossAxisSpacing: 14,
            childAspectRatio: 1.3,
          ),
          itemBuilder: (context, index) {
            final genre = genres[index];
            return GenreCard(
              title: genre['name']!,
              imagePath: genre['image']!,
            );
          },
        ),
      ),
    );
  }
}

class GenreCard extends StatelessWidget {
  final String title;
  final String imagePath;

  const GenreCard({
    super.key,
    required this.title,
    required this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Expanded(
          child: ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.asset(
              imagePath,
              fit: BoxFit.cover,
            ),
          ),
        ),
        const SizedBox(height: 6),
        Text(
          title,
          textAlign: TextAlign.center,
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
      ],
    );
  }
}

