import 'package:detail_information/UI/feedScreen.dart';
import 'package:detail_information/UI/postingScreen.dart';
import 'package:detail_information/mainScreen/settings.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  final int selectedIndex;
  const HomeScreen({super.key, this.selectedIndex = 0});

  @override
  State<HomeScreen> createState() => _HomeScreenState(selectedIndex);
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex;

  _HomeScreenState(this.selectedIndex);

  final List<Widget> _screens = [
    const FeedScreen(),
    const PostingScreen(),
    const SettingProfile()

    // Assuming you have a ProfileScreen widget
  ];

  void _onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text('FAMZY'),
      //   centerTitle: true,
      // ),
      body: _screens[selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selectedIndex,
        onTap: _onItemTapped,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_today),
            label: 'Appointments',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}
