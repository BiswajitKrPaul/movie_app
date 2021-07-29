part of 'popular_movie_bloc.dart';

abstract class PopularMovieEvent extends Equatable {
  const PopularMovieEvent();

  @override
  List<Object> get props => [];
}

class UpcomingMovieSearch extends PopularMovieEvent {
  final int oldPage;
  const UpcomingMovieSearch(this.oldPage);
}
