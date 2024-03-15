import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_mvvm_architecture/configs/routes/routes_name.dart';
import 'package:flutter_mvvm_architecture/view_model/services/session_manager/session_controller.dart';

class SplashServices {
  void checkAuthentication(BuildContext context) async {
    SessionController().getUserFromPreference().then((value) async {
      if (SessionController().isLogin) {
        Timer(
          const Duration(seconds: 2),
          () => Navigator.pushNamedAndRemoveUntil(
              context, RouteNames.home, (route) => false),
        );
      } else {
        Timer(
          const Duration(seconds: 2),
          () => Navigator.pushNamedAndRemoveUntil(
              context, RouteNames.login, (route) => false),
        );
      }
    }).onError((error, stackTrace) {
      Timer(
        const Duration(seconds: 2),
        () => Navigator.pushNamedAndRemoveUntil(
            context, RouteNames.login, (route) => false),
      );
    });
  }
}
