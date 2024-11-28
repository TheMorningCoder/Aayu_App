import 'package:aayu_app/core/themes/app_colors.dart';
import 'package:aayu_app/modules/user/components/hyperlink_text.dart';
import 'package:aayu_app/modules/user/components/reusable_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CommunityMilestoneCard extends StatelessWidget {
  final String name;
  final String streak;
  final VoidCallback? onSeeMore;

  const CommunityMilestoneCard({
    super.key,
    required this.name,
    required this.streak,
    this.onSeeMore,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Community Milestone",
              style: TextStyle(
                fontSize: 16.sp,
                fontWeight: FontWeight.bold,
                color: AppColors.titleHeadingColor,
              ),
            ),
            const HyperlinkText(text: "see more"),
          ],
        ),
        SizedBox(height: 10.h),
        ReusableCard(
          child: Row(
            children: [
              Image.asset(
                'assets/contacts.png',
                width: 40.w,
                height: 40.h,
              ),
              SizedBox(width: 12.w),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(height: 4.h),
                  Text(
                    "$streak days of streak",
                    style: TextStyle(
                      fontSize: 12.sp,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
              Spacer(),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
                decoration: BoxDecoration(
                  color: AppColors.secondaryYellowColor,
                  borderRadius: BorderRadius.circular(4.r),
                ),
                child: Row(
                  children: [
                    Icon(
                      Icons.local_fire_department,
                      size: 20.sp,
                      color: AppColors.fireColor,
                    ),
                    SizedBox(width: 4.w),
                    Text(
                      'Longest Streak',
                      style: TextStyle(
                        fontSize: 12.sp,
                        color: AppColors.titleHeadingColor,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
