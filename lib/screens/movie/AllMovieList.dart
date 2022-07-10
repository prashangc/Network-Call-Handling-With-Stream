import 'package:flutter/material.dart';

import '../../models/MovieResponse.dart';

class MovieList extends StatelessWidget {
  final MovieModel movieList;

  const MovieList({Key? key, required this.movieList}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: movieList.results!.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 1.5 / 1.8,
      ),
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Card(
            child: Padding(
              padding: const EdgeInsets.all(4.0),
              child: Image.network(
                'https://www.nasa.gov/sites/default/files/styles/full_width/public/thumbnails/image/50489833002_107cb9e661_o_0.jpg?itok=PHZvdJj-0',
                fit: BoxFit.fill,
              ),
            ),
          ),
        );
      },
    );
  }
}
