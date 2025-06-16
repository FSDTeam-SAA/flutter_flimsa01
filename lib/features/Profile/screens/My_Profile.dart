import 'package:flimsa01mvp/features/Profile/screens/Edit_Profile.dart';
import 'package:flimsa01mvp/features/Profile/screens/about_app.dart';
import 'package:flimsa01mvp/features/Profile/screens/my_list.dart';
import 'package:flimsa01mvp/features/Profile/screens/privacy_policy.dart';
import 'package:flimsa01mvp/features/Profile/screens/term_&_condition.dart';
import 'package:flutter/material.dart';

import 'Change_Password.dart';
import 'History.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> historyItems = List.generate(
      5,
      (index) => {
        'title': 'Tomorrow Was Beautiful',
        'subtitle': '24 May 2025 | Movie | 2h 46m 31s',
        'imageUrl': 'assets/images/image 22.png',
        'currentTime': const Duration(minutes: 15, seconds: 43),
        'totalTime': const Duration(minutes: 40, seconds: 15),
      },
    );

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text(
          'My Profile',
          style: TextStyle(
            color: Colors.white70,
            fontWeight: FontWeight.bold,
            fontSize: 24,
          ),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          _buildProfileHeader(context),
          const SizedBox(height: 20),
          _buildHistorySection(context, historyItems),
          const SizedBox(height: 20),
          const Divider(color: Colors.white30, thickness: 2),
           _buildMenuItem(Icons.favorite, 'My List', () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const MyList()),
            );
          }),
          const Divider(color: Colors.white30, thickness: 2),
          _buildMenuItem(Icons.lock_outline, 'Change Password', () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const ChangePassword()),
            );
          }),
          const Divider(color: Colors.white30, thickness: 2),
          _buildMenuItem(Icons.info_outline, 'About App', () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const AboutApp()),
            );
          }),
          const Divider(color: Colors.white30, thickness: 2),
          _buildMenuItem(Icons.description_outlined, 'Privacy Policy', () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const PrivacyPolicyScreen(),
              ),
            );
          }),
          const Divider(color: Colors.white30, thickness: 2),
          _buildMenuItem(Icons.rule, 'Term & Condition', () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const Term_Condition()),
            );
          }),
          const Divider(color: Colors.white30, thickness: 2),
          ListTile(
            leading: const Icon(Icons.logout, color: Colors.red),
            title: const Text('Log Out', style: TextStyle(color: Colors.red)),
            trailing: const Icon(
              Icons.arrow_forward_ios,
              color: Colors.red,
              size: 20,
            ),
            onTap: () async {
              //await FirebaseAuth.instance.signOut();
              // Replace '/login' with your actual login route
              Navigator.of(
                // ignore: use_build_context_synchronously
                context,
              ).pushNamedAndRemoveUntil('/login', (route) => false);
            },
          ),
          const Divider(color: Colors.white30, thickness: 2),
        ],
      ),
      //bottomNavigationBar: _buildBottomNavBar(),
    );
  }

  Widget _buildProfileHeader(BuildContext context) {
    return Row(
      children: [
        const CircleAvatar(
          radius: 30,
          backgroundImage: AssetImage('assets/images/Profileimage.png'),
        ),
        const SizedBox(width: 12),
        const Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Test User',
                style: TextStyle(
                  color: Colors.white70,
                  fontWeight: FontWeight.bold,
                  fontSize: 24,
                ),
              ),
              Text(
                '@username',
                style: TextStyle(
                  color: Colors.white70,
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
            ],
          ),
        ),
        IconButton(
          icon: const Icon(Icons.edit_calendar_sharp, size: 24, color: Colors.white),
          onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const MyProfilePage(),
                          ),
                        );
                      },
        ),
      ],
    );
  }

  Widget _buildHistorySection(
    BuildContext context,
    List<Map<String, dynamic>> historyItems,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            const Expanded(
              child: Text(
                'History',
                style: TextStyle(color: Colors.white70, fontSize: 16),
              ),
            ),
            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => HistoryScreen()),
                );
              },
              child: const Text(
                'See All',
                style: TextStyle(color: Colors.white70, fontSize: 12),
              ),
            ),
          ],
        ),
        const SizedBox(height: 10),
        SizedBox(
          height: 150,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: historyItems.length,
            itemBuilder: (context, index) {
              final item = historyItems[index];
              final currentTime = item['currentTime'] as Duration;
              final totalTime = item['totalTime'] as Duration;
              final progress = currentTime.inSeconds / totalTime.inSeconds;

              return Container(
                width: 140,
                margin: const EdgeInsets.only(right: 12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Stack(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: Image.asset(
                            item['imageUrl']!,
                            height: 100,
                            width: 140,
                            fit: BoxFit.cover,
                          ),
                        ),
                        Positioned.fill(
                          child: Align(
                            alignment: Alignment.bottomCenter,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                LinearProgressIndicator(
                                  value: progress,
                                  backgroundColor: Colors.black26,
                                  valueColor: const AlwaysStoppedAnimation<Color>(
                                    Colors.red,
                                  ),
                                  minHeight: 4,
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(3.0),
                                  child: Text(
                                    '${_formatDuration(currentTime)} / ${_formatDuration(totalTime)}',
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 10,
                                      backgroundColor: Colors.transparent,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Text(
                      item['title']!,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(fontSize: 14, color: Colors.white),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  Widget _buildMenuItem(IconData icon, String title, VoidCallback onTap) {
    return ListTile(
      leading: Icon(icon, color: Colors.white),
      title: Text(title, style: const TextStyle(color: Colors.white)),
      trailing: const Icon(
        Icons.arrow_forward_ios,
        size: 16,
        color: Colors.white70,
      ),
      onTap: onTap,
    );
  }

  String _formatDuration(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    final minutes = twoDigits(duration.inMinutes.remainder(60));
    final seconds = twoDigits(duration.inSeconds.remainder(60));
    final hours = duration.inHours;
    return hours > 0 ? '$hours:$minutes:$seconds' : '$minutes:$seconds';
  }
}
