import 'package:flutter_mvvm_architecture/configs/app_urls.dart';
import 'package:flutter_mvvm_architecture/data/network/base_api_service.dart';
import 'package:flutter_mvvm_architecture/data/network/network_api_service.dart';
import 'package:flutter_mvvm_architecture/model/users_list/user_model.dart';
import 'package:flutter_mvvm_architecture/repository/auth_api/auth_repository.dart';

class AuthServices extends AuthRepository {
  final BaseApiService _apiService = NetworkApiService();

  @override
  Future<UserModel> loginApi(dynamic data) async {
    try {
      final res = await _apiService.getPostApiResponse(AppUrl.loginUrl, data);
      return UserModel.fromJson(res);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<UserModel> registerApi(dynamic data) async {
    try {
      final res =
          await _apiService.getPostApiResponse(AppUrl.registerUrl, data);
      return UserModel.fromJson(res);
    } catch (e) {
      rethrow;
    }
  }
}
