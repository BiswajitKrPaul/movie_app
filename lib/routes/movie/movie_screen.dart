import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/blocs/movieItem/movie_item_bloc.dart';

class MovieScreen extends StatefulWidget {
  static const String routeName = 'MovieScreen';

  const MovieScreen({Key? key}) : super(key: key);

  @override
  _MovieScreenState createState() => _MovieScreenState();
}

class _MovieScreenState extends State<MovieScreen> {
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final data =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    context.read<MovieItemBloc>().add(GetMovieData(id: data['id']));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Movie'),
      ),
      body: Column(
        children: [
          Center(
            child: BlocBuilder<MovieItemBloc, MovieItemState>(
              builder: (context, state) {
                if (state is MovieItemInitial) {
                  return const CircularProgressIndicator();
                } else if (state is MovieItemLoaded) {
                  return Center(
                    child: Text(state.movieData.title),
                  );
                } else if (state is MovieItemError) {
                  return Text(state.error);
                } else {
                  return Container();
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
