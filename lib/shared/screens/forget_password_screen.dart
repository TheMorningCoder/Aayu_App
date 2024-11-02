import 'package:aayu_app/core/themes/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class ForgetPasswordScreen extends StatelessWidget {
  const ForgetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Row(
              children: [
                IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Icon(
                    Icons.chevron_left,
                    size: 32.sp,
                    color: AppColors.titleHeadingColor,
                  ),
                ),
                Text(
                  "Forget Password",
                  style: GoogleFonts.poppins(
                    fontSize: 20.sp,
                    color: AppColors.titleHeadingColor,
                    fontStyle: FontStyle.normal,
                    fontWeight: FontWeight.w600,
                    height: 1.3,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
