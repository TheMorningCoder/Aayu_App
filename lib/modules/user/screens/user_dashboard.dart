import 'package:aayu_app/shared/providers/signup_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class UserDashboard extends StatefulWidget {
  const UserDashboard({super.key});

  @override
  State<UserDashboard> createState() => _UserDashboardState();
}

class _UserDashboardState extends State<UserDashboard> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        resizeToAvoidBottomInset: true,
        body:
            Consumer<SignUpProvider>(builder: (context, signupProvider, child) {
          return SingleChildScrollView(
            child: Container(
              child: Column(
                children: [
                  Text("User Dashboard"),
                ],
              ),
            ),
          );
        }),
      ),
    );
  }
}
