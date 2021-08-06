import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/blocs/movie/movie_search_bloc.dart';

class MovieScreen extends StatelessWidget {
  static const String routeName = 'MovieScreen';

  const MovieScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final data =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Movie'),
      ),
      body: Center(
        child: BlocBuilder<MovieSearchBloc, MovieSearchState>(
          builder: (context, state) {
            return Text(data['id']);
          },
        ),
      ),
    );
  }
}
