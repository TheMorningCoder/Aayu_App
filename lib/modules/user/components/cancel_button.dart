import 'package:aayu_app/core/themes/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CancelButton extends StatelessWidget {
  const CancelButton({
    super.key,
    required this.buttonText,
    required this.onPressed,
  });
  final String buttonText;
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.redCancelButtonBackgroundColor,
          elevation: 0,
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.r),
          ),
        ),
        child: Text(
          buttonText,
          style: TextStyle(
            color: AppColors.redCancelButtonFontColor,
            fontSize: 14.sp,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
