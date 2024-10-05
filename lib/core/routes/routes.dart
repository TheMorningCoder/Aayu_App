import 'package:aayu_app/shared/screens/first_splash_screen.dart';
import 'package:aayu_app/shared/screens/second_splash_screen.dart';
import 'package:flutter/material.dart';

// Define the route names as constants
class Routes {
  static const String firstSplash = '/first-splash';
  static const String secondSplash = '/second-splash';
  static const String adminDashboard = '/admin-dashboard';
  static const String userDashboard = '/user-dashboard';
}

// Configure the route map
class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.firstSplash:
        return MaterialPageRoute(builder: (_) => FirstSplashScreen());

      case Routes.secondSplash:
        return MaterialPageRoute(builder: (_) => SecondSplashScreen());

      // case Routes.adminDashboard:
      //   return MaterialPageRoute(builder: (_) => AdminDashboardScreen());

      // case Routes.userDashboard:
      //   return MaterialPageRoute(builder: (_) => UserDashboardScreen());

      default:
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(
      builder: (_) {
        return Scaffold(
          appBar: AppBar(
            title: Text('Error'),
          ),
          body: Center(
            child: Text('Route not found!'),
          ),
        );
      },
    );
  }
}
