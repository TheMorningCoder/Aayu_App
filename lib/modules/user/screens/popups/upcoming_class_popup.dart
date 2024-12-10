import 'package:aayu_app/core/themes/app_colors.dart';
import 'package:aayu_app/modules/user/components/cancel_button.dart';
import 'package:aayu_app/modules/user/screens/popups/confirm_cancellation_popup.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class UpcomingClassPopup extends StatelessWidget {
  final String classDate;
  final String classTime;

  const UpcomingClassPopup({
    required this.classDate,
    required this.classTime,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.r)),
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
            SizedBox(height: 10.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding:
                      EdgeInsets.symmetric(horizontal: 10.w, vertical: 8.h),
                  decoration: BoxDecoration(
                    color: AppColors.lightBlueBackground,
                    borderRadius: BorderRadius.circular(20.r),
                  ),
                  child: Text(
                    "Upcoming",
                    style: TextStyle(
                        color: AppColors.blueLinkColor, // Text color
                        fontSize: 14.sp, // Font size
                        fontStyle: FontStyle.italic,
                        fontWeight: FontWeight.w800 // Italicize the text
                        ),
                  ),
                ),
                GestureDetector(
                  onTap: () => Navigator.of(context).pop(),
                  child: Icon(
                    Icons.close,
                    color: Colors.grey,
                    size: 20.w,
                  ),
                ),
              ],
            ),
            SizedBox(height: 20.h),
            Text(
              "Scheduled Class",
              style: TextStyle(
                color: AppColors.bodyNeutralColor,
                fontSize: 14.sp,
              ),
            ),
            SizedBox(height: 30.h),
            Text(
              "$classDate, $classTime",
              style: TextStyle(
                color: AppColors.titleHeadingColor,
                fontSize: 16.sp,
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(height: 20.h),
            CancelButton(
              buttonText: "Cancel Class",
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    //Navigator.pop(context);
                    return const ConfirmCancellationPopup();
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
