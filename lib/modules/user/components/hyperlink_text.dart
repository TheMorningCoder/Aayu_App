import 'package:aayu_app/core/themes/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HyperlinkText extends StatelessWidget {
  const HyperlinkText({
    super.key,
    required this.text,
  });
  final String text;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {},
      child: Text(
        text,
        style: TextStyle(
          fontSize: 12.sp,
          fontWeight: FontWeight.normal,
          color: AppColors.blueLinkColor,
          decoration: TextDecoration.underline,
          decorationColor: AppColors.blueLinkColor,
        ),
      ),
    );
  }
}
