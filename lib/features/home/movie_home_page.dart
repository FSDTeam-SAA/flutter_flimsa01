import 'package:flimsa01mvp/features/Upcomming/upcomming.dart';
import 'package:flutter/material.dart';

class MovieHomePage extends StatefulWidget {
  const MovieHomePage({super.key});

  @override
  State<MovieHomePage> createState() => _MovieHomePageState();
}

class _MovieHomePageState extends State<MovieHomePage> {
  String selectedCategory = 'All';

  final List<String> categories = [
    'All',
    'Comedy',
    'Action',
    'Mystery',
    'Drama',
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(12.0),
          children: [
            const SizedBox(height: 10),
            Align(
              alignment: Alignment.centerLeft,
              child: Image.asset('assets/images/azlologo.png', height: 30),
            ),

            const SizedBox(height: 20),
            SizedBox(
              height: 36,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: categories.length,
                itemBuilder: (context, index) {
                  final category = categories[index];
                  final isSelected = selectedCategory == category;

                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 4.0),
                    child: OutlinedButton(
                      style: OutlinedButton.styleFrom(
                        backgroundColor: isSelected
                            ? Colors.white
                            : Colors.transparent,
                        side: const BorderSide(color: Colors.white24),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                      ),
                      onPressed: () {
                        setState(() {
                          selectedCategory = category;
                        });
                      },
                      child: Text(
                        category,
                        style: TextStyle(
                          color: isSelected ? Colors.black : Colors.white,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),

            const SizedBox(height: 20),
            const MovieBanner(),
            const SizedBox(height: 20),

            buildSection("Popular"),
            buildSection("Upcoming", showSeeAll: true),
            buildSection("Top 10 Movies this Week"),
            buildSection("Comedy Club"),
            buildSection("Family Movie"),
            buildSection("Dramas"),
            buildSection("TV Shows"),
          ],
        ),
      ),
    );
  }

  Widget buildSection(String title, {bool showSeeAll = false}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: showSeeAll
              ? MainAxisAlignment.spaceBetween
              : MainAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            if (showSeeAll)
              TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => UpcomingPage()),
                  );
                },
                child: const Text(
                  "See All",
                  style: TextStyle(color: Colors.blueAccent),
                ),
              ),
          ],
        ),
        const SizedBox(height: 8),
        SizedBox(
          height: 180,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: const [
              MovieCard(image: 'assets/images/image 12.png', title: 'Pushpa'),
              MovieCard(
                image: 'assets/images/image 15.png',
                title: 'Badhaai Do',
              ),
              MovieCard(
                image: 'assets/images/image 16.png',
                title: 'Death On The Nile',
              ),
              MovieCard(image: 'assets/images/image 12.png', title: 'Pushpa'),
              MovieCard(
                image: 'assets/images/image 15.png',
                title: 'Badhaai Do',
              ),
              MovieCard(
                image: 'assets/images/image 16.png',
                title: 'Death On The Nile',
              ),
              MovieCard(image: 'assets/images/image 12.png', title: 'Pushpa'),
              MovieCard(
                image: 'assets/images/image 15.png',
                title: 'Badhaai Do',
              ),
              MovieCard(
                image: 'assets/images/image 16.png',
                title: 'Death On The Nile',
              ),
              MovieCard(image: 'assets/images/image 12.png', title: 'Pushpa'),
              MovieCard(
                image: 'assets/images/image 15.png',
                title: 'Badhaai Do',
              ),
              MovieCard(
                image: 'assets/images/image 16.png',
                title: 'Death On The Nile',
              ),
            ],
          ),
        ),
        const SizedBox(height: 16),
      ],
    );
  }
}
class MovieCard extends StatelessWidget {
  final String image;
  final String title;

  const MovieCard({super.key, required this.image, required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 110,
      margin: const EdgeInsets.only(right: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 140,
            decoration: BoxDecoration(
              color: Colors.grey[800],
              borderRadius: BorderRadius.circular(10),
              image: DecorationImage(
                image: AssetImage(image),
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(height: 5),
          Text(
            title,
            style: const TextStyle(color: Colors.white),
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}

class MovieBanner extends StatelessWidget {
  const MovieBanner({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 180,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        image: const DecorationImage(
          image: AssetImage(
            'assets/images/image 12.png',
          ), // Use your preferred image
          fit: BoxFit.cover,
        ),
      ),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.black.withOpacity(0.4),
        ),
        alignment: Alignment.center,
        child: const Text(
          "Gangubai Kathiawadi",
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}