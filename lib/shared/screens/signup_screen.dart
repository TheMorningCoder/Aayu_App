import 'package:aayu_app/core/routes/routes.dart';
import 'package:aayu_app/core/themes/app_colors.dart';
import 'package:aayu_app/shared/components/combined_widget.dart';
import 'package:aayu_app/shared/components/primary_button.dart';
import 'package:aayu_app/shared/components/primary_textfield.dart';
import 'package:aayu_app/shared/providers/signup_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'dart:developer' as developer;
import 'package:aayu_app/utils/validators.dart';

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
  bool errorIsPresent = false;
  String errorMessage = '';
  @override
  void initState() {
    super.initState();
    captchaString = buildCaptcha();
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    captchaController.dispose();
    super.dispose();
  }

  void refresh() {
    developer.log('Inside Refresh()');
    Future.delayed(const Duration(seconds: 2), () {
      setState(() {
        errorIsPresent = false;
        emailController.text = '';
        passwordController.text = '';
        captchaController.text = '';
        captchaString = buildCaptcha();
      });
    });
  }

  bool checkCaptcha() {
    return captchaController.text == captchaString;
  }

  void setErrorMessage(String error) {
    setState(() {
      errorIsPresent = true;
      errorMessage = error;
    });
  }

  bool isDataValid() {
    bool enteredDataIsCorrect = false;
    if (checkCaptcha()) {
      String? emailError = emailValidator(emailController.text);
      String? passwordError = passwordValidator(passwordController.text);
      if (emailError != null) {
        setErrorMessage(emailError);
        enteredDataIsCorrect = false;
        refresh();
      } else if (passwordError != null) {
        setErrorMessage(passwordError);
        enteredDataIsCorrect = false;
        refresh();
      } else if (emailError == null && passwordError == null) {
        enteredDataIsCorrect = true;
      }
    } else {
      setErrorMessage('Invalid Captcha');
      enteredDataIsCorrect = false;
      refresh();
    }
    return enteredDataIsCorrect;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        resizeToAvoidBottomInset: true,
        body: Consumer<SignUpProvider>(
          builder: (context, signupProvider, child) {
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
                    if (errorIsPresent)
                      Text(
                        errorMessage,
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
                        if (isDataValid()) {
                          Navigator.pushNamed(context, Routes.userDashboard);
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
                          child: const Text('Or Sign Up with'),
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
