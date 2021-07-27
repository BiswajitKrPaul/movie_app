part of 'movie_search_bloc.dart';

abstract class MovieSearchEvent extends Equatable {
  const MovieSearchEvent();
  @override
  List<Object> get props => [];
}

// TODO: Need to add more events
class PopularMovieSearch extends MovieSearchEvent {
  const PopularMovieSearch();
}

class PopularMovieMoreSearch extends MovieSearchEvent {
  const PopularMovieMoreSearch();
}
