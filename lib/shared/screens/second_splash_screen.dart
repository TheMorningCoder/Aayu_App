import 'package:flutter/material.dart';
import 'package:aayu_app/shared/components/white_button.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SecondSplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF82553a),
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
              crossAxisAlignment:
                  CrossAxisAlignment.stretch, // Ensures full width
              children: [
                Text('Book Your Flow :',
                    style: TextStyle(
                      color: Color(0xFFD8CAC2),
                      fontSize: 31.sp, // Adjust font size to match
                      fontWeight: FontWeight.w900,
                    ),
                    textAlign: TextAlign.center),
                Text('Pilates Made Easy',
                    style: TextStyle(
                      color: Color(0xFFD8CAC2),
                      fontSize: 31.sp,
                      fontWeight: FontWeight.w900,
                    ),
                    textAlign: TextAlign.center),
                SizedBox(height: 10.h),
                Text(
                  'Start your fitness journey with us, schedule classes daily and hit the gym.',
                  style: TextStyle(
                    color: Color(0xFFD8CAC2),
                    fontSize: 14.sp,
                    height: 1.5,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 30.h),
                WhiteButton(
                  height: ScreenUtil().screenHeight * 0.06,
                  width: double.infinity,
                  text: 'Continue to Login',
                  onPressed: () {
                    // TODO: Handle login navigation
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
