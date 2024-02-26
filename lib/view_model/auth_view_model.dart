import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mvvm_architecture/repositry/auth_reposirty.dart';
import 'package:flutter_mvvm_architecture/utils/routes/routes_name.dart';
import 'package:flutter_mvvm_architecture/utils/utils.dart';

class AuthViewModel extends ChangeNotifier {
  final _authRepo = AuthRepositry();

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  void setLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  Future loginApi(BuildContext context, dynamic data) async {
    setLoading(true);
    _authRepo.loginApi(data).then(
      (value) {
        if (kDebugMode) {
          print(value);
        }
        setLoading(false);
        Utils.toastMessage('Login Successful');
        Navigator.pushReplacementNamed(context, RoutesName.home);
      },
    ).onError(
      (error, stackTrace) {
        setLoading(false);
        Utils.snackBar(
          context,
          error.toString(),
        );
      },
    );
  }

  Future registerApi(BuildContext context, dynamic data) async {
    setLoading(true);
    _authRepo.loginApi(data).then(
      (value) {
        if (kDebugMode) {
          print(value);
        }
        setLoading(false);
        Utils.toastMessage('SignUp Successful');
        Navigator.pushReplacementNamed(context, RoutesName.home);
      },
    ).onError(
      (error, stackTrace) {
        setLoading(false);
        Utils.snackBar(
          context,
          error.toString(),
        );
      },
    );
  }
}
