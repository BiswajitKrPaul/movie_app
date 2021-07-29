part of 'movie_search_bloc.dart';

abstract class MovieSearchState extends Equatable {
  final List<Result> movieItems;
  final int page;
  final int totalpages;

  const MovieSearchState(
      {required this.movieItems, required this.page, required this.totalpages});

  @override
  List<Object> get props => [movieItems];
}

class MovieSearchInitial extends MovieSearchState {
  final List<Result> moviesList;
  final int pageno;
  const MovieSearchInitial(this.moviesList, this.pageno)
      : super(movieItems: moviesList, page: pageno, totalpages: 0);
}

class MovieSearchError extends MovieSearchState {
  MovieSearchError() : super(movieItems: [], page: 0, totalpages: 0);
}

class MovieSearchLoading extends MovieSearchState {
  MovieSearchLoading() : super(movieItems: [], page: 0, totalpages: 0);
}

class MovieSearchResults extends MovieSearchState {
  final List<Result> moviesList;
  final int pageno;
  final int totalpage;
  const MovieSearchResults(
      {required this.moviesList, required this.pageno, required this.totalpage})
      : super(movieItems: moviesList, page: pageno, totalpages: totalpage);
}
