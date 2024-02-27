import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mvvm_architecture/model/user_model.dart';
import 'package:flutter_mvvm_architecture/utils/routes/routes_name.dart';
import 'package:flutter_mvvm_architecture/view_model/user_view_model.dart';

class SplashServices {
  Future<UserModel> getUser() => UserViewModel().getUser();

  void checkAuthentication(BuildContext context) {
    getUser().then((value) async {
      await Future.delayed(const Duration(seconds: 3));
      if (value.token == null || value.token == '') {
        Navigator.pushReplacementNamed(context, RouteNames.login);
      } else {
        Navigator.pushReplacementNamed(context, RouteNames.home);
      }
    }).onError((error, stackTrace) {
      if (kDebugMode) {
        print(error.toString());
      }
    });
  }
}
