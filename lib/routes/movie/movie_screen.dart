import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/blocs/movie/movie_search_bloc.dart';
import 'package:http/http.dart' as http;
import 'package:movie_app/constants/api_constants.dart';
import 'package:movie_app/models/movie_item.dart';

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
      body: Column(
        children: [
          Center(
            child: BlocBuilder<MovieSearchBloc, MovieSearchState>(
              builder: (context, state) {
                return Text(data['id']);
              },
            ),
          ),
          ElevatedButton(
            onPressed: () async {
              final String id = data['id'];
              final Uri uri = Uri.parse('$kApiURL$kMovieIdURL/$id');
              final response = await http.get(uri);
              final movieItem = movieItemFromJson(response.body);
              debugPrint(movieItem.originalTitle);
            },
            child: const Text('Click Me'),
          ),
        ],
      ),
    );
  }
}
