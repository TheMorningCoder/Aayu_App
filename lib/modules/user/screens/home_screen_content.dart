import 'package:aayu_app/modules/user/components/community_milestone_streak_card.dart';
import 'package:aayu_app/modules/user/components/refer_and_earn_card.dart';
import 'package:aayu_app/modules/user/data/streak_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:aayu_app/core/themes/app_colors.dart';
import 'package:aayu_app/modules/user/components/alert_bar.dart';
import 'package:aayu_app/modules/user/components/community_milestone_card.dart';
import 'package:aayu_app/modules/user/components/stats_card.dart';
import 'package:aayu_app/modules/user/components/current_user_streak_card.dart';
import 'package:aayu_app/modules/user/components/top_name_bar.dart';

//Home Screen Content
class HomeScreenContent extends StatelessWidget {
  const HomeScreenContent({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
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

            SizedBox(height: 14.h),

            // Alert Bar
            const AlertBar(text: ". The pilates center is closed today"),

            SizedBox(height: 14.h),
            // Streak Section
            const CurrentUserStreakCard(
              streakNumber: "25",
            ),
            SizedBox(height: 14.h),
            // Stats Section
            StatsCard(),

            SizedBox(height: 14.h),
            // Community Milestone Section
            const CommunityMilestoneCard(name: "Joe Smith", streak: "20"),
            SizedBox(height: 14.h),
            // Dynamically adjusted ListView
            LayoutBuilder(
              builder: (context, constraints) {
                return Column(
                  children: streakData.map((streak) {
                    return Padding(
                      padding: EdgeInsets.only(bottom: 14.h),
                      child: CommunityStreakCard(
                        streakDays: streak['streakDays'] as int,
                        users: streak['users'] as List<Map<String, String>>,
                      ),
                    );
                  }).toList(),
                );
              },
            ),

            const ReferAndEarnCard(),
            SizedBox(height: 16.h),
          ],
        ),
      ),
    );
  }
}
