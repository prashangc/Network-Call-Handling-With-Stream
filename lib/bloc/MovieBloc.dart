import 'dart:async';

import '../api/api_response.dart';
import '../respository/MovieRespository.dart';

class MovieBloc {
  MovieRepository? _movieRepository;

  StreamController<ApiResponse<dynamic>>? _movieListController;

  // StreamSink get movieListSink => _movieListController!.sink;

  StreamSink<ApiResponse<dynamic>> get movieListSink =>
      _movieListController!.sink;
  // StreamSink get movieListSink => _movieListController!.sink;

  Stream<ApiResponse<dynamic>> get movieListStream =>
      _movieListController!.stream;

  // Stream get movieListStream => _movieListController!.stream;

  // MovieBloc() {
  //   _movieListController = StreamController<ApiResponse<List<Movie>>>();
  //   _movieRepository = MovieRepository();
  //   fetchMovieList();
  // }

  fetchMovieList() async {
    _movieListController = StreamController<ApiResponse<dynamic>>();
    _movieRepository = MovieRepository();
    movieListSink.add(ApiResponse.loading('Fetching Popular Movies...'));
    try {
      dynamic movies = await _movieRepository!.fetchMovieList();
      movieListSink.add(ApiResponse.completed(movies));
    } catch (e) {
      movieListSink.add(ApiResponse.error(e.toString()));
      print(e);
    }
  }

  dispose() {
    _movieListController!.close();
  }
}
