import 'package:aayu_app/core/routes/routes.dart';
import 'package:aayu_app/core/themes/app_colors.dart';
import 'package:aayu_app/shared/components/combined_widget.dart';
import 'package:aayu_app/shared/components/primary_button.dart';
import 'package:aayu_app/shared/components/primary_textfield.dart';
import 'package:aayu_app/shared/providers/login_providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  void dispose() {
    usernameController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        resizeToAvoidBottomInset: true,
        body: Consumer<LoginProvider>(
          builder: (context, loginProvider, child) {
            return SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.fromLTRB(16.w, 60.h, 16.w, 10.h),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      'Login',
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
                      'Hi welcome back, you’ve been missed',
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
                      showEyeIcon: true,
                    ),
                    SizedBox(height: 16.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        if (loginProvider.errorMessage != null)
                          Text(
                            loginProvider.errorMessage!,
                            style: TextStyle(
                              color: Colors.red,
                              fontSize: 12.sp,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        TextButton(
                          onPressed: () {
                            Navigator.pushNamed(
                                context, Routes.forgetPasswordScreen);
                          },
                          child: Text(
                            'Forget Password',
                            style: TextStyle(
                              color: loginProvider.errorMessage != null
                                  ? AppColors.blueLinkColor
                                  : AppColors.bodyNeutralColor,
                              fontSize: 12.sp,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 16.h),
                    PrimaryButton(
                      text: loginProvider.isLoading ? 'Loading...' : 'Login',
                      onPressed: loginProvider.isLoading
                          ? () {
                              const CircularProgressIndicator();
                            }
                          : () {
                              loginProvider.login(
                                usernameController.text,
                                passwordController.text,
                              );
                              if (loginProvider.isLoggedIn == true) {
                                Navigator.popAndPushNamed(
                                    context, Routes.signUpScreen);
                              }
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
                    SizedBox(height: 28.h),
                    CombinedWidget(
                        simpleText: 'Nowhere?',
                        hyperLinkText: 'Sign Up',
                        onHyperLinkClick: () {
                          Navigator.pushNamed(context, Routes.signUpScreen);
                        }),
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
