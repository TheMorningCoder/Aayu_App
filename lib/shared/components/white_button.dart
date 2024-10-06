import 'package:flutter/material.dart';

class WhiteButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final double width;
  final double height;

  const WhiteButton({
    Key? key,
    required this.text,
    required this.onPressed,
    required this.width,
    required this.height,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(5), // Rounded corners
          border: Border.all(
            color: Colors.grey, // Optional border styling
          ),
        ),
        alignment: Alignment.center,
        child: Text(
          text,
          style: TextStyle(
            fontSize: 18,
            color: Colors.brown,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
