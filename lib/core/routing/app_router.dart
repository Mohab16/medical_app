import 'package:flutter/material.dart';
import 'package:medical_app/core/routing/routes.dart';
import 'package:medical_app/features/home/onboarding/onboarding_screen.dart';
import 'package:medical_app/features/home/ui/screens/login_screen.dart';

class AppRouter {
  Route generateRoute(RouteSettings settings) {
    //This arguments to be passed in any screen like this (arguments as ClassName)
    // ignore: unused_local_variable
    final arguments=settings.arguments;
    switch (settings.name) {
      case Routes.onBoardingScreen:
        return MaterialPageRoute(builder: (_) => OnboardingScreen());
      case Routes.loginScreen:
        return MaterialPageRoute(builder: (_) => LoginScreen());
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(child: Text('No route defined for ${settings.name}')),
          ),
        );
    }
  }
}
