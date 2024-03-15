import 'package:flutter/material.dart';
import 'package:flutter_mvvm_architecture/configs/routes/routes_name.dart';
import 'package:flutter_mvvm_architecture/configs/utils.dart';
import 'package:flutter_mvvm_architecture/repositry/auth_api/auth_reposirty.dart';
import 'package:flutter_mvvm_architecture/view_model/services/session_manager/session_controller.dart';

class AuthViewModel extends ChangeNotifier {
  final _authRepo = AuthRepository();
  bool _isLoading = false;
  bool get isLoading => _isLoading;

  void setLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  Future _handleApiCall(
    BuildContext context,
    dynamic data,
    Future Function(dynamic) apiCall,
    String successMessage,
  ) async {
    setLoading(true);
    apiCall(data).then(
      (user) {
        debugPrint(user.toString());
        setLoading(false);
        Utils.toastMessage(successMessage);
        SessionController().saveUserInPreference(data);

        Navigator.pushNamedAndRemoveUntil(
          context,
          RouteNames.home,
          (route) => false,
        );
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

  Future loginApi(BuildContext context, dynamic data) async {
    _handleApiCall(context, data, _authRepo.loginApi, 'Login Successful');
  }

  Future registerApi(BuildContext context, dynamic data) async {
    _handleApiCall(context, data, _authRepo.registerApi, 'SignUp Successful');
  }
}
