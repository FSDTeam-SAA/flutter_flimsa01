import 'package:flutter/material.dart';

class Movie {
  final String title;
  final String date;
  final String duration;
  final String imageUrl;

  Movie({
    required this.title,
    required this.date,
    required this.duration,
    required this.imageUrl,
  });
}

class HistoryScreen extends StatelessWidget {
  final Map<String, List<Movie>> historySections = {
    'Today': List.generate(
      3,
          (index) => Movie(
        title: 'Tomorrow Was Beautiful',
        date: '24 May 2025',
        duration: '2h 44m 31s',
        imageUrl: 'assets/images/image 22.png',
      ),
    ),
    'Yesterday': List.generate(
      4,
          (index) => Movie(
        title: 'Tomorrow Was Beautiful',
        date: '24 May 2025',
        duration: '2h 44m 31s',
        imageUrl: 'assets/images/image 22.png',
      ),
    ),
    '17 May': List.generate(
      2,
          (index) => Movie(
        title: 'Tomorrow Was Beautiful',
        date: '24 May 2025',
        duration: '2h 44m 31s',
        imageUrl: 'assets/images/image 22.png',
      ),
    ),
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        title: const Text(
          'History',
          style: TextStyle(
            color: Colors.white,
            fontSize: 28,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 8),
        children: historySections.entries.map((entry) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 16),
              Text(
                entry.key,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              ...entry.value.map((movie) {
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 6.0),
                  child: Row(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Image.asset(
                          movie.imageUrl,
                          height: 60,
                          width: 100,
                          fit: BoxFit.cover,
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              movie.title,
                              style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            const SizedBox(height: 2),
                            Text(
                              '${movie.date} | Movie | ${movie.duration}',
                              style: const TextStyle(
                                color: Colors.grey,
                                fontSize: 12,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              }).toList(),
            ],
          );
        }).toList(),
      ),
    );
  }
}
