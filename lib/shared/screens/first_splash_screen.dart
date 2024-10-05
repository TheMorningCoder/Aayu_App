import 'package:flutter/material.dart';
import 'second_splash_screen.dart';

class FirstSplashScreen extends StatefulWidget {
  @override
  _FirstSplashScreenState createState() => _FirstSplashScreenState();
}

class _FirstSplashScreenState extends State<FirstSplashScreen> {
  @override
  void initState() {
    super.initState();

    // Navigate to the second splash screen after 2 seconds
    Future.delayed(Duration(seconds: 2), () {
      Navigator.pushReplacement(context,
          MaterialPageRoute(builder: (context) => SecondSplashScreen()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Image.asset(
          'assets/aayu_logo_brown.jpg',
          width: 200,
          height: 200,
        ),
      ),
    );
  }
}
