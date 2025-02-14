// presentation/pages/splash/splash_screen_controller.dart
import 'package:flutter/material.dart';
import 'package:one_cask/core/constants/route_names.dart';

class SplashScreenController {
  static void init(BuildContext context) {
    Future.delayed(const Duration(seconds: 2), () {
      _navigateToHome(context);
    });
  }

  static void _navigateToHome(BuildContext context) {
    Navigator.pushReplacementNamed(context, RouteNames.welcome);
  }
}
