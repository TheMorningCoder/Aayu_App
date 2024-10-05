import 'package:aayu_app/core/routes/routes.dart';
import 'package:flutter/material.dart';
import 'shared/screens/first_splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pilates Booking App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      initialRoute: Routes.firstSplash, // Start with the first splash screen
      onGenerateRoute: RouteGenerator.generateRoute, // Use the route generator
    );
  }
}
