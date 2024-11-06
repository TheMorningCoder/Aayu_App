import 'dart:math';

import 'package:aayu_app/core/routes/routes.dart';
import 'package:aayu_app/core/themes/app_colors.dart';
import 'package:aayu_app/shared/components/combined_widget.dart';
import 'package:aayu_app/shared/components/primary_button.dart';
import 'package:aayu_app/shared/components/primary_textfield.dart';
import 'package:aayu_app/shared/providers/signup_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import 'dart:developer' as developer;

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController captchaController = TextEditingController();
  String captchaString = '';
  bool isVerified = false;
  bool captchaError = false;
  @override
  void initState() {
    super.initState();
    buildCaptcha();
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  void buildCaptcha() {
    const letters =
        "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890";
    const length = 6;
    final random = Random();
    setState(() {
      captchaString = String.fromCharCodes(
        List.generate(
          length,
          (index) => letters.codeUnitAt(
            random.nextInt(letters.length),
          ),
        ),
      );
    });
    developer.log("the random string is $captchaString");
  }

  void checkCaptcha() {
    setState(() {
      isVerified = captchaController.text == captchaString;
      developer.log("isVerified=$isVerified");
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        resizeToAvoidBottomInset: true,
        body: Consumer<SignUpProvider>(
          builder: (context, loginProvider, child) {
            return SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.fromLTRB(16.w, 40.h, 16.w, 2.h),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      'Sign Up',
                      style: GoogleFonts.poppins(
                        fontSize: 20.sp,
                        color: AppColors.titleHeadingColor,
                        fontStyle: FontStyle.normal,
                        fontWeight: FontWeight.w600,
                        height: 1.3,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 8.h),
                    Text(
                      "Let's start your fitness journey",
                      style: GoogleFonts.poppins(
                        fontSize: 14.sp,
                        color: AppColors.bodyNeutralColor,
                        fontStyle: FontStyle.normal,
                        height: 1.5,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 32.h),
                    PrimaryTextField(
                      label: 'Email',
                      hintText: 'Enter Email',
                      controller: emailController,
                    ),
                    SizedBox(height: 16.h),
                    PrimaryTextField(
                      label: 'Password',
                      hintText: 'Enter Password',
                      obscureText: true,
                      controller: passwordController,
                      showEyeIcon: true,
                    ),
                    SizedBox(height: 16.h),
                    // CAPTCHA section
                    Row(
                      children: [
                        Expanded(
                          flex: 1,
                          child: Container(
                            padding: EdgeInsets.all(8),
                            color: AppColors.captchaBoxColor,
                            child: Text(
                              captchaString,
                              style: GoogleFonts.shadowsIntoLight(
                                fontSize: 24.sp,
                                letterSpacing: 3.sp,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                        SizedBox(width: 10.w),
                        Expanded(
                          flex: 1,
                          child: TextField(
                            controller: captchaController,
                            decoration: InputDecoration(
                              hintText: 'Enter Captcha',
                              hintStyle: GoogleFonts.poppins(
                                color: AppColors.bodyNeutralColor,
                                height: 1.5,
                                fontSize: 14.sp,
                              ),
                              fillColor: AppColors.textFieldColor,
                              filled: true,
                              border: InputBorder.none,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 16.h),
                    if (captchaError)
                      Text(
                        'Invalid Captcha',
                        style: TextStyle(
                          color: Colors.red,
                          fontSize: 12.sp,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    SizedBox(height: 16.h),
                    PrimaryButton(
                      text: 'Sign Up',
                      onPressed: () {
                        if (isVerified) {
                          developer.log("Captcha is correct");
                          developer.log("Can Proceed Further");
                        } else {
                          setState(() {
                            captchaError = true;
                          });
                          developer.log("Captcha is not correct");
                          developer.log("Can not Proceed Further");

                          Future.delayed(const Duration(seconds: 2), () {
                            setState(() {
                              captchaError = false;
                              captchaController.text = '';
                            });

                            buildCaptcha(); // Call the function to generate a new captcha
                          });
                        }
                      },
                      width: double.infinity,
                      height: 50.h,
                      buttonColor: AppColors.primaryBrownColor,
                      buttonTextColor: AppColors.primaryWhiteColor,
                    ),
                    SizedBox(height: 20.h),
                    Row(
                      children: [
                        Expanded(child: Divider(thickness: 1.w)),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 8.w),
                          child: Text('Or Sign Up with'),
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
                    SizedBox(height: 20.h),
                    CombinedWidget(
                      simpleText: "Already have an account?",
                      hyperLinkText: 'Login',
                      onHyperLinkClick: () {
                        Navigator.pushNamed(context, Routes.loginScreen);
                      },
                    ),
                    CombinedWidget(
                      simpleText: "Sign up to agree to",
                      hyperLinkText: 'Terms & Conditions',
                      onHyperLinkClick: () {
                        Navigator.pushNamed(context, Routes.loginScreen);
                      },
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
