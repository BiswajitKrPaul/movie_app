import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/blocs/movie/movie_search_bloc.dart';
import 'package:movie_app/widgets/movie_item_card.dart';

class PopularMovieList extends StatefulWidget {
  const PopularMovieList();

  @override
  _PopularMovieListState createState() => _PopularMovieListState();
}

class _PopularMovieListState extends State<PopularMovieList> {
  late ScrollController scrollController;

  @override
  void initState() {
    super.initState();
    scrollController = ScrollController();
    scrollController.addListener(scrollItems);
    context.read<MovieSearchBloc>().add(const PopularMovieSearch());
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MovieSearchBloc, MovieSearchState>(
      builder: (context, state) {
        if (state.movieItems.isEmpty) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        if (state is MovieSearchResults) {
          return ListView.builder(
            controller: scrollController,
            itemCount: state.moviesList.length + 1,
            itemBuilder: (BuildContext context, int index) {
              return index == state.moviesList.length
                  ? const Center(
                      child: CircularProgressIndicator(),
                    )
                  : MovieItemCardView(
                      index: index,
                      movieName: state.moviesList[index].title,
                      imageUrl: state.moviesList[index].posterPath,
                      rating: state.moviesList[index].voteAverage.toString(),
                      releaseDate: state.moviesList[index].releaseDate,
                    );
            },
          );
        } else {
          return const Center(
            child: Text('Something went wrong'),
          );
        }
      },
    );
  }

  void scrollItems() {
    if (scrollController.position.pixels ==
        scrollController.position.maxScrollExtent) {
      context.read<MovieSearchBloc>().add(const PopularMovieSearch());
    }
  }

  int resultLength(MovieSearchResults state) {
    return state.moviesList.length + 1;
  }
}
