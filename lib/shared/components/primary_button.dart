import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PrimaryButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final double width;
  final double height;
  final Color buttonColor;
  final Color buttonTextColor;

  const PrimaryButton({
    Key? key,
    required this.text,
    required this.onPressed,
    required this.width,
    required this.height,
    required this.buttonColor,
    required this.buttonTextColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: buttonColor,
          borderRadius: BorderRadius.circular(5),
          border: Border.all(
            color: Colors.grey,
          ),
        ),
        alignment: Alignment.center,
        child: Text(
          text,
          style: TextStyle(
            fontSize: 16.sp,
            color: buttonTextColor,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}
