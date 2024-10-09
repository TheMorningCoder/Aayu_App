import 'package:aayu_app/core/themes/app_colors.dart';
import 'package:aayu_app/shared/components/primary_button.dart';
import 'package:aayu_app/shared/components/primary_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginScreen extends StatelessWidget {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.fromLTRB(16.w, 60.h, 16.w, 10.h),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  'Login',
                  style: TextStyle(
                    fontSize: 26.sp,
                    fontWeight: FontWeight.w500,
                    color: AppColors.titleHeadingColor,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 8.h),
                Text(
                  'Hi welcome back, you’ve been missed',
                  style: TextStyle(
                    fontSize: 14.sp,
                    color: AppColors.bodyNeutralColor,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 32.h),
                PrimaryTextField(
                  label: 'Username',
                  hintText: 'Enter Username',
                  controller: usernameController,
                ),
                SizedBox(height: 16.h),
                PrimaryTextField(
                  label: 'Password',
                  hintText: 'Enter Password',
                  obscureText: true,
                  controller: passwordController,
                ),
                SizedBox(height: 16.h),
                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    onPressed: () {
                      // Handle forgot password action
                    },
                    child: Text(
                      'Forgot Password',
                      style: TextStyle(
                        color: AppColors.bodyNeutralColor,
                        fontSize: 12.sp,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 16.h),
                PrimaryButton(
                  text: 'Login',
                  onPressed: () {
                    // Handle login action
                  },
                  width: double.infinity,
                  height: 50.h,
                  buttonColor: AppColors.primaryBrownColor,
                  buttonTextColor: AppColors.primaryWhiteColor,
                ),
                SizedBox(height: 32.h),
                Row(
                  children: [
                    Expanded(child: Divider(thickness: 1.w)),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 8.w),
                      child: Text('Or Login with'),
                    ),
                    Expanded(child: Divider(thickness: 1.w)),
                  ],
                ),
                SizedBox(height: 16.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: () {
                        // Handle Apple login
                      },
                      child: Image.asset(
                        'assets/apple_logo.png',
                        width: 50.w,
                        height: 50.h,
                      ),
                    ),
                    SizedBox(width: 16.w),
                    GestureDetector(
                      onTap: () {
                        // Handle Google login
                      },
                      child: Image.asset(
                        'assets/google_logo.png',
                        width: 50.w,
                        height: 50.h,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 32.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Nowhere?",
                        style: TextStyle(
                          color: AppColors.bodyNeutralColor,
                          fontSize: 12.sp,
                        )),
                    TextButton(
                      onPressed: () {
                        // Handle sign-up action
                      },
                      child: Text(
                        'Sign Up',
                        style: TextStyle(
                          color: AppColors.blueLinkColor,
                          fontSize: 12.sp,
                          decoration: TextDecoration.underline,
                          decorationColor: AppColors.blueLinkColor,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
