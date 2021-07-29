import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/blocs/popularmovies/popular_movie_bloc.dart';

import 'movie_item_card.dart';

class UpcomingMovieList extends StatefulWidget {
  const UpcomingMovieList();

  @override
  _UpcomingMovieListState createState() => _UpcomingMovieListState();
}

class _UpcomingMovieListState extends State<UpcomingMovieList> {
  late ScrollController scrollController;
  late int page = 1;
  late int totalPage;

  @override
  void initState() {
    super.initState();
    scrollController = ScrollController();
    scrollController.addListener(scrollItems);
    final stateValue = BlocProvider.of<PopularMovieBloc>(context).state;
    page = stateValue.page;
    totalPage = stateValue.totalpages;
    if (stateValue.movieItems.isEmpty) {
      context
          .read<PopularMovieBloc>()
          .add(UpcomingMovieSearch(stateValue.page));
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PopularMovieBloc, PopularMovieState>(
      builder: (context, state) {
        if (state is PopularMovieInitial) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        if (state is UpcomingMovieResult) {
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
                    );
            },
          );
        }
        if (state is PopularMovieError) {
          return const Center(
            child: Text('Something went wrong'),
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
        context.read<PopularMovieBloc>().add(UpcomingMovieSearch(page + 1));
      }
    }
  }
}
