part of 'popular_movie_bloc.dart';

abstract class PopularMovieState extends Equatable {
  final List<Result> movieItems;
  final int page;
  final int totalpages;

  const PopularMovieState(
      {required this.movieItems, required this.page, required this.totalpages});

  @override
  List<Object> get props => [movieItems];
}

class PopularMovieInitial extends PopularMovieState {
  final List<Result> moviesList;
  final int pageno;
  const PopularMovieInitial(this.moviesList, this.pageno)
      : super(movieItems: moviesList, page: pageno, totalpages: 0);
}

class PopularMovieError extends PopularMovieState {
  PopularMovieError() : super(movieItems: [], page: 0, totalpages: 0);
}

class UpcomingMovieResult extends PopularMovieState {
  final List<Result> moviesList;
  final int pageno;
  final int totalpage;
  const UpcomingMovieResult(
      {required this.moviesList, required this.pageno, required this.totalpage})
      : super(movieItems: moviesList, page: pageno, totalpages: totalpage);
}
