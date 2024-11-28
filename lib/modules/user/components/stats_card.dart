import 'package:aayu_app/core/themes/app_colors.dart';
import 'package:aayu_app/modules/user/components/hyperlink_text.dart';
import 'package:aayu_app/modules/user/components/reusable_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// Stats Card Widget
class StatsCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ReusableCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "My Stats",
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
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _StatItem(label: "Classes in 7 days", value: "10"),
              Line(),
              _StatItem(label: "Classes in 1 month", value: "40"),
              Line(),
              _StatItem(label: "Classes in 3 month", value: "100"),
            ],
          ),
          SizedBox(height: 10.h),
          Text(
            "Last Class: 25th Feb 2024",
            style: TextStyle(
              fontSize: 14.sp,
              fontWeight: FontWeight.w600,
              color: AppColors.bodyNeutralColor,
            ),
          ),
        ],
      ),
    );
  }
}

class Line extends StatelessWidget {
  const Line({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 1, // Width of the line
      height: 50.h, // Height of the line
      color: AppColors.lightBlackColor, // Color of the line
    );
  }
}

// Stat Item Widget
class _StatItem extends StatelessWidget {
  final String label;
  final String value;

  const _StatItem({required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          value,
          style: TextStyle(
            fontSize: 16.sp,
            fontWeight: FontWeight.bold,
            color: AppColors.primaryBrownColor,
          ),
        ),
        SizedBox(height: 4.h),
        Container(
          width: 70.w, // Set the maximum width for wrapping
          child: Text(
            label,
            textAlign: TextAlign.center,
            softWrap: true, // Ensures the text will wrap when necessary
            overflow: TextOverflow
                .visible, // Optional: ensures text doesn't get truncated
            style: TextStyle(
              fontSize: 12.sp,
              color: AppColors.bodyNeutralColor,
            ),
          ),
        ),
      ],
    );
  }
}
