import 'package:app/models/MovieResponse.dart';
import 'package:app/screens/movie/AllMovieList.dart';
import 'package:app/screens/movie/ErrorScreen.dart';
import 'package:flutter/material.dart';

import '../api/api_response.dart';
import '../bloc/MovieBloc.dart';
import 'movie/LoadingScreen.dart';

class MovieScreen extends StatefulWidget {
  const MovieScreen({Key? key}) : super(key: key);

  @override
  State<MovieScreen> createState() => _MovieScreenState();
}

class _MovieScreenState extends State<MovieScreen> {
  MovieBloc? _bloc;

  @override
  void initState() {
    super.initState();
    _bloc = MovieBloc();
    _bloc!.fetchMovieList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Movie App with Bloc"),
        backgroundColor: Colors.black54,
      ),
      body: RefreshIndicator(
        color: Colors.green,
        backgroundColor: Colors.yellow,
        strokeWidth: 4.0,
        onRefresh: () => _bloc!.fetchMovieList(),
        child:
            //   ElevatedButton(
            // style: ElevatedButton.styleFrom(primary: Colors.black54),
            // onPressed: _bloc!.fetchMovieList(),
            // child: Container(
            //   color: Colors.red,
            //   width: maxWidth(context),
            //   height: 200,
            //   child:

            // StreamBuilder<ApiResponse<List<Movie>>>(
            StreamBuilder<ApiResponse<dynamic>>(
          stream: _bloc!.movieListStream,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              switch (snapshot.data!.status) {
                case Status.LOADING:
                  return Loading(
                    loadingMessage: snapshot.data!.message,
                  );
                case Status.COMPLETED:
                  MovieModel movieModel =
                      MovieModel.fromJson(snapshot.data!.data);
                  print(movieModel);
                  print("object");
                  return MovieList(movieList: movieModel);
                case Status.ERROR:
                  return Error(
                    errorMessage: snapshot.data!.message,
                    onRetryPressed: () => _bloc!.fetchMovieList(),
                  );
              }
            }
            return Container();
          },
        ),
      ),
      //  floatingActionButton: FloatingActionButton.extended(
      //   onPressed: () {
      //     // Show refresh indicator programmatically on button tap.
      //     // _refreshIndicatorKey.currentState?.show();
      //   },
      //   icon: const Icon(Icons.refresh),
      //   label: const Text('Show Indicator'),
      // ),
    );
  }

  @override
  void dispose() {
    _bloc!.dispose();
    super.dispose();
  }
}
