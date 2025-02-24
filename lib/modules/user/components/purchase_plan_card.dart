import 'package:aayu_app/core/themes/app_colors.dart';
import 'package:aayu_app/modules/user/components/gradient_button.dart';
import 'package:aayu_app/modules/user/components/hyperlink_text.dart';
import 'package:aayu_app/shared/components/primary_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PurchasePlanCard extends StatefulWidget {
  final String planName;
  final int originalPrice;
  final int discountedPrice;
  final int discountPercentage;
  final int classesPerMonth;
  final String imagePath;
  final bool gradientTagIsVisible;
  final String gradientTagText;

  const PurchasePlanCard({
    super.key,
    required this.planName,
    required this.originalPrice,
    required this.discountedPrice,
    required this.discountPercentage,
    required this.classesPerMonth,
    required this.imagePath,
    required this.gradientTagText,
    required this.gradientTagIsVisible,
  });

  @override
  PurchasePlanCardState createState() => PurchasePlanCardState();
}

class PurchasePlanCardState extends State<PurchasePlanCard> {
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          isExpanded = !isExpanded;
        });
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
        padding: EdgeInsets.all(16.sp),
        margin: EdgeInsets.symmetric(vertical: 8.h, horizontal: 8.w),
        decoration: BoxDecoration(
          color: AppColors.purchaseCardColor,
          borderRadius: BorderRadius.circular(8.sp),
          boxShadow: const [
            BoxShadow(
              color: AppColors.bodyNeutralColor,
              spreadRadius: 1,
              blurRadius: 4,
            ),
          ],
        ),
        child: Row(
          children: [
            Image.asset(
              widget.imagePath,
              width: 50.w,
              height: 45.h,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.planName,
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 4.h),
                Text(
                  '${widget.classesPerMonth} classes in a month',
                  style: TextStyle(
                      fontSize: 12.sp, color: AppColors.bodyNeutralColor),
                ),
                SizedBox(height: 8.h),
                HyperlinkText(
                  text: "View Details",
                  onPressed: () {},
                ),
                SizedBox(height: 8.h),
                Row(
                  children: [
                    Text(
                      '₹${widget.originalPrice}',
                      style: TextStyle(
                        fontSize: 12.sp,
                        color: Colors.grey,
                        decoration: TextDecoration.lineThrough,
                      ),
                    ),
                    SizedBox(width: 8.w),
                    Text(
                      '₹${widget.discountedPrice}',
                      style: TextStyle(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.bold,
                          color: AppColors.titleHeadingColor),
                    ),
                    const SizedBox(width: 8.0),
                    Text(
                      '${widget.discountPercentage}% Off',
                      style: TextStyle(
                        fontSize: 12.sp,
                        color: AppColors.popupGreenColor,
                      ),
                    ),
                  ],
                ),
                if (isExpanded) ...[
                  SizedBox(height: 16.h),
                  PrimaryButton(
                      text: "Purchase Now",
                      onPressed: () {},
                      width: 120.w,
                      height: 40.h,
                      fontSize: 12.sp,
                      buttonColor: AppColors.primaryBrownColor,
                      buttonTextColor: AppColors.primaryWhiteColor)
                ],
              ],
            ),
            if (widget.gradientTagIsVisible)
              GradientButton(
                text: widget.gradientTagText,
              ),
          ],
        ),
      ),
    );
  }
}
