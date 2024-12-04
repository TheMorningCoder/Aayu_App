import 'package:aayu_app/modules/user/screens/home_screen_content.dart';
import 'package:aayu_app/modules/user/screens/schedule_screen.dart';
import 'package:flutter/material.dart';
import 'package:aayu_app/core/themes/app_colors.dart';

class UserHomeScreen extends StatefulWidget {
  const UserHomeScreen({super.key});

  @override
  State<UserHomeScreen> createState() => _UserHomeScreenState();
}

class _UserHomeScreenState extends State<UserHomeScreen> {
  int _currentIndex = 0;

  final List<Widget> _screens = [
    // Home Screen Content
    const HomeScreenContent(),
    // Schedule Screen
    const ScheduleScreen(),
    // Purchase Screen
    const Center(
        child: Text('Purchase Screen', style: TextStyle(fontSize: 20))),
    // More Options Screen
    const Center(
        child: Text('More Options Screen', style: TextStyle(fontSize: 20))),
  ];

  void _onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.primaryWhiteColor,
        body: _screens[_currentIndex],
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _currentIndex,
          onTap: _onTabTapped,
          selectedItemColor: AppColors.primaryBrownColor,
          unselectedItemColor: Colors.grey,
          showUnselectedLabels: true,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.calendar_today),
              label: 'Schedule',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart),
              label: 'Purchase',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.more_horiz),
              label: 'More',
            ),
          ],
        ),
      ),
    );
  }
}
