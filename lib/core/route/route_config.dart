// core/routes/route_config.dart
import 'package:flutter/material.dart';
import 'package:one_cask/core/constants/route_names.dart';
import 'package:one_cask/presentation/screens/auth/sign_in/sign_in_screen.dart';
import 'package:one_cask/presentation/screens/my_collection/my_collection_screen.dart';
import 'package:one_cask/presentation/screens/splash/splash_screen.dart';
import 'package:one_cask/presentation/screens/welcome/welcome_screen.dart';
// Import other pages

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouteNames.splash:
        return MaterialPageRoute(builder: (_) => const SplashScreen());
      case RouteNames.welcome:
        return MaterialPageRoute(builder: (_) {
          return WelcomeScreen();
        });
      case RouteNames.signIn:
        return MaterialPageRoute(builder: (_) {
          return SignInScreen();
        });
      case RouteNames.collection:
        return MaterialPageRoute(builder: (_) {
          return CollectionScreen();
        });
      // case RouteNames.home:
      //   return MaterialPageRoute(builder: (_) => const HomeScreen());
      // Add other routes
      default:
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (_) {
      return Scaffold(
        appBar: AppBar(title: const Text('Error')),
        body: const Center(child: Text('Page not found')),
      );
    });
  }

  static Map<String, WidgetBuilder> get routes => {
        RouteNames.splash: (context) => const SplashScreen(),
        // RouteNames.home: (context) => const HomeScreen(),
        // Add other named routes
      };
}
