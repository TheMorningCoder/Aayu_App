import 'package:aayu_app/core/themes/app_colors.dart';
import 'package:aayu_app/modules/user/components/reusable_card.dart';
import 'package:aayu_app/shared/components/primary_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ReferAndEarnCard extends StatelessWidget {
  const ReferAndEarnCard({super.key});

  @override
  Widget build(BuildContext context) {
    return ReusableCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Refer & Earn',
            style: TextStyle(
              fontSize: 16.sp,
              fontWeight: FontWeight.bold,
              color: AppColors.titleHeadingColor,
            ),
          ),
          SizedBox(height: 8.h),
          Text(
            'Refer your friends & family and Earn more number of classes',
            style: TextStyle(
              fontSize: 14.sp,
              color: AppColors.bodyNeutralColor,
            ),
          ),
          SizedBox(height: 16.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              PrimaryButton(
                  text: "Refer Now",
                  onPressed: () {},
                  width: 150.w,
                  height: 50.h,
                  buttonColor: AppColors.primaryBrownColor,
                  buttonTextColor: AppColors.primaryWhiteColor),
              Image.asset("assets/campaign.png"),
            ],
          ),
        ],
      ),
    );
  }
}
