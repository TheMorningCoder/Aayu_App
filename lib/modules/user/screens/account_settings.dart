import 'package:aayu_app/core/themes/app_colors.dart';
import 'package:aayu_app/modules/user/components/hyperlink_text.dart';
import 'package:aayu_app/modules/user/screens/popups/confirm_cancellation_popup.dart';
import 'package:aayu_app/modules/user/screens/popups/informational_popup.dart';
import 'package:aayu_app/shared/components/primary_button.dart';
import 'package:aayu_app/shared/components/primary_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AccountSettingsScreen extends StatefulWidget {
  const AccountSettingsScreen({super.key});

  @override
  _AccountSettingsScreenState createState() => _AccountSettingsScreenState();
}

class _AccountSettingsScreenState extends State<AccountSettingsScreen> {
  void logout(BuildContext context) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.clear(); // Remove stored user data
    Navigator.pushReplacementNamed(
        context, "/login-screen"); // Redirect to login
  }

  final TextEditingController nameController = TextEditingController();
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        resizeToAvoidBottomInset: true,
        appBar: AppBar(
          title: Text("Account Settings",
              style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w600)),
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back_ios_new,
              size: 16.sp,
            ), // Change to any icon
            onPressed: () {
              Navigator.pop(context); // Go back to the previous screen
            },
          ),
          backgroundColor: AppColors.primaryWhiteColor,
        ),
        body: SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.fromLTRB(15.w, 25.h, 15.w, 5.h),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                PrimaryTextField(
                  label: 'Name',
                  hintText: 'Enter Name',
                  controller: nameController,
                ),
                SizedBox(height: 16.h),
                PrimaryTextField(
                  label: 'Username',
                  hintText: 'Enter Username',
                  controller: usernameController,
                ),
                SizedBox(height: 16.h),
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
                HyperlinkText(
                  text: "Change Password",
                  onPressed: () {},
                ),
                SizedBox(height: 100.h),
                PrimaryButton(
                  text: "Delete Account",
                  onPressed: () {
                    showDialog(
                        context: context,
                        builder: (context) => ConfirmCancellationPopup(
                            heading: "Confirm Deletion",
                            firstDescription:
                                "You will lose all your exsiting class balance if you delete your accoun Once you delete, you have to recreate account to access again.",
                            secondDescription:
                                "Are you sure you want to deactivate?",
                            buttonText: "Delete Account",
                            onPressed: () {
                              Navigator.of(context).pop();
                              showDialog(
                                context: context,
                                builder: (context) => InformationalPopup(
                                  icon: Icons.cancel,
                                  iconColor: AppColors.redCancelButtonFontColor,
                                  heading: "Deleted!",
                                  description: "Your account is deleted",
                                  buttonText: "Go Back",
                                  onPressed: () {
                                    logout(context);
                                  },
                                ),
                              );
                            }));
                  },
                  width: double.infinity,
                  height: 48.h,
                  fontSize: 14.sp,
                  buttonColor: AppColors.primaryWhiteColor,
                  buttonTextColor: AppColors.primaryBrownColor,
                ),
                SizedBox(height: 16.h),
                PrimaryButton(
                  text: "Update Details ",
                  onPressed: () {},
                  width: double.infinity,
                  height: 48.h,
                  fontSize: 14.sp,
                  buttonColor: AppColors.primaryBrownColor,
                  buttonTextColor: AppColors.primaryWhiteColor,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
