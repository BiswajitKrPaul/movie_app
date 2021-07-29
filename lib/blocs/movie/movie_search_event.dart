part of 'movie_search_bloc.dart';

abstract class MovieSearchEvent extends Equatable {
  const MovieSearchEvent();
  @override
  List<Object> get props => [];
}

class PopularMovieSearch extends MovieSearchEvent {
  final int oldPage;
  const PopularMovieSearch(this.oldPage);
}
