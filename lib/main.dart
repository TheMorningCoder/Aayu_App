import 'package:aayu_app/core/routes/routes.dart';
import 'package:aayu_app/core/themes/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      builder: (context, child) {
        return MaterialApp(
          title: 'Pilates Booking App',
          theme: ThemeData(
            fontFamily: 'Poppins',
            colorScheme:
                ColorScheme.fromSeed(seedColor: AppColors.primaryBrownColor),
            useMaterial3: true,
          ),
          initialRoute:
              Routes.firstSplash, // Start with the first splash screen
          onGenerateRoute:
              RouteGenerator.generateRoute, // Use the route generator
        );
      },
    );
  }
}
