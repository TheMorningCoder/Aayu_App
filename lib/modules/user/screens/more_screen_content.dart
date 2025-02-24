import 'package:aayu_app/core/routes/routes.dart';
import 'package:aayu_app/core/themes/app_colors.dart';
import 'package:aayu_app/modules/user/components/alert_bar.dart';
import 'package:aayu_app/modules/user/components/navigation_button.dart';
import 'package:aayu_app/modules/user/components/refer_and_earn_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:aayu_app/modules/user/components/top_name_bar.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MoreScreenContent extends StatefulWidget {
  const MoreScreenContent({super.key});

  @override
  MoreScreenContentState createState() => MoreScreenContentState();
}

class MoreScreenContentState extends State<MoreScreenContent> {
  void logout(BuildContext context) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.clear(); // Remove stored user data
    Navigator.pushReplacementNamed(
        context, "/login-screen"); // Redirect to login
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 8.w),
          decoration:
              const BoxDecoration(color: AppColors.lighterBrownBackgroundColor),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Top Bar Section
              SizedBox(height: 14.h),
              const TopNameBar(name: "Karthik"),
              // Calendar Widget
              SizedBox(height: 14.h),

              // Alert Bar
              const AlertBar(text: ". The pilates center is closed today"),
              SizedBox(height: 14.h),
              NavigationButton(
                text: "Account Settings",
                icon: Icons.settings,
                onTap: () {
                  Navigator.pushNamed(context, Routes.accountSettings);
                },
              ),
              NavigationButton(
                text: "Purchase History",
                icon: Icons.receipt,
                onTap: () {
                  Navigator.pushNamed(context, Routes.purchaseHistory);
                },
              ),
              NavigationButton(
                text: "Logout",
                icon: Icons.logout,
                onTap: () {
                  logout(context);
                },
              ),
              SizedBox(height: 90.h),
              const ReferAndEarnCard(),
            ],
          ),
        ),
      ),
    );
  }
}
