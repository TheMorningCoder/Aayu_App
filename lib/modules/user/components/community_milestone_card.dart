import 'package:aayu_app/core/themes/app_colors.dart';
import 'package:aayu_app/modules/user/components/reusable_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// Community Milestone Card Widget
class CommunityMilestoneCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ReusableCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Community Milestone",
            style: TextStyle(
              fontSize: 16.sp,
              fontWeight: FontWeight.bold,
              color: AppColors.titleHeadingColor,
            ),
          ),
          SizedBox(height: 16.h),
          _MilestoneItem(
              label: "5 Class Reward",
              date: "3rd August 2024",
              icon: Icons.star),
          SizedBox(height: 8.h),
          _MilestoneItem(
              label: "50 Class Reward",
              date: "25th August 2024",
              icon: Icons.apple),
        ],
      ),
    );
  }
}

// Milestone Item Widget
class _MilestoneItem extends StatelessWidget {
  final String label;
  final String date;
  final IconData icon;

  const _MilestoneItem(
      {required this.label, required this.date, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, size: 24.sp, color: AppColors.primaryBrownColor),
        SizedBox(width: 12.w),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              label,
              style: TextStyle(
                fontSize: 14.sp,
                fontWeight: FontWeight.bold,
                color: AppColors.titleHeadingColor,
              ),
            ),
            Text(
              "won on $date",
              style: TextStyle(
                fontSize: 12.sp,
                color: AppColors.bodyNeutralColor,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
