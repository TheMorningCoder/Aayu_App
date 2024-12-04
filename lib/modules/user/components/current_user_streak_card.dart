import 'package:aayu_app/core/themes/app_colors.dart';
import 'package:aayu_app/modules/user/components/reusable_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// Current User Streak Card Widget
class CurrentUserStreakCard extends StatelessWidget {
  const CurrentUserStreakCard({
    super.key,
    required this.streakNumber,
  });
  final String streakNumber;
  @override
  Widget build(BuildContext context) {
    return ReusableCard(
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.fromLTRB(4.sp, 8.sp, 4.sp, 8.sp),
            margin: EdgeInsets.only(bottom: 4.sp),
            decoration: const BoxDecoration(color: AppColors.lightBrownColor),
            child: Row(
              children: [
                Image.asset(
                  'assets/fire.gif',
                  width: 40.w,
                  height: 40.h,
                ),
                SizedBox(width: 12.w),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "$streakNumber Days Streak",
                      style: TextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.bold,
                        color: AppColors.titleHeadingColor,
                      ),
                    ),
                    SizedBox(height: 8.h),
                    Text(
                      "Great work, keep it going!",
                      style: TextStyle(
                        fontSize: 14.sp,
                        color: AppColors.bodyNeutralColor,
                      ),
                    ),
                    SizedBox(height: 12.h),
                  ],
                ),
              ],
            ),
          ),
          Text(
            "*Focus on maintaining proper technique for each exercise.",
            style: TextStyle(
              fontSize: 12.sp,
              color: AppColors.bodyNeutralColor,
            ),
          ),
        ],
      ),
    );
  }
}
