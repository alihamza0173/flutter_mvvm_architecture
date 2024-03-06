import 'package:flutter/material.dart';
import 'package:flutter_mvvm_architecture/data/response/api_response.dart';
import 'package:flutter_mvvm_architecture/model/movies_model.dart';
import 'package:flutter_mvvm_architecture/repositry/home_repositry.dart';

class HomeViewModel with ChangeNotifier {
  final _homeRepo = HomeRepositry();
  ApiResponse<MoviesList?> _moviesList = ApiResponse.loading();
  ApiResponse<MoviesList?> get moviesList => _moviesList;

  void _setMoviesList(ApiResponse<MoviesList> response) {
    _moviesList = response;
    notifyListeners();
  }

  Future<void> fetchMoviesList() async {
    _homeRepo.fetchMoviesList().then(
      (value) {
        _setMoviesList(ApiResponse.completed(value));
      },
    ).onError(
      (error, stackTrace) {
        _setMoviesList(ApiResponse.error(error.toString()));
      },
    );
  }
}
