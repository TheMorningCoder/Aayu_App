import 'package:aayu_app/core/routes/routes.dart';
import 'package:aayu_app/core/themes/app_colors.dart';
import 'package:aayu_app/shared/providers/login_providers.dart';
import 'package:aayu_app/shared/providers/signup_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => LoginProvider()),
        ChangeNotifierProvider(create: (_) => SignUpProvider()),
      ],
      child: ScreenUtilInit(
        designSize: const Size(360, 690),
        builder: (context, child) {
          return MaterialApp(
            title: 'Pilates Booking App',
            theme: ThemeData(
              textTheme: GoogleFonts.poppinsTextTheme(),
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
      ),
    );
  }
}
//6LeLIXQqAAAAAFMZwLNhPFKE53kQ6ju0q_o6HSoK
