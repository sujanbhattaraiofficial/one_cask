// presentation/pages/splash/splash_screen.dart
import 'package:flutter/material.dart';
import 'splash_controller.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    SplashScreenController.init(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _buildAppTitle(context),
            const SizedBox(height: 16),
            _buildSubtitle(context),
          ],
        ),
      ),
    );
  }

  Widget _buildAppTitle(BuildContext context) {
    return RichText(
      text: TextSpan(
        children: [
          TextSpan(
            text: 'ONE',
            style: TextStyle(
              fontSize: 42,
              fontWeight: FontWeight.bold,
              color: Theme.of(context).colorScheme.primary,
              letterSpacing: 2.0,
            ),
          ),
          TextSpan(
            text: ' CASK',
            style: TextStyle(
              fontSize: 42,
              fontWeight: FontWeight.bold,
              color: Theme.of(context).colorScheme.secondary,
              letterSpacing: 2.0,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSubtitle(BuildContext context) {
    return Text(
      'At a time',
      style: TextStyle(
        fontSize: 18,
        color: Theme.of(context).colorScheme.onBackground.withOpacity(0.8),
        letterSpacing: 1.2,
      ),
    );
  }
}
