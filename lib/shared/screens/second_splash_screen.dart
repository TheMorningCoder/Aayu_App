import 'package:aayu_app/core/routes/routes.dart';
import 'package:aayu_app/core/themes/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:aayu_app/shared/components/primary_button.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SecondSplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryBrownColor,
      body: Stack(
        children: [
          Positioned(
            bottom: 450,
            left: 20,
            right: 20,
            child: Image.asset(
              'assets/aayu_logo_white.png',
              height: 140.h,
              width: 130.w,
            ),
          ),
          Positioned(
            bottom: 10,
            left: 20,
            right: 20,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text('Book Your Flow :',
                    style: TextStyle(
                      color: AppColors.lighBeigeColor,
                      fontSize: 31.sp,
                      fontWeight: FontWeight.w900,
                    ),
                    textAlign: TextAlign.center),
                Text('Pilates Made Easy',
                    style: TextStyle(
                      color: AppColors.lighBeigeColor,
                      fontSize: 31.sp,
                      fontWeight: FontWeight.w900,
                    ),
                    textAlign: TextAlign.center),
                SizedBox(height: 10.h),
                Text(
                  'Start your fitness journey with us, schedule classes daily and hit the gym.',
                  style: TextStyle(
                    color: AppColors.lighBeigeColor,
                    fontSize: 14.sp,
                    height: 1.5,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 30.h),
                PrimaryButton(
                  height: ScreenUtil().screenHeight * 0.06,
                  width: double.infinity,
                  text: 'Continue to Login',
                  buttonColor: AppColors.primaryWhiteColor,
                  buttonTextColor: AppColors.primaryBrownColor,
                  onPressed: () {
                    Navigator.pushNamed(context, Routes.loginScreen);
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
