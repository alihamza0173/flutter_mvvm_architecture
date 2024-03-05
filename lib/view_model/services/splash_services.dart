import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mvvm_architecture/model/user_model.dart';
import 'package:flutter_mvvm_architecture/utils/routes/routes_name.dart';
import 'package:flutter_mvvm_architecture/view_model/user_view_model.dart';

class SplashServices {
  Future<UserModel> getUser() => UserViewModel().getUser();

  void checkAuthentication(BuildContext context) {
    getUser().then((value) async {
      debugPrint('token: ${value.token}, ${value.token.runtimeType}');
      await Future.delayed(const Duration(seconds: 2));
      if (value.token == null || value.token == '') {
        Navigator.pushNamedAndRemoveUntil(
          context,
          RouteNames.login,
          (route) => false,
        );
      } else {
        Navigator.pushNamedAndRemoveUntil(
          context,
          RouteNames.home,
          (route) => false,
        );
      }
    }).onError((error, stackTrace) {
      if (kDebugMode) {
        print(error.toString());
      }
    });
  }
}
