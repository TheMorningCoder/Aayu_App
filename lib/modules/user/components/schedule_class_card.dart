import 'package:aayu_app/core/themes/app_colors.dart';
import 'package:aayu_app/modules/user/components/reusable_card.dart';
import 'package:aayu_app/modules/user/screens/popups/upcoming_class_popup.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ScheduleClassCard extends StatelessWidget {
  final String classDate;
  final String classTime;
  final String instructorName;

  const ScheduleClassCard({
    required this.classDate,
    required this.classTime,
    required this.instructorName,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ReusableCard(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Scheduled Class",
              style: TextStyle(
                color: AppColors.bodyNeutralColor,
                fontSize: 14.sp,
              ),
            ),
            SizedBox(height: 10.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      classDate,
                      style: TextStyle(
                        color: AppColors.titleHeadingColor,
                        fontSize: 14.sp,
                      ),
                    ),
                    Text(
                      classTime,
                      style: TextStyle(
                        color: AppColors.titleHeadingColor,
                        fontSize: 14.sp,
                      ),
                    ),
                  ],
                ),
                SizedBox(width: 10.w),
                ElevatedButton(
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return UpcomingClassPopup(
                          classDate: classDate,
                          classTime: classTime,
                        );
                      },
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.lightBlueBackground,
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
                )
              ],
            ),
            SizedBox(height: 5.h),
            Text(
              "By $instructorName",
              style: TextStyle(
                color: AppColors.bodyNeutralColor,
                fontSize: 14.sp,
                fontStyle: FontStyle.italic,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
