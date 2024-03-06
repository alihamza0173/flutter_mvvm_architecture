class MoviesList {
  List<Movies>? movies;

  MoviesList(this.movies);

  factory MoviesList.fromJson(Map<String, dynamic> json) {
    return MoviesList(List<Movies>.from(
      json['movies'].map((movie) => Movies.fromJson(movie)),
    ));
  }
}

class Movies {
  String? id;
  String? title;
  String? year;
  List<dynamic>? genres;
  List<dynamic>? ratings;
  String? poster;
  dynamic contentRating;
  String? duration;
  String? releaseDate;
  dynamic averageRating;
  String? originalTitle;
  String? storyline;
  List<dynamic>? actors;
  dynamic imdbRating;
  String? posterurl;

  Movies(
      {this.id,
      this.title,
      this.year,
      this.genres,
      this.ratings,
      this.poster,
      this.contentRating,
      this.duration,
      this.releaseDate,
      this.averageRating,
      this.originalTitle,
      this.storyline,
      this.actors,
      this.imdbRating,
      this.posterurl});

  Movies.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    year = json['year'];
    genres = json['genres'];
    ratings = json['ratings'];
    poster = json['poster'];
    contentRating = json['contentRating'];
    duration = json['duration'];
    releaseDate = json['releaseDate'];
    averageRating = json['averageRating'];
    originalTitle = json['originalTitle'];
    storyline = json['storyline'];
    actors = json['actors'];
    imdbRating = json['imdbRating'];
    posterurl = json['posterurl'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    data['year'] = year;
    data['genres'] = genres;
    data['ratings'] = ratings;
    data['poster'] = poster;
    data['contentRating'] = contentRating;
    data['duration'] = duration;
    data['releaseDate'] = releaseDate;
    data['averageRating'] = averageRating;
    data['originalTitle'] = originalTitle;
    data['storyline'] = storyline;
    data['actors'] = actors;
    data['imdbRating'] = imdbRating;
    data['posterurl'] = posterurl;
    return data;
  }
}
