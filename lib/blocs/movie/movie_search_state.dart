part of 'movie_search_bloc.dart';

abstract class MovieSearchState extends Equatable {
  const MovieSearchState();

  @override
  List<Object> get props => [];
}

class MovieSearchInitial extends MovieSearchState {}

class MovieSearchLoading extends MovieSearchState {
  const MovieSearchLoading();
}

class MovieSearchResults extends MovieSearchState {
  final List moviesList;
  const MovieSearchResults({required this.moviesList});
}

class MovieSearchError extends MovieSearchState {
  final String error;
  const MovieSearchError(this.error);
}
