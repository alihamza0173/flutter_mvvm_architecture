import 'package:flutter_mvvm_architecture/configs/app_urls.dart';
import 'package:flutter_mvvm_architecture/data/network/base_api_service.dart';
import 'package:flutter_mvvm_architecture/data/network/network_api_service.dart';
import 'package:flutter_mvvm_architecture/model/movies_list/movies_model.dart';

class HomeRepository {
  final BaseApiService _apiService = NetworkApiService();

  Future<MoviesList> fetchMoviesList() async {
    try {
      final res = await _apiService.getGetApiResponse(AppUrl.moviesListUrl);
      return MoviesList.fromJson(res);
    } catch (e) {
      rethrow;
    }
  }
}