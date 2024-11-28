import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:aayu_app/core/themes/app_colors.dart';
import 'package:aayu_app/modules/user/components/alert_bar.dart';
import 'package:aayu_app/modules/user/components/community_milestone_card.dart';
import 'package:aayu_app/modules/user/components/stats_card.dart';
import 'package:aayu_app/modules/user/components/streak_card.dart';
import 'package:aayu_app/modules/user/components/top_name_bar.dart';

class UserHomeScreen extends StatefulWidget {
  const UserHomeScreen({super.key});

  @override
  State<UserHomeScreen> createState() => _UserHomeScreenState();
}

class _UserHomeScreenState extends State<UserHomeScreen> {
  int _currentIndex = 0;

  final List<Widget> _screens = [
    // Home Screen Content
    HomeScreenContent(),
    // Schedule Screen
    Center(child: Text('Schedule Screen', style: TextStyle(fontSize: 20))),
    // Purchase Screen
    Center(child: Text('Purchase Screen', style: TextStyle(fontSize: 20))),
    // More Options Screen
    Center(child: Text('More Options Screen', style: TextStyle(fontSize: 20))),
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

//Home Screen Content
class HomeScreenContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 8.w),
        decoration: const BoxDecoration(color: AppColors.lightBrownColor),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Top Bar Section
            SizedBox(height: 14.h),
            const TopNameBar(name: "Karthik"),

            SizedBox(height: 14.h),

            // Alert Bar
            const AlertBar(text: ". The pilates center is closed today"),

            SizedBox(height: 14.h),
            // Streak Section
            const StreakCard(
              streakNumber: "25",
            ),
            SizedBox(height: 14.h),
            // Stats Section
            StatsCard(),

            SizedBox(height: 14.h),
            // Community Milestone Section
            CommunityMilestoneCard(),
            SizedBox(height: 14.h),
          ],
        ),
      ),
    );
  }
}
