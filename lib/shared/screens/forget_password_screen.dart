import 'package:aayu_app/core/routes/routes.dart';
import 'package:aayu_app/core/themes/app_colors.dart';
import 'package:aayu_app/shared/components/primary_button.dart';
import 'package:aayu_app/shared/components/primary_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class ForgetPasswordScreen extends StatelessWidget {
  const ForgetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController emailController = TextEditingController();
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.primaryWhiteColor,
        appBar: AppBar(
          title: Text(
            "Forget Password",
            style: GoogleFonts.poppins(
              fontSize: 20.sp,
              color: AppColors.titleHeadingColor,
              fontStyle: FontStyle.normal,
              fontWeight: FontWeight.w600,
              height: 1.3,
            ),
          ),
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.chevron_left,
              size: 32.sp,
              color: AppColors.titleHeadingColor,
            ),
          ),
          backgroundColor: AppColors.primaryWhiteColor,
        ),
        bottomNavigationBar: Padding(
          padding: EdgeInsets.only(bottom: 10.h, left: 5.w, right: 5.w),
          child: PrimaryButton(
            text: 'Verify Email',
            onPressed: () {
              Navigator.pushNamed(context, Routes.resetPasswordScreen);
            },
            width: double.infinity,
            height: 50.h,
            buttonColor: AppColors.primaryBrownColor,
            buttonTextColor: AppColors.primaryWhiteColor,
          ),
        ),
        body: Container(
          margin: EdgeInsets.fromLTRB(20.w, 10.h, 10.w, 10.h),
          child: Column(
            children: [
              SizedBox(height: 10.h),
              Text(
                'Enter your registered email address in order to receive a one-time password (OTP) for resetting your password.',
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
                label: "Email",
                hintText: 'Enter Email',
                controller: emailController,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
