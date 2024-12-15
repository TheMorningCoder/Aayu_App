import 'package:aayu_app/core/themes/app_colors.dart';
import 'package:aayu_app/shared/components/primary_button.dart';
import 'package:aayu_app/shared/components/primary_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class ResetPasswordScreen extends StatelessWidget {
  const ResetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController passwordController = TextEditingController();
    final TextEditingController confirmPasswordController =
        TextEditingController();
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.primaryWhiteColor,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: AppColors.primaryWhiteColor,
          title: Text(
            "Reset Password",
            style: GoogleFonts.poppins(
              fontSize: 20.sp,
              color: AppColors.titleHeadingColor,
              fontStyle: FontStyle.normal,
              fontWeight: FontWeight.w600,
              height: 1.3,
            ),
          ),
        ),
        bottomNavigationBar: Padding(
          padding: EdgeInsets.only(bottom: 10.h, left: 5.w, right: 5.w),
          child: PrimaryButton(
            text: 'Confirm',
            onPressed: () {},
            width: double.infinity,
            height: 50.h,
            fontSize: 16.sp,
            buttonColor: AppColors.primaryBrownColor,
            buttonTextColor: AppColors.primaryWhiteColor,
          ),
        ),
        body: Container(
          margin: EdgeInsets.fromLTRB(20.w, 10.h, 10.w, 10.h),
          child: Column(
            children: [
              SizedBox(height: 10.h),
              SizedBox(height: 10.h),
              Text(
                'Set your new password and start your fitness journey',
                style: GoogleFonts.poppins(
                  fontSize: 14.sp,
                  color: AppColors.bodyNeutralColor,
                  fontStyle: FontStyle.normal,
                  height: 1.5,
                ),
                textAlign: TextAlign.left,
              ),
              SizedBox(height: 50.h),
              PrimaryTextField(
                label: "Password",
                hintText: 'Enter Password',
                controller: passwordController,
              ),
              SizedBox(height: 40.h),
              PrimaryTextField(
                label: "Confirm Password",
                hintText: 'Re-enter Password',
                controller: confirmPasswordController,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
