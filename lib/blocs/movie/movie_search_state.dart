part of 'movie_search_bloc.dart';

abstract class MovieSearchState extends Equatable {
  final List<Result> movieItems;
  final String page;

  const MovieSearchState({required this.movieItems, required this.page});

  @override
  List<Object> get props => [movieItems];
}

class MovieSearchInitial extends MovieSearchState {
  final List<Result> moviesList;

  const MovieSearchInitial(this.moviesList)
      : super(movieItems: moviesList, page: '1');
}

class MovieSearchLoading extends MovieSearchState {
  MovieSearchLoading() : super(movieItems: [], page: '1');
}

class MovieSearchResults extends MovieSearchState {
  final List<Result> moviesList;
  final String pageno;
  const MovieSearchResults({required this.moviesList, required this.pageno})
      : super(movieItems: moviesList, page: pageno);
}
