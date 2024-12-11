import 'package:aayu_app/core/themes/app_colors.dart';
import 'package:aayu_app/modules/user/components/cancel_button.dart';
import 'package:aayu_app/modules/user/screens/popups/informational_popup.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ConfirmCancellationPopup extends StatelessWidget {
  const ConfirmCancellationPopup({super.key});

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
                  "Confirm Cancellation",
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
              "The reservation occurs within 12 hours, cancelling will incur a late cancellation fee",
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
              "We will refund your 9 Credits",
              style: TextStyle(
                color: AppColors.titleHeadingColor,
                fontSize: 14.sp,
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(height: 20.h),
            CancelButton(
              buttonText: "Cancel Class",
              onPressed: () {
                Navigator.of(context).pop();
                showDialog(
                  context: context,
                  builder: (context) => InformationalPopup(
                    icon: Icons.cancel,
                    iconColor: AppColors.redCancelButtonFontColor,
                    heading: "Cancelled!",
                    description: "Your scheduled class is cancelled",
                    buttonText: "Go Back",
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
