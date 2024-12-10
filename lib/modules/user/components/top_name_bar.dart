import 'package:aayu_app/core/themes/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// Top Bar Widget
class TopNameBar extends StatelessWidget {
  const TopNameBar({
    super.key,
    required this.name,
  });
  final String name;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Welcome,",
              style: TextStyle(
                fontSize: 14.sp,
                fontWeight: FontWeight.bold,
                color: AppColors.bodyNeutralColor,
              ),
            ),
            Text(
              name,
              style: TextStyle(
                fontSize: 20.sp,
                fontWeight: FontWeight.bold,
                color: AppColors.titleHeadingColor,
              ),
            ),
          ],
        ),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
          decoration: BoxDecoration(
            color: AppColors.primaryWhiteColor,
            borderRadius: BorderRadius.circular(20.r),
            border: Border.all(
              color: AppColors.goldenOutlineButtonColor,
              width: 1.sp,
            ),
          ),
          child: Text(
            "25 Class",
            style: TextStyle(
              fontSize: 14.sp,
              color: AppColors.goldenOutlineButtonColor,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }
}
