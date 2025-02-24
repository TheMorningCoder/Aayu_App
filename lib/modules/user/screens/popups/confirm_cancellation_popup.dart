import 'package:aayu_app/core/themes/app_colors.dart';
import 'package:aayu_app/modules/user/components/cancel_button.dart';
import 'package:aayu_app/modules/user/screens/popups/informational_popup.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ConfirmCancellationPopup extends StatelessWidget {
  final String heading;
  final String firstDescription;
  final String secondDescription;
  final String buttonText;
  final VoidCallback onPressed;
  const ConfirmCancellationPopup({
    super.key,
    required this.heading,
    required this.firstDescription,
    required this.secondDescription,
    required this.buttonText,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.r)),
      child: Container(
        height: 300.h,
        width: 300.w,
        padding: EdgeInsets.all(16.w),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20.r),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  heading,
                  style: TextStyle(
                    color: AppColors.titleHeadingColor,
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                GestureDetector(
                  onTap: () => Navigator.of(context).pop(),
                  child: Icon(
                    Icons.close,
                    color: AppColors.bodyNeutralColor,
                    size: 20.w,
                  ),
                ),
              ],
            ),
            SizedBox(height: 10.h),
            Text(
              firstDescription,
              style: TextStyle(
                color: AppColors.bodyNeutralColor,
                fontSize: 14.sp,
              ),
            ),
            SizedBox(height: 20.h),
            const Divider(
              color: AppColors.bodyNeutralColor,
              thickness: 1,
            ),
            SizedBox(height: 10.h),
            Text(
              secondDescription,
              style: TextStyle(
                color: AppColors.titleHeadingColor,
                fontSize: 14.sp,
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(height: 20.h),
            CancelButton(
              buttonText: buttonText,
              onPressed: onPressed,
            ),
          ],
        ),
      ),
    );
  }
}
