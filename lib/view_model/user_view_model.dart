import 'package:flutter/material.dart';
import 'package:flutter_mvvm_architecture/model/user_model.dart';
import 'package:flutter_mvvm_architecture/utils/routes/routes_name.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserViewModel with ChangeNotifier {
  // Key for storing user token in shared ref
  final key = 'token';

  Future<bool> saveUser(UserModel user) async {
    final SharedPreferences sp = await SharedPreferences.getInstance();
    sp.setString(key, user.token.toString());
    return true;
  }

  Future<UserModel> getUser() async {
    final SharedPreferences sp = await SharedPreferences.getInstance();
    final token = sp.getString(key);
    return UserModel(token: token);
  }

  Future<bool> remove() async {
    final SharedPreferences sp = await SharedPreferences.getInstance();
    sp.clear();
    return true;
  }

  Future<bool> logout(BuildContext context) async {
    final SharedPreferences sp = await SharedPreferences.getInstance();
    sp.clear().then((value) {
      Navigator.pushNamedAndRemoveUntil(
        context,
        RouteNames.login,
        (route) => false,
      );
    });
    return true;
  }
}
