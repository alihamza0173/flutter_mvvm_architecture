import 'package:flutter_mvvm_architecture/model/movies_list/movies_model.dart';

abstract class HomeRepository {
  Future<MoviesList> fetchMoviesList();
}
