import 'package:aayu_app/core/themes/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// Alert Bar Widget
class AlertBar extends StatelessWidget {
  const AlertBar({
    super.key,
    required this.text,
  });
  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(8.sp),
      decoration: const BoxDecoration(
        color: AppColors.primaryBrownColor,
      ),
      child: Text(
        text,
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 12.sp,
          color: AppColors.primaryWhiteColor,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}
