import 'package:flutter_mvvm_architecture/data/network/base_api_service.dart';
import 'package:flutter_mvvm_architecture/data/network/network_api_service.dart';
import 'package:flutter_mvvm_architecture/res/app_urls.dart';

class AuthRepositry {
  final BaseApiService _apiService = NetworkApiService();

  Future loginApi(dynamic data) async {
    try {
      return await _apiService.getPostApiResponse(AppUrl.loginUrl, data);
    } catch (e) {
      rethrow;
    }
  }

  Future registerApi(dynamic data) async {
    try {
      return await _apiService.getPostApiResponse(AppUrl.registerUrl, data);
    } catch (e) {
      rethrow;
    }
  }
}
