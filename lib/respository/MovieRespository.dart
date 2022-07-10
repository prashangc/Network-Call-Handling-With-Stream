import 'package:app/api/api.dart';

class MovieRepository {
  final String _apiKey = "9960f18761c5ea7f93545f47492fc690";

  final ApiBaseHelper _helper = ApiBaseHelper();

  Future<dynamic> fetchMovieList() async {
    final response = await _helper.get("movie/popular?api_key=$_apiKey");
    return response;
  }
}
