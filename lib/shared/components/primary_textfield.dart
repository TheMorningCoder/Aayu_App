import 'package:aayu_app/core/themes/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PrimaryTextField extends StatefulWidget {
  final String label;
  final String hintText;
  final bool obscureText;
  final bool showEyeIcon;
  final TextEditingController controller;

  const PrimaryTextField({
    Key? key,
    required this.label,
    required this.hintText,
    this.obscureText = false,
    this.showEyeIcon = false,
    required this.controller,
  }) : super(key: key);

  @override
  _PrimaryTextFieldState createState() => _PrimaryTextFieldState();
}

class _PrimaryTextFieldState extends State<PrimaryTextField> {
  late bool _obscureText;

  @override
  void initState() {
    super.initState();
    _obscureText = widget.obscureText;
  }

  void _togglePasswordVisibility() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.label,
          style: TextStyle(
              fontSize: 14.sp,
              fontWeight: FontWeight.w500,
              color: AppColors.titleHeadingColor),
        ),
        SizedBox(height: 8),
        TextField(
          controller: widget.controller,
          obscureText: _obscureText,
          decoration: InputDecoration(
            hintText: widget.hintText,
            hintStyle: TextStyle(color: AppColors.bodyNeutralColor),
            fillColor: AppColors.textFieldColor,
            filled: true,
            border: InputBorder.none,
            suffixIcon: widget.showEyeIcon && widget.obscureText
                ? IconButton(
                    icon: Icon(
                      _obscureText ? Icons.visibility_off : Icons.visibility,
                      color: AppColors.bodyNeutralColor,
                    ),
                    onPressed: _togglePasswordVisibility,
                  )
                : null,
          ),
        ),
      ],
    );
  }
}
