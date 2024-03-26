import 'package:flutter/material.dart';
import 'package:flutter_mvvm_architecture/model/users_list/user_model.dart';
import 'package:flutter_mvvm_architecture/repository/auth_api/auth_repository.dart';
import 'package:flutter_mvvm_architecture/view_model/services/session_manager/session_controller.dart';

class AuthViewModel extends ChangeNotifier {
  final _authRepo = AuthRepository();
  bool _isLoading = false;
  bool get isLoading => _isLoading;

  void setLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  Future<UserModel> _handleApiCall(
    dynamic data,
    Future Function(dynamic) apiCall,
  ) async {
    setLoading(true);
    try {
      setLoading(true);
      final response = await apiCall(data);
      SessionController().saveUserInPreference(data);
      SessionController().getUserFromPreference();
      setLoading(false);
      return response;
    } catch (e) {
      setLoading(false);
      throw Exception(e);
    }
  }

  Future loginApi(dynamic data) async {
    await _handleApiCall(data, _authRepo.loginApi);
  }

  Future registerApi(dynamic data) async {
    await _handleApiCall(data, _authRepo.registerApi);
  }
}
