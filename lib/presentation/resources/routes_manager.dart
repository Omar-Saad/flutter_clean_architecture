import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/presentation/forgot_password/forgot_password.dart';
import 'package:flutter_clean_architecture/presentation/onboarding/onboarding.dart';
import 'package:flutter_clean_architecture/presentation/resources/strings_manager.dart';
import 'package:flutter_clean_architecture/presentation/splash/splash.dart';
import 'package:flutter_clean_architecture/presentation/store_details/store_details.dart';

import '../login/login.dart';
import '../main/main_screen.dart';
import '../register/register.dart';

class RoutesManager {
  static const String splash = "/splash";
  static const String onBoarding = "/onBoarding";
  static const String login = "/login";
  static const String register = "/register";
  static const String forgotPassword = "/forgotPassword";
  static const String main = "/main";
  static const String storeDetails = "/storeDetails";
}

class RouteGenerator {
  static Route<dynamic> getRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case RoutesManager.splash:
        return MaterialPageRoute(builder: (_) => const SplashScreen());
      case RoutesManager.onBoarding:
        return MaterialPageRoute(builder: (_) => const OnBoardingScreen());
      case RoutesManager.login:
        return MaterialPageRoute(builder: (_) => const LoginScreen());
      case RoutesManager.register:
        return MaterialPageRoute(builder: (_) => const RegisterScreen());
      case RoutesManager.forgotPassword:
        return MaterialPageRoute(builder: (_) => const ForgotPasswordScreen());
      case RoutesManager.main:
        return MaterialPageRoute(builder: (_) => const MainScreen());
      case RoutesManager.storeDetails:
        return MaterialPageRoute(builder: (_) => const StoreDetailsScreen());
      default:
        return unDefinedRoute();
    }
  }

  static Route<dynamic> unDefinedRoute() {
    return MaterialPageRoute(
        builder: (_) => Scaffold(
              appBar: AppBar(title: const Text(AppStrings.noRouteFound)),
              body: const Center(child: Text(AppStrings.noRouteFound)),
            ));
  }
}
