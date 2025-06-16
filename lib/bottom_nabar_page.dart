
import 'package:flimsa01mvp/features/Profile/screens/My_Profile.dart';
import 'package:flimsa01mvp/features/Upcomming/upcomming.dart';
import 'package:flimsa01mvp/features/explore/explore.dart';
import 'package:flimsa01mvp/features/home/movie_home_page.dart';
import 'package:flutter/material.dart';


class BottomNabarScreen extends StatefulWidget {
  const BottomNabarScreen({super.key});

  @override
  State<BottomNabarScreen> createState() => _BottomNabarScreenState();
}

class _BottomNabarScreenState extends State<BottomNabarScreen> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    const MovieHomePage(),
    ExploreScreen(),
    UpcomingPage(),
    const ProfileScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.black,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.grey,
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.explore), label: 'Explore'),
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_today),
            label: 'Upcoming',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_4_outlined),
            label: 'My Profile',
          ),
        ],
      ),
    );
  }
}

// class ExplorePage extends StatelessWidget {
//   const ExplorePage({super.key});

//   @override
//   Widget build(BuildContext context) => Container(
//         color: Colors.black,
//         child: const Center(
//           child: Text('Explore Page', style: TextStyle(color: Colors.white)),
//         ),
//       );
// }