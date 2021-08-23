part of 'movie_item_bloc.dart';

abstract class MovieItemState {
  const MovieItemState();
}

class MovieItemInitial extends MovieItemState {}

class MovieItemLoaded extends MovieItemState {
  MovieItem movieData;
  MovieItemLoaded({
    required this.movieData,
  });
}

class MovieItemError extends MovieItemState {
  String error;
  MovieItemError({
    required this.error,
  });
}
