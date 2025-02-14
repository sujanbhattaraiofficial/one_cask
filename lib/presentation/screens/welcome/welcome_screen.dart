// presentation/pages/welcome/welcome_screen.dart
import 'package:flutter/material.dart';
import 'package:one_cask/core/themes/app_theme.dart';
import 'welcome_controller.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background with fade overlay
          _buildBackgroundWithFade(context),
          // Content Card positioned slightly above bottom
          Positioned(
            bottom: 24, // Adjusted from 0 to 24
            left: 16,
            right: 16,
            child: _buildCardContent(context),
          ),
        ],
      ),
    );
  }

  Widget _buildBackgroundWithFade(BuildContext context) {
    return Stack(
      children: [
        // Container(
        //   decoration: const BoxDecoration(
        //     image: DecorationImage(
        //       image: AssetImage('assets/images/welcome_bg.png'),
        //       fit: BoxFit.cover,
        //     ),
        //   ),
        // ),
        Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.bottomCenter,
              end: Alignment.center,
              colors: [
                Theme.of(context).colorScheme.background.withOpacity(0.9),
                Colors.transparent,
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildCardContent(BuildContext context) {
    return Material(
      borderRadius: BorderRadius.circular(16),
      elevation: 8,
      child: Container(
        padding: const EdgeInsets.all(24).copyWith(bottom: 32),
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.surface,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 16,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            _buildWelcomeText(context),
            const SizedBox(height: 24),
            _buildScanButton(context),
            const SizedBox(height: 16),
            _buildSignInPrompt(context),
          ],
        ),
      ),
    );
  }

  Widget _buildWelcomeText(BuildContext context) {
    return Column(
      children: [
        Text(
          'Welcome!',
          style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                color: Theme.of(context).colorScheme.onSurface,
                fontWeight: FontWeight.bold,
              ),
        ),
        const SizedBox(height: 8),
        Text(
          'Text text text',
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: Theme.of(context).colorScheme.onSurface.withOpacity(0.8),
              ),
        ),
      ],
    );
  }

  Widget _buildScanButton(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Theme.of(context).colorScheme.primary,
          padding: const EdgeInsets.symmetric(vertical: 16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        onPressed: () => WelcomeScreenController.navigateToScan(context),
        child: Text(
          'Scan bottle',
          style: Theme.of(context).textTheme.labelLarge?.copyWith(
                color: Theme.of(context).colorScheme.onPrimary,
                fontWeight: FontWeight.w600,
              ),
        ),
      ),
    );
  }

  Widget _buildSignInPrompt(BuildContext context) {
    return GestureDetector(
      onTap: () => WelcomeScreenController.navigateToSignIn(context),
      child: RichText(
        text: TextSpan(
          text: 'Have an account? ',
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: Theme.of(context).colorScheme.onSurface.withOpacity(0.8),
              ),
          children: [
            TextSpan(
              text: 'Sign in first',
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: Theme.of(context).colorScheme.primary,
                    fontWeight: FontWeight.w600,
                    decoration: TextDecoration.underline,
                  ),
            )
          ],
        ),
      ),
    );
  }
}
