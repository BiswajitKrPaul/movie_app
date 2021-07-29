part of 'movie_search_bloc.dart';

abstract class MovieSearchEvent extends Equatable {
  const MovieSearchEvent();
  @override
  List<Object> get props => [];
}

// TODO: Need to add more events
class PopularMovieSearch extends MovieSearchEvent {
  final int oldPage;
  const PopularMovieSearch(this.oldPage);
}

class PopularMovieMoreSearch extends MovieSearchEvent {
  final List<Result> oldData;
  final int oldPage;
  const PopularMovieMoreSearch(this.oldData, this.oldPage);
}
