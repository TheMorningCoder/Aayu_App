import 'package:aayu_app/core/themes/app_colors.dart';
import 'package:aayu_app/modules/user/components/alert_bar.dart';
import 'package:aayu_app/modules/user/components/hyperlink_text.dart';
import 'package:aayu_app/modules/user/components/purchase_plan_card.dart';
import 'package:aayu_app/modules/user/components/schedule_class_card.dart';
import 'package:aayu_app/modules/user/data/scheduled_class_data.dart';
import 'package:aayu_app/modules/user/screens/popups/informational_popup.dart';
import 'package:aayu_app/shared/components/primary_button.dart';
import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:aayu_app/modules/user/components/top_name_bar.dart';

class PurchaseScreenContent extends StatefulWidget {
  const PurchaseScreenContent({super.key});

  @override
  PurchaseScreenContentState createState() => PurchaseScreenContentState();
}

class PurchaseScreenContentState extends State<PurchaseScreenContent> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 8.w),
          decoration:
              const BoxDecoration(color: AppColors.lighterBrownBackgroundColor),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Top Bar Section
              SizedBox(height: 14.h),
              const TopNameBar(name: "Karthik"),
              // Calendar Widget
              SizedBox(height: 14.h),

              // Alert Bar
              const AlertBar(text: ". The pilates center is closed today"),
              SizedBox(height: 14.h),
              Text(
                "Purchase Plans",
                style: TextStyle(
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w600,
                  color: AppColors.titleHeadingColor,
                ),
              ),
              Text(
                "Checkout different plans and start your fitness journey now",
                style: TextStyle(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w400,
                  color: AppColors.bodyNeutralColor,
                ),
              ),
              SizedBox(height: 14.h),

              const PurchasePlanCard(
                planName: 'Gold Plan',
                originalPrice: 3999,
                discountedPrice: 2999,
                discountPercentage: 20,
                classesPerMonth: 25,
                imagePath: 'assets/gold_plan.png',
                gradientTagIsVisible: false,
                gradientTagText: "",
              ),
              const PurchasePlanCard(
                planName: 'Platinum Plan',
                originalPrice: 3999,
                discountedPrice: 2999,
                discountPercentage: 20,
                classesPerMonth: 25,
                imagePath: 'assets/platinum_plan.png',
                gradientTagIsVisible: true,
                gradientTagText: "Popular",
              ),
              const PurchasePlanCard(
                planName: 'Diamond Plan',
                originalPrice: 3999,
                discountedPrice: 2999,
                discountPercentage: 20,
                classesPerMonth: 25,
                imagePath: 'assets/diamond_plan.jpg',
                gradientTagIsVisible: true,
                gradientTagText: "Money Saver",
              ),

              // LayoutBuilder(
              //   builder: (context, constraints) {
              //     return Column(
              //       children: scheduleData.map((schedule) {
              //         return Padding(
              //           padding: EdgeInsets.only(bottom: 14.h),
              //           child: const PurchasePlanCard(
              //             planName: 'Gold Plan',
              //             originalPrice: 3999,
              //             discountedPrice: 2999,
              //             discountPercentage: 20,
              //             classesPerMonth: 25,
              //             imagePath: 'assets/gold_plan.png',
              //           ),
              //         );
              //       }).toList(),
              //     );
              //   },
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
