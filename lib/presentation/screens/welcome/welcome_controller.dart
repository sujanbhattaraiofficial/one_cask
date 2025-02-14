// presentation/pages/welcome/welcome_screen_controller.dart
import 'package:flutter/material.dart';
import 'package:one_cask/core/constants/route_names.dart';

class WelcomeScreenController {
  static void navigateToScan(BuildContext context) {
    Navigator.pushNamed(context, RouteNames.scan);
  }

  static void navigateToSignIn(BuildContext context) {
    Navigator.pushNamed(context, RouteNames.signIn);
  }
}
