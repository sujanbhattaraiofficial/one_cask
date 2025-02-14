// presentation/pages/auth/sign_in/sign_in_controller.dart
import 'package:flutter/material.dart';
import 'package:one_cask/core/constants/route_names.dart';

class SignInController {
  static void navigateToRecoverPassword(BuildContext context) {
    Navigator.pushNamed(context, RouteNames.recoverPassword);
  }

  static void navigateToHome(BuildContext context) {
    Navigator.pushReplacementNamed(context, RouteNames.home);
  }
}
