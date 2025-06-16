import 'package:flutter/material.dart';

class UpcomingPage extends StatelessWidget {
  final List<Map<String, String>> upcomingItems = List.generate(4, (index) => {
        "title": "Lorem ipsum - S1 E2",
        "date": "30 May 2025 | Time: 1 hr 25 min 21s",
        "description":
            "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis pellentesque odio et orci ultrices ullamcorper.",
      });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        title: const Text(
          "Upcoming",
          style: TextStyle(color: Colors.white70),
        ),
      ),
      body: ListView.builder(
        itemCount: upcomingItems.length,
        itemBuilder: (context, index) {
          final item = upcomingItems[index];
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 6.0),
            child: UpcomingCard(
              title: item['title']!,
              date: item['date']!,
              description: item['description']!,
            ),
          );
        },
      ),
    );
  }
}

class UpcomingCard extends StatefulWidget {
  final String title;
  final String date;
  final String description;

  const UpcomingCard({super.key, 
    required this.title,
    required this.date,
    required this.description,
  });

  @override
  State<UpcomingCard> createState() => _UpcomingCardState();
}

class _UpcomingCardState extends State<UpcomingCard> {
  bool isNotified = false;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.grey[900],
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(
            'assets/images/image 17.png',
            fit: BoxFit.cover,
            width: double.infinity,
            height: 200,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  widget.title,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    color: Colors.white,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      isNotified = !isNotified;
                    });
                  },
                  child: Icon(
                    isNotified
                        ? Icons.notifications_on_outlined
                        : Icons.notifications_outlined,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Text(
              widget.date,
              style: TextStyle(
                fontSize: 12,
                color: Colors.grey[400],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              widget.description,
              style: TextStyle(
                fontSize: 13,
                color: Colors.grey[300],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
