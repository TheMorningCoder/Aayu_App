import 'package:flutter/material.dart';

class SecondSplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF82553a),
      body: Stack(
        children: [
          Center(
            child: Image.asset(
              'assets/aayu_logo_white.png',
              width: 150,
              height: 150,
            ),
          ),
          Positioned(
            bottom: 100,
            left: 20,
            right: 20,
            child: Column(
              children: [
                Text(
                  'Book Your Flow : Pilates Made Easy',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 10),
                Text(
                  'Start your fitness journey with us, schedule classes daily and hit the gym.',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 30),
                CustomButton(
                  text: 'Continue to Login',
                  onPressed: () {
                    // TODO: Navigate to login screen or perform any action
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// Reusable Button Widget
class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  const CustomButton({
    Key? key,
    required this.text,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.white, // White button color as per screenshot
        padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10), // Rounded button
        ),
      ),
      child: Text(
        text,
        style: TextStyle(
          fontSize: 18,
          color: Colors.brown,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
