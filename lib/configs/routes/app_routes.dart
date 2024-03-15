import 'package:flutter/material.dart';
import 'package:flutter_mvvm_architecture/configs/routes/routes_name.dart';
import 'package:flutter_mvvm_architecture/view/home/home_view.dart';
import 'package:flutter_mvvm_architecture/view/auth/login_view.dart';
import 'package:flutter_mvvm_architecture/view/auth/sign_up_view.dart';
import 'package:flutter_mvvm_architecture/view/splash/splash_view.dart';

class AppRoutes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouteNames.splash:
        return MaterialPageRoute(
          builder: (context) => const SplashView(),
        );
      case RouteNames.login:
        return MaterialPageRoute(
          builder: (context) => const LoginView(),
        );
      case RouteNames.signUp:
        return MaterialPageRoute(
          builder: (context) => const SignUpView(),
        );
      case RouteNames.home:
        return MaterialPageRoute(
          builder: (context) => const HomeView(),
        );
      default:
        return MaterialPageRoute(
          builder: (context) => const Scaffold(
            body: Center(
              child: Text('OOPs Something went wrong'),
            ),
          ),
        );
    }
  }
}
