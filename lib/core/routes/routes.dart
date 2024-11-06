import 'package:aayu_app/modules/user/screens/user_dashboard.dart';
import 'package:aayu_app/shared/screens/first_splash_screen.dart';
import 'package:aayu_app/shared/screens/forget_password_screen.dart';
import 'package:aayu_app/shared/screens/login_screen.dart';
import 'package:aayu_app/shared/screens/reset_password_screen.dart';
import 'package:aayu_app/shared/screens/second_splash_screen.dart';
import 'package:aayu_app/shared/screens/signup_screen.dart';
import 'package:flutter/material.dart';

// Define the route names as constants
class Routes {
  static const String firstSplash = '/first-splash';
  static const String secondSplash = '/second-splash';
  static const String loginScreen = '/login-screen';
  static const String forgetPasswordScreen = '/forget-password-screen';
  static const String resetPasswordScreen = '/reset-password-screen';
  static const String signUpScreen = '/signup-screen';
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

      case Routes.loginScreen:
        return MaterialPageRoute(builder: (_) => const LoginScreen());

      case Routes.forgetPasswordScreen:
        return MaterialPageRoute(builder: (_) => const ForgetPasswordScreen());

      case Routes.resetPasswordScreen:
        return MaterialPageRoute(builder: (_) => const ResetPasswordScreen());

      case Routes.signUpScreen:
        return MaterialPageRoute(builder: (_) => const SignUpScreen());

      case Routes.userDashboard:
        return MaterialPageRoute(builder: (_) => const UserDashboard());

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
