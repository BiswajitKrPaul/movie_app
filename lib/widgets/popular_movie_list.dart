import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/blocs/movie/movie_search_bloc.dart';
import 'package:movie_app/widgets/movie_item_card.dart';

class PopularMovieList extends StatefulWidget {
  const PopularMovieList({Key? key}) : super(key: key);

  @override
  _PopularMovieListState createState() => _PopularMovieListState();
}

class _PopularMovieListState extends State<PopularMovieList> {
  late ScrollController scrollController;
  late int page = 1;
  late int totalPage;

  @override
  void initState() {
    super.initState();
    scrollController = ScrollController();
    scrollController.addListener(scrollItems);
    final stateValue = BlocProvider.of<MovieSearchBloc>(context).state;
    page = stateValue.page;
    totalPage = stateValue.totalpages;
    if (stateValue.movieItems.isEmpty) {
      context.read<MovieSearchBloc>().add(PopularMovieSearch(stateValue.page));
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MovieSearchBloc, MovieSearchState>(
      builder: (context, state) {
        if (state is MovieSearchInitial) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        if (state is MovieSearchResults) {
          return ListView.builder(
            controller: scrollController,
            itemCount: state.page == state.totalpage
                ? state.moviesList.length
                : state.moviesList.length + 1,
            itemBuilder: (BuildContext context, int index) {
              page = state.page;
              totalPage = state.totalpage;
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
                      overView: state.moviesList[index].overview,
                      id: state.moviesList[index].id.toString(),
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
      if (page != totalPage) {
        context.read<MovieSearchBloc>().add(PopularMovieSearch(page + 1));
      }
    }
  }
}
