import 'package:aayu_app/core/themes/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CombinedWidget extends StatelessWidget {
  const CombinedWidget({
    super.key,
    required this.simpleText,
    required this.hyperLinkText,
    required this.onHyperLinkClick,
  });
  final String simpleText;
  final String hyperLinkText;
  final Function() onHyperLinkClick;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          simpleText,
          style: TextStyle(
            color: AppColors.bodyNeutralColor,
            fontSize: 12.sp,
          ),
        ),
        TextButton(
          onPressed: onHyperLinkClick,
          child: Text(
            hyperLinkText,
            style: TextStyle(
              color: AppColors.blueLinkColor,
              fontSize: 12.sp,
              decoration: TextDecoration.underline,
              decorationColor: AppColors.blueLinkColor,
            ),
          ),
        ),
      ],
    );
  }
}
