import 'package:flutter_mvvm_architecture/data/network/base_api_service.dart';
import 'package:flutter_mvvm_architecture/data/network/network_api_service.dart';
import 'package:flutter_mvvm_architecture/model/movies_model.dart';
import 'package:flutter_mvvm_architecture/res/app_urls.dart';

class HomeRepositry {
  final BaseApiService _apiService = NetworkApiService();

  Future<MoviesModel> fetchMoviesList() async {
    try {
      final res = await _apiService.getGetApiResponse(AppUrl.moviesListUrl);
      return MoviesModel.fromJson(res);
    } catch (e) {
      rethrow;
    }
  }
}
