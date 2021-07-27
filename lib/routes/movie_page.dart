import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/blocs/movie/movie_search_bloc.dart';
import 'package:movie_app/constants/theme.dart';
import 'package:movie_app/models/search_movie_item.dart';
import 'package:movie_app/widgets/popular_movie_list.dart';

class MovieHome extends StatefulWidget {
  final String _title;
  const MovieHome(this._title);

  @override
  _MovieHomeState createState() => _MovieHomeState();
}

class _MovieHomeState extends State<MovieHome> {
  @override
  void initState() {
    super.initState();
    context.read<MovieSearchBloc>().add(const PopularMovieSearch());
    //context.read<MovieSearchBloc>().add(const PopularMovieSearch());
  }

  void onLastItem() {
    context.read<MovieSearchBloc>().add(const PopularMovieSearch());
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            widget._title,
          ),
          centerTitle: false,
          bottom: TabBar(
            indicator: const UnderlineTabIndicator(
              borderSide: BorderSide(width: 5, color: kPrimaryYellow),
              insets: EdgeInsets.only(left: 80, right: 90),
            ),
            labelColor: kPrimaryBlack,
            labelStyle: Theme.of(context).primaryTextTheme.headline1,
            unselectedLabelStyle: Theme.of(context).primaryTextTheme.headline2,
            tabs: const [
              Tab(
                text: 'Now Popular',
              ),
              Tab(
                text: 'The Upcoming',
              )
            ],
          ),
        ),
        body: TabBarView(children: [
          BlocBuilder<MovieSearchBloc, MovieSearchState>(
            builder: (context, state) {
              if (state is MovieSearchLoading) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else if (state is MovieSearchResults) {
                return PopularMovieList(
                  movieList: state.moviesList as List<Result>,
                  onLastItem: onLastItem,
                );
              } else if (state is MovieSearchError) {
                return Center(
                  child: Text(state.error.toString()),
                );
              }
              return const Center(
                child: Text('Something Went Wrong'),
              );
            },
          ),
          const Center(
            child: Text('Data'),
          ),
        ]),
      ),
    );
  }
}
