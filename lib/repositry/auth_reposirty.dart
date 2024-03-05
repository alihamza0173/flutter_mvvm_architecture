import 'package:flutter_mvvm_architecture/data/network/base_api_service.dart';
import 'package:flutter_mvvm_architecture/data/network/network_api_service.dart';
import 'package:flutter_mvvm_architecture/model/user_model.dart';
import 'package:flutter_mvvm_architecture/res/app_urls.dart';

class AuthRepositry {
  final BaseApiService _apiService = NetworkApiService();

  Future<UserModel> loginApi(dynamic data) async {
    try {
      final res = await _apiService.getPostApiResponse(AppUrl.loginUrl, data);
      return UserModel.fromJson(res);
    } catch (e) {
      rethrow;
    }
  }

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
